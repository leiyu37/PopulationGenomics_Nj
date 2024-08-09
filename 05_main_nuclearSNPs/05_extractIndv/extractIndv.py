#!/usr/bin/env python3
import sys

def extractIndv(vcf_path, sample, out_path):

    f_in = open(vcf_path)
    f_out = open(out_path, "w")
    for line in f_in.readlines():
        if not line.startswith("#"):
            columns = line.split()
            geno = columns[i_target][0] + columns[i_target][2]
            if geno in ["00", "01", "10", "11"]:
                f_out.write("{}\n".format(geno))
            else:
                f_out.write("Y\n")
        elif line.startswith("#CHROM"):
            columns = line.split()
            for i in range(9, len(columns)):
                if columns[i] == sample:
                    i_target = i
    f_in.close()
    f_out.close()

sample = sys.argv[1]

#run the calculation
out_path = "{}_indv.txt".format(sample)
extractIndv("./{}.recode.vcf".format(sample), sample, out_path)
