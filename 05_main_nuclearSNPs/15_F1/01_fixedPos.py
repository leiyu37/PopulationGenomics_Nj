#!/usr/bin/env python3
import subprocess

n_list = []
f_in = open("./ZJ_N.txt")
for line in f_in.readlines():
    taxon = line.strip()
    n_list.append(taxon)
f_in.close()

s_list = []
f_in = open("./ZJ_S.txt")
for line in f_in.readlines():
    taxon = line.strip()
    s_list.append(taxon)
f_in.close()


vcf_path = "/gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/09_rmS/03_LowMissing.recode.vcf"

cmd = "head -3000 {} >head.txt".format(vcf_path)
subprocess.call(cmd, shell = True)

sample_i_dict = {}
i_sample_dict = {}
f_in = open("./head.txt")
for line in f_in.readlines():
    if line.startswith("#CHROM"):
        columns = line.split()
        for i in range(9, len(columns)):
            sample_i_dict[columns[i]] = i
            i_sample_dict[i] = columns[i]
        break
f_in.close()

cmd = "rm ./head.txt"
subprocess.call(cmd, shell = True)

f_in = open(vcf_path)
f_out = open("fixedPOS.txt", "w")

for line in f_in.readlines():
    if not line.startswith("#"):
        n_set = set()
        s_set = set()
        columns = line.split()

        for i in range(9, len(columns)):
            geno = columns[i][0] + columns[i][2]
            if geno in ["01", "10", "00", "11"]:
                if i_sample_dict[i] in n_list:
                    n_set.add(geno)
                elif i_sample_dict[i] in s_list:
                    s_set.add(geno)
        if len(n_set) == 1 and len(s_set) == 1 and (n_set != {"01"}) and (n_set != {"10"}) and (s_set != {"10"}) and (s_set != {"01"}) and (n_set != s_set):
            f_out.write("{}\t{}\n".format(columns[0], columns[1]))

f_in.close()
f_out.close()
