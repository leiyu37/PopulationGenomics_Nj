#!/usr/bin/env python3
import sys
import subprocess

vcf_path = sys.argv[1]
name = sys.argv[2]

cmd = "vcftools --vcf {} --indv {} --out {} --recode --recode-INFO-all".format(vcf_path, name, name)
subprocess.call(cmd, shell=True)


vcf_path = "./{}.recode.vcf".format(name)

f_in = open(vcf_path)
for line in f_in.readlines():
    if line.startswith("#CHROM"):
        columns = line.split()
        for i in range(9, len(columns)):
            if columns[i] == name:
                i_target = i
                break 
        break
f_in.close()

n_total = 0
n = 0
n_het = 0
f_in = open(vcf_path)
for line in f_in.readlines():
    if not line.startswith("#"):
        n_total += 1
        columns = line.split()
        genotype = columns[i_target][0] + columns[i_target][2]
        if genotype in ["01", "10", "00", "11"]:
            n += 1
            if genotype in ["01", "10"]:
                n_het += 1
f_in.close()

f_out = open("{}_mRateHet.txt".format(name), "w")
f_out.write("{}\t{}\t{}\t{}\t{}\t{}\n".format(n_total, n, round(n/n_total, 4), n_het, round(n_het/n, 4), name))
f_out.close()
