#!/bin/bash
#SBATCH --job-name=ibs
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=120G
#SBATCH --time=48:00:00
#SBATCH --output=ibs.out
#SBATCH --error=ibs.err
#SBATCH --partition=base

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/11_njTree

plink --vcf ../09_rmS/03_LowMissing.recode.vcf --distance 1-ibs
