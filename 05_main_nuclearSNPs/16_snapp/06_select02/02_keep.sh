#!/bin/bash
#SBATCH --job-name=select02
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=120G
#SBATCH --time=48:00:00
#SBATCH --output=select02.out
#SBATCH --error=select02.err
#SBATCH --partition=base

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/16_snapp/06_select02

module load gcc12-env/12.3.0

module load miniconda3/23.5.2

conda activate my_vcftools_env

vcftools --vcf /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/16_snapp/03_filter/11_LowMissing.recode.vcf \
--recode \
--recode-INFO-all \
--out 01_keep \
--keep ./target_list.txt

vcftools --vcf ./01_keep.recode.vcf \
--mac 1 \
--recode \
--recode-INFO-all \
--out 02_mac1

vcftools --vcf ./02_mac1.recode.vcf --max-missing 1.0 --recode-INFO-all --recode --out 03_noMissing

vcftools --vcf ./03_noMissing.recode.vcf --thin 5000 --recode-INFO-all --recode --out 04_thin5000

conda deactivate
