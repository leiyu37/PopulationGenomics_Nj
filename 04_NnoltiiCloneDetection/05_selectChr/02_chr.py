#!/usr/bin/env python3

f_in = open("/gxfs_work/geomar/smomw353/projectZJ_final_v2/01_ncAnalyses/02_ZNgenotype/02_filtering/08_mac1.recode.vcf")
f_out = open("10_Chr.vcf", "w")

for line in f_in.readlines():
    if line.startswith("#") or line.startswith("Chr0"):
        f_out.write(line)

f_in.close()
f_out.close()
