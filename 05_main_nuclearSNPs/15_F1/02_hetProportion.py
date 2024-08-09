#!/usr/bin/env python3
import subprocess

target_list = []
f_in = open("./ZJ_I.txt")
for line in f_in.readlines():
    taxon = line.strip()
    target_list.append(taxon)
f_in.close()

vcf_path = "./01_fixedSNP.recode.vcf"

cmd = "head -3000 {} >head.txt".format(vcf_path)
subprocess.call(cmd, shell = True)

sample_i_dict = {}
f_in = open("./head.txt")
for line in f_in.readlines():
    if line.startswith("#CHROM"):
        columns = line.split()
        for i in range(9, len(columns)):
            sample_i_dict[columns[i]] = i
        break
f_in.close()

cmd = "rm ./head.txt"
subprocess.call(cmd, shell = True)

f_out = open("02_hetProportion.txt", "w")
f_out.write("Sample\tn\tn_het\tf_het\n")
for sample in target_list:
    n = 0
    n_het = 0

    f_in = open(vcf_path)
    for line in f_in.readlines():
        if not line.startswith("#"):
            columns = line.split()
            geno = columns[sample_i_dict[sample]][0] + columns[sample_i_dict[sample]][2]
            if geno in ["01", "10", "00", "11"]:
                n += 1
                if geno in ["01", "10"]:
                    n_het += 1
    f_in.close()

    f_out.write("{}\t{}\t{}\t{}\n".format(sample, n, n_het, n_het/n))

f_out.close()
