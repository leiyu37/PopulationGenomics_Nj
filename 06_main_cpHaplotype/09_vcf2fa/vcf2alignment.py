#!/usr/bin/env python3
vcf = "/Users/lyu/projectZJ/zjspeciation/02_cpAnalyses/03_genotyping/09_mac1.recode.vcf"
i_sample_dict = {}
f_in = open(vcf)
for line in f_in.readlines():
    if line.startswith("#CHROM"):
        columns = line.split()
        for i in range(9, len(columns)):
            i_sample_dict[i] = columns[i]
        break
f_in.close()

f_out = open("01_alignment.fasta", "w")
for i in i_sample_dict.keys():
    f_out.write(">{}\n".format(i_sample_dict[i]))
    f_in = open(vcf)
    for line in f_in.readlines():
        if not line.startswith("#"):
            columns = line.split()
            ref = columns[3].upper()
            alt = columns[4].upper()
            base = "N"
            if ":" in columns[i]:
                if "," in columns[i].split(":")[1]:
                    n_ref = int(columns[i].split(":")[1].split(",")[0])
                    n_alt = int(columns[i].split(":")[1].split(",")[1])
                    n = n_ref + n_alt
                    vrf = round(n_alt/n, 4)
                    if vrf > 0.65:
                        base = alt
                    else:
                        base = ref
            f_out.write(base)
    f_in.close()
    f_out.write("\n")
f_out.close()
