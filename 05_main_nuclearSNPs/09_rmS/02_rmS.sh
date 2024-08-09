#!/bin/bash
#SBATCH --job-name=rmS
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=120G
#SBATCH --time=48:00:00
#SBATCH --output=rmS.out
#SBATCH --error=rmS.err
#SBATCH --partition=base

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/09_rmS

module load gcc12-env/12.3.0

module load miniconda3/23.5.2

conda activate my_vcftools_env

vcftools --vcf /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/03_filter/11_LowMissing.recode.vcf \
--recode \
--recode-INFO-all \
--out 01_rmS \
--remove ./rmS_list.txt

vcftools --vcf ./01_rmS.recode.vcf \
--mac 1 \
--recode \
--recode-INFO-all \
--out 02_mac1

vcftools --vcf ./02_mac1.recode.vcf --max-missing 0.9 --recode-INFO-all --recode --out 03_LowMissing

conda deactivate
