#!/usr/bin/env python3

f_in = open("/Users/lyu/projectZJ/zjspeciation/04_ncAnalyses/17_sampleList/01_all.txt")
f_out = open("00_01_all.txt", "w")

for line in f_in.readlines():
    columns = line.split()
    for i in range(9, len(columns)):
        f_out.write("{}\n".format(columns[i]))

f_out.close()
f_in.close()

f_in = open("/Users/lyu/projectZJ/zjspeciation/04_ncAnalyses/17_sampleList/02_rmHmissing.txt")
f_out = open("00_02_rm3missing.txt", "w")

for line in f_in.readlines():
    columns = line.split()
    for i in range(9, len(columns)):
        f_out.write("{}\n".format(columns[i]))

f_out.close()
f_in.close()

f_in = open("/Users/lyu/projectZJ/zjspeciation/04_ncAnalyses/17_sampleList/03_final.txt")
f_out = open("00_03_final.txt", "w")

for line in f_in.readlines():
    columns = line.split()
    for i in range(9, len(columns)):
        f_out.write("{}\n".format(columns[i]))

f_out.close()
f_in.close()
