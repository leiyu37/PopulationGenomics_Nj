
### genome assembly and annotation for Zostera_japonica

#gapclosing
TGS-GapCloser.sh --scaff scaffolds.fa --reads input.subreads.fq.gz --output gapfill \
--racon racon \
--ngs ngs.fq.gz \
--tgstype pb --thread 80 --min_nread 3
mv gapfill.scaff_seqs gapfill.fa

#polish
pbmm2 align --sort -m 10G -J 20 
--preset SUBREAD -j 80 --log-file pbmm2.log \
gapfill.fa input.subreads.bam pb_align.subreads.bam

gcpp -r gapfill.fa -o gapfill.arrow.fa \
-x 10 --algorithm arrow \
-j 80 --log-file arrow.log \
pb_align.subreads.bam

bwa index gapfill.arrow.fa

bwa mem -t 80 gapfill.arrow.fa \
	NGS_1.fq.gz NGS_2.fq.gz | \
	samblaster  | \
	sambamba view -S -f bam -l 0 /dev/stdin  | \
	sambamba sort --tmpdir=./ -t 80 -m 64G -o NGS.bam /dev/stdin

freebayes --bam NGS.bam -f gapfill.arrow.fa | bcftools view -Ob -o NGS.bcf

bcftools view --no-version -Ou -e'type="ref"' NGS.bcf | bcftools norm -Ob -f gapfill.arrow.fa \
-o NGS.norm.bcf

bcftools index -f NGS.norm.bcf

bcftools consensus -i'QUAL>=30 & FMT/DP>=10 & (GT="AA" | GT="Aa")' -H LA -f gapfill.arrow.fa NGS.norm.bcf > freebayes.fasta

bwa index freebayes.fasta

bwa mem -t 80 freebayes.fasta \
	NGS_1.fq.gz NGS_2.fq.gz | \
	samblaster  | \
	sambamba view -S -f bam -l 0 /dev/stdin  | \
	sambamba sort --tmpdir=./ -t 80 -m 64G -o NGS.bam /dev/stdin

java -Xmx180g -jar pilon.jar --genome freebayes.fasta \
    --frags NGS.bam \
    --output pilon \
    --minmq 20 --minqual 13 \
    --changes --diploid \
    --threads 80
mv pilon.fasta final_chr.fa


# TE & gene prediction and annotation
Trinity --seqType fq --max_memory 100G --left rna_1.fq.gz --right rna_2.fq.gz --CPU 80

$TransDecoder/TransDecoder.LongOrfs -t Trinity.fa
$TransDecoder/TransDecoder.Predict -t Trinity.fa

EDTA.pl --genome final_chr.fa --cds Trinity.fa.transdecoder.cds --sensitive 1 --anno 1 --threads 80

RepeatMasker -pa 80 -dir . -xsmall -lib final_chr.fa.mod.EDTA.TElib.fa -gff final_chr.fa

grep -v -P "Simple_repeat|Low_complexity" repeats.gff >repeats_nolow.gff3

bedtools maskfasta -fi final_chr.fa -fo final_chr.SM.fa -bed repeats_nolow.gff3 -soft

hisat2-build -p 80 final_chr.SM.fa genome_index && \
hisat2 -p 80 --dta -x genome_index -1 rna_1.fq.gz -2 rna_2.fq.gz 2>rna.logs | \
    sambamba view -S -f bam -l 0 /dev/stdin  | \
    sambamba sort --tmpdir=./ -t 80 -m 64G -o rna_to_genome.bam /dev/stdin

minimap2 -a -x splice:hq -t 80 final_chr.SM.fa iso_seq.fa | \
    sambamba view -S -f bam -l 0 /dev/stdin  | \
	sambamba sort --tmpdir=./ -t 80 -m 64G -o iso_to_genome.bam /dev/stdin

stringtie --mix -p 80 -o stringtie.gtf rna_to_genome.bam iso_to_genome.bam

$TransDecoder/util/gtf_genome_to_cdna_fasta.pl stringtie.gtf final_chr.SM.fa > transcripts.fasta
$TransDecoder/util/gtf_to_alignment_gff3.pl stringtie.gtf > stringtie.gff3
$TransDecoder/TransDecoder.LongOrfs -t transcripts.fasta
$TransDecoder/TransDecoder.Predict -t transcripts.fasta
$TransDecoder/util/cdna_alignment_orf_to_genome_orf.pl \
    transcripts.fasta.transdecoder.gff3 \
    stringtie.gff3 \
    transcripts.fasta > transdecoder.genome.gff3

braker.pl --species="Zostera_japonica" \
	--genome=final_chr.SM.fa \
	--prot_seq=odb10_plants.fa \
	--bam=rna_to_genome.bam \
	--etpmode --softmasking \
	--cores=80 --gff3 \
	--workingdir=braker2 \
	--filterOutShort
	
metaeuk easy-predict \
	final_chr.SM.fa hom.pep metaeuk tmp --max-intron 100000 --metaeuk-eval 1e-10

funannotate train \
    -i final_chr.SM.fa \
    -o funannotate \
    -l rna_1.fq.gz -r rna_2.fq.gz \
    --no_normalize_reads --no_trimmomatic \
    --trinity Trinity.fa \
    --pasa_db mysql --max_intronlen 100000 \
    --species "Zostera_japonica" \
    --cpus 80
funannotate predict \
	-i funannotate -o funannotate -s "Zostera_japonica" --name ZjaN --cpu 80 \
	-w codingquarry:0 hiq:2 pasa:12 exonerate:2 \
	--busco_db embryophyta \
	--organism other --ploidy 2 \
	--max_intronlen 100000 --min_intronlen 20 --keep_evm \
	--protein_alignments prot_align.gff3 \
	--genemark_gtf genemark.gtf \
	--other_gff augustus.hints.gff3:3 transdecoder.genome.gff3:3 \
    --force
funannotate update \
	-i funannotate --cpus 80 \
	--no_trimmomatic --no_normalize_reads \
	--max_intronlen 100000 \
	--pasa_db mysql
funannotate annotate -i funannotate --cpus 80 \
  -a uniprot.tsv \
  --eggnog emapper.annotations \
  --iprscan itprsc.xml \
  --busco_db embryophyta \
  --force

