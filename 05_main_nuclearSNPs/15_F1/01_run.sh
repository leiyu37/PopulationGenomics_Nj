#!/bin/bash
#SBATCH --job-name=fixedDiff
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=120G
#SBATCH --time=48:00:00
#SBATCH --output=fixedDiff.out
#SBATCH --error=fixedDiff.err
#SBATCH --partition=base

cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/15_F1

module load gcc12-env/12.3.0

module load miniconda3/23.5.2

conda activate my_vcftools_env

chmod 700 01_fixedPos.py
./01_fixedPos.py

vcftools --vcf /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/09_rmS/03_LowMissing.recode.vcf \
--positions  fixedPOS.txt \
--recode \
--recode-INFO-all \
--out 01_fixedSNP

chmod 700 02_hetProportion.py
./02_hetProportion.py

conda deactivate
