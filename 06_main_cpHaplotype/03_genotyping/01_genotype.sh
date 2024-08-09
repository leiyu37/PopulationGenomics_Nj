#!/bin/bash
#SBATCH --job-name=cp_genotype
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=125G
#SBATCH --time=48:00:00
#SBATCH --output=cp_genotype.out
#SBATCH --error=cp_genotype.err
#SBATCH --partition=base

cd /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/03_genotyping

module load gcc12-env/12.3.0

module load python/3.11.5

module load openjdk/17.0.5_8

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx110G" CombineGVCFs -R /gxfs_work/geomar/smomw353/ref_ZJcp/sequence.fasta \
-O 01_merge.g.vcf.gz \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO13.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO25.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO26.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO27.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO28.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO31.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/AGO9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG12.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG13.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG26.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG27.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/BG7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY1-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY1-10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY1-14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY1-20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY1-30.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY1-5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY2-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY2-14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY2-7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY3-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY3-13.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY3-16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY3-31.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY3-38.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DY3-9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DYI1-26.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DYhekou2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DYhekou4-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DYhekou6-7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/DYhekou7-2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM13.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM22.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM26.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM31.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM33.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM35.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM37.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM40.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM42.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM45.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GX-GM6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD12.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD26.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/GXPD8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ1-3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ10-8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ3-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ4-4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ5-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ6-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ6-11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ6-3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ6-5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ6-6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ6-8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ6-9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ7-1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ7-7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/HQ8-3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat22.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat25.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat26.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat27.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/02_kat30/Kat30.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Kat9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Koje-1-5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Koje-1-6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Koje-1-9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Koje01.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Koje02.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Koje08.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan12.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan13.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan30.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan32.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan34.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan35.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Nan9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA22.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA25.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA45.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA48.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OHA7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI22.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI25.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/OKI9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN22.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN27.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN33.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN41.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/ONN9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI22.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI28.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/SCI9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK12.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK13.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK25.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK27.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK31.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/TOK9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR23.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR24.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR27.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR30.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR32.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/WJR9.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW1.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW25.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW29.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW31.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW35.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW37.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW39.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW43.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW45.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW51.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW55.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW57.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW59.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/XSW7.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul-1-17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul-1-19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul-2-15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul-2-16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul-2-18.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul-2-2.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul1-13.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul1-14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul1-15.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul1-16.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-10.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-11.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-12.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-14.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-17.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-19.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-20.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-21.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-22.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-3.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-4.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-5.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-6.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-8.g.vcf \
--variant /gxfs_work/geomar/smomw353/zjspeciation/cpAnalyses/01_cphap/Yul2-9.g.vcf


$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx80G" GenotypeGVCFs -R /gxfs_work/geomar/smomw353/ref_ZJcp/sequence.fasta -V ./01_merge.g.vcf.gz -O ./02_raw.vcf

bcftools filter --SnpGap 10 -o 03_indelDistance.vcf -O v ./02_raw.vcf

$HOME/tools/gatk-4.4.0.0/gatk --java-options "-Xmx96G" SelectVariants \
-R /gxfs_work/geomar/smomw353/ref_ZJcp/sequence.fasta \
-V 03_indelDistance.vcf \
-O 04_snp.vcf \
--select-type-to-include SNP

vcftools --vcf ./04_snp.vcf --min-alleles 2 --max-alleles 2 --recode-INFO-all --recode --out 05_biAlle

vcftools --vcf ./05_biAlle.recode.vcf \
--recode \
--recode-INFO-all \
--out 06_rmS \
--remove ./rmS_list.txt

vcftools --vcf ./06_rmS.recode.vcf --minDP 30 --recode-INFO-all --recode --out 07_filterDP

vcftools --vcf ./07_filterDP.recode.vcf --max-missing 1.0 --recode-INFO-all --recode --out 08_rmMissing

vcftools --vcf ./08_rmMissing.recode.vcf \
--mac 1 \
--recode \
--recode-INFO-all \
--out 09_mac1
