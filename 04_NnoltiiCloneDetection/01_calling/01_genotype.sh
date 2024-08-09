#!/bin/bash
#SBATCH --job-name=ZNgeno
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G
#SBATCH --time=200:00:00
#SBATCH --output=ZNgeno.out
#SBATCH --error=ZNgeno.err
#SBATCH --partition=base
#SBATCH --qos=long

cd /gxfs_work/geomar/smomw353/projectZJ_final_v2/01_ncAnalyses/02_ZNgenotype/01_calling

module load gcc12-env/12.3.0

module load python/3.11.5

module load openjdk/17.0.5_8

module load R/4.3.1

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx110G" CombineGVCFs -R /gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN01.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN02.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN03.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN05.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN06.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN07.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN08.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN09.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN10.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN11.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN12.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN13.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN14.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN15.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN16.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN17.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/unfinished/03_cp/00_gvcfgz/ZN18.g.vcf.gz \
-O 01_ZN.g.vcf.gz

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx80G" GenotypeGVCFs -R /gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa -V ./01_ZN.g.vcf.gz -O ./02_ZN_raw.vcf.gz

$HOME/tools/gatk-4.4.0.0/gatk  --java-options "-Xmx96G" VariantsToTable \
-R /gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa \
-V ./02_ZN_raw.vcf.gz \
-O ./01_Rtable.txt \
-F CHROM -F POS -F FILTER -F QD -F MQ -F FS -F SOR -F MQRankSum -F ReadPosRankSum -F DP

chmod 700 RtablePlots.r
./RtablePlots.r
