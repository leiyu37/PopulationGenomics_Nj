#!/usr/bin/env python3

f_in = open("./02_clonemates.txt")
f_out = open("03_clones_rate.txt", "w")

for line in f_in.readlines():

    if len(line) < 3:
        f_out.write(line)
    else:
        sample = line.strip()
        f_s = open("../04_count/mRate_{}.txt".format(sample))

        f_out.write("{}\t{}\n".format(sample, f_s.read().strip().split()[-1]))

        f_s.close()


f_in.close()
f_out.close()
