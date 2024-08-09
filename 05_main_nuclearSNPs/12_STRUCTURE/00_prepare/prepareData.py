#!/usr/bin/env python3
vcf_path = "../03_randomSelectSNP.vcf"

f_in = open(vcf_path)
f_out = open("indv.txt", "w")

for line in f_in.readlines():
    if line.startswith("#CHROM"):
        columns = line.split()
        for i in range(9, len(columns)):
            sample = columns[i]
            f_out.write("{}\n".format(sample))
        break
f_in.close()
f_out.close()
