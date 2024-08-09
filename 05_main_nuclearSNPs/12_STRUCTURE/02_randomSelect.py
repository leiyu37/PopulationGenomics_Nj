#!/usr/bin/env python3
import random

path = "./02_thin5000.recode.vcf"

f_in = open(path)
f_out = open("03_randomSelectSNP.vcf", "w")

for line in f_in.readlines():
    if line.startswith("#"):
        f_out.write(line)
    else:
        clock = random.choice([1,0,0,0])
        if clock == 1:
            f_out.write(line)

f_in.close()
f_out.close()
