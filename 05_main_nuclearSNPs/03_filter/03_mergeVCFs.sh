#!/bin/bash
#SBATCH --job-name=geno
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G
#SBATCH --time=200:00:00
#SBATCH --output=geno.out
#SBATCH --error=geno.err
#SBATCH --partition=base
#SBATCH --qos=long

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/03_filter

module load gcc12-env/12.3.0

module load python/3.11.5

module load openjdk/17.0.5_8

module load R/4.3.1

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx80G" GatherVcfs \
-I /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/01_geno/Chr01/02_Chr01_raw.vcf.gz \
-I /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/01_geno/Chr02/02_Chr02_raw.vcf.gz \
-I /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/01_geno/Chr03/02_Chr03_raw.vcf.gz \
-I /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/01_geno/Chr04/02_Chr04_raw.vcf.gz \
-I /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/01_geno/Chr05/02_Chr05_raw.vcf.gz \
-I /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/01_geno/Chr06/02_Chr06_raw.vcf.gz \
-O ./01_all_raw.vcf.gz

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx110G" IndexFeatureFile -I ./01_all_raw.vcf.gz

$HOME/tools/gatk-4.4.0.0/gatk  --java-options "-Xmx96G" VariantsToTable \
-R /gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa \
-V ./01_all_raw.vcf.gz \
-O ./01_Rtable.txt \
-F CHROM -F POS -F FILTER -F QD -F MQ -F FS -F SOR -F MQRankSum -F ReadPosRankSum -F DP

chmod 700 RtablePlots.r
./RtablePlots.r
