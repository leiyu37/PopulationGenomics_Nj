#!/bin/bash
#SBATCH --job-name=pca
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=120G
#SBATCH --time=48:00:00
#SBATCH --output=pca.out
#SBATCH --error=pca.err
#SBATCH --partition=base

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/10_pca

plink --vcf /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/09_rmS/03_LowMissing.recode.vcf --double-id --allow-extra-chr --set-missing-var-ids @:# \
--make-bed --pca --out pca
