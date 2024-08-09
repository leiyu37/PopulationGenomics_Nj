head -1000 /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/03_filter/08_mac1.recode.vcf | grep "#CHROM" >01_all.txt

head -1000 /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/03_filter/11_LowMissing.recode.vcf | grep "#CHROM" >02_rmHmissing.txt

head -1000 /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/09_rmS/03_LowMissing.recode.vcf | grep "#CHROM" >03_final.txt
