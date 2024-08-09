#!/bin/bash
#SBATCH --job-name=selectSTR
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=120G
#SBATCH --time=48:00:00
#SBATCH --output=selectSTR.out
#SBATCH --error=selectSTR.err
#SBATCH --partition=base

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/12_STRUCTURE

module load gcc12-env/12.3.0

module load miniconda3/23.5.2

conda activate my_vcftools_env

vcftools --vcf /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/09_rmS/03_LowMissing.recode.vcf --maf 0.20 --recode-INFO-all --recode --out 01_maf20

vcftools --vcf ./01_maf20.recode.vcf --thin 5000 --recode-INFO-all --recode --out 02_thin5000

chmod 700 02_randomSelect.py
./02_randomSelect.py

conda deactivate
