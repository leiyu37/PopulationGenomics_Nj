#!/bin/bash
#SBATCH --job-name=filter
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G
#SBATCH --time=200:00:00
#SBATCH --output=filter.out
#SBATCH --error=filter.err
#SBATCH --partition=base
#SBATCH --qos=long

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/03_filter

module load gcc12-env/12.3.0

module load python/3.11.5

module load openjdk/17.0.5_8

module load miniconda3/23.5.2

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx96G" VariantFiltration \
-R /gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa \
-V ./01_all_raw.vcf.gz \
-O 03_markfilter.vcf.gz \
--filter-expression "QD < 10.0" \
--filter-name "QD_S" \
--filter-expression "FS > 60.0" \
--filter-name "FS_L" \
--filter-expression "SOR > 3.0" \
--filter-name "SOR_L" \
--filter-expression "MQ < 40.0" \
--filter-name "MQ_L" \
--filter-expression "MQRankSum > 2.5" \
--filter-name "MQRankSum_L" \
--filter-expression "MQRankSum < -2.5" \
--filter-name "MQRankSum_S" \
--filter-expression "ReadPosRankSum > 2.5" \
--filter-name "ReadPosRankSum_L" \
--filter-expression "ReadPosRankSum < -2.5" \
--filter-name "ReadPosRankSum_S" \
--filter-expression "DP > 8327.8" \
--filter-name "DP_L"

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx96G" SelectVariants \
-R /gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa \
-V 03_markfilter.vcf.gz \
-O 04_rmfilter.vcf \
--exclude-filtered true

bcftools filter --SnpGap 20 -o 05_indelDistance.vcf -O v ./04_rmfilter.vcf

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx96G" SelectVariants \
-R /gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa \
-V 05_indelDistance.vcf \
-O 06_snp.vcf \
--select-type-to-include SNP

conda activate my_vcftools_env

vcftools --vcf ./06_snp.vcf --min-alleles 2 --max-alleles 2 --minGQ 30 --minDP 10 --recode-INFO-all --recode --out 07_HQSNP

vcftools --vcf ./07_HQSNP.recode.vcf \
--mac 1 \
--recode \
--recode-INFO-all \
--out 08_mac1

vcftools --vcf ./08_mac1.recode.vcf \
--recode \
--recode-INFO-all \
--out 09_rmS \
--remove-indv Nan6 \
--remove-indv Nan7 \
--remove-indv OKI24

vcftools --vcf ./09_rmS.recode.vcf \
--mac 1 \
--recode \
--recode-INFO-all \
--out 10_mac1

vcftools --vcf ./10_mac1.recode.vcf --max-missing 0.9 --recode-INFO-all --recode --out 11_LowMissing

conda deactivate
