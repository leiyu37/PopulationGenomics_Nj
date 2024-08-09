#!/usr/bin/env python3
import sys

vcf_path = "./{}.recode.vcf".format(sys.argv[1])

n = 0
n_na = 0

f_out = open("mRate_{}.txt".format(sys.argv[1]), "w")
f_out.write("Sample\tn_total\tn_na\tf_na\n")

    
f_in = open(vcf_path)
for line in f_in.readlines():
    if not line.startswith("#"):
        n += 1
        columns = line.split()
        genotype = columns[9][0] + columns[9][2]
        if genotype not in ["01", "10", "00", "11"]:
            n_na += 1

f_in.close()

f_na = n_na/n
f_out.write("{}\t{}\t{}\t{}\n".format(sys.argv[1], n, n_na, f_na))
f_out.close()
