#!/usr/bin/env python3
import sys

def extractIndv(vcf_path, sample, out_path):

    f_in = open(vcf_path)
    f_out = open(out_path, "w")
    for line in f_in.readlines():
        if not line.startswith("#"):
            info = line.split()[i_target]
            vrf = 0.0
            if ":" in info:
                if "," in info.split(":")[1]:
                    n_ref = int(info.split(":")[1].split(",")[0])
                    n_alt = int(info.split(":")[1].split(",")[1])
                    n = n_ref + n_alt
                    if n > 20:
                        vrf = round(n_alt/n, 4)
            if vrf != 0.0:
                f_out.write("{}\t{}\n".format(vrf, sample))

        elif line.startswith("#CHROM"):
            columns = line.split()
            for i in range(9, len(columns)):
                if columns[i] == sample:
                    i_target = i
    f_in.close()
    f_out.close()

sample = sys.argv[1]

#run the calculation
out_path = "{}_vrf.txt".format(sample)
extractIndv("/gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/05_extractIndv/{}.recode.vcf".format(sample), sample, out_path)
