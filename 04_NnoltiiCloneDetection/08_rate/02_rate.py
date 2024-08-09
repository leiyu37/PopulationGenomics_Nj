#!/usr/bin/env python3

f_in = open("/Users/lyu/projectZJ_final_v2/01_ncAnalyses/02_ZNgenotype/07_pairwise/00_clonemates_organize.txt")
f_out = open("00_clones_rate.txt", "w")

for line in f_in.readlines():

    if len(line.split()) == 1:
        sample = line.strip()
        f_s = open("/Users/lyu/projectZJ_final_v2/01_ncAnalyses/02_ZNgenotype/04_count/00_results/{}_mRateHet.txt".format(sample))

        f_out.write("{}\t{}\n".format(sample, f_s.read().strip().split()[2]))

        f_s.close()

    elif len(line.split()) > 1:
        f_out.write("\n")


f_in.close()
f_out.close()
