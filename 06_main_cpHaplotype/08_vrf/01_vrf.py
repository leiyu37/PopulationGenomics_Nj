#!/usr/bin/env python3

f_in = open("/Users/lyu/projectZJ/zjspeciation/02_cpAnalyses/03_genotyping//09_mac1.recode.vcf")
f_out = open("01_vrf.txt", "w")

for line in f_in.readlines():
    if not line.startswith("#"):
        columns = line.split()

        for i in range(9, len(columns)):
            c_ref= int(columns[i].split(":")[1].split(",")[0])
            c_alt = int(columns[i].split(":")[1].split(",")[1])
            dp = c_ref +c_alt

            vrf = round(c_alt/dp, 4)
            if vrf > 0 and vrf < 1:
                f_out.write("{}\n".format(vrf))

f_out.close()
f_in.close()
