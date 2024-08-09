#!/usr/bin/env python3
import sys
import subprocess

def pairwise(path, sampleA, sampleB, out_path):
    n_avail = 0
    n_a = 0
    n_b = 0
    n_sh = 0
    n_homoDiff = 0

    f_in = open(path)
    for line in f_in.readlines():
        columns = line.split()
        genoA = columns[0]
        genoB = columns[1]

        if (genoA != "Y") and (genoB != "Y"):
            n_avail += 1
            if genoA in ["01", "10"]:
                n_a += 1
            if genoB in ["01", "10"]:
                n_b += 1
            if (genoA in ["01", "10"]) and (genoB in ["01", "10"]):
                n_sh += 1
            if (genoA in ["00", "11"]) and (genoB in ["00", "11"]) and (genoA != genoB):
                n_homoDiff += 1                
    f_in.close()

    sh_a = round(n_sh/n_a, 4)
    sh_b = round(n_sh/n_b, 4)
    sh = round(min(sh_a, sh_b), 4)
    f_homoDiff = round(n_homoDiff/n_avail, 4)

    f_out = open(out_path, "w")
    f_out.write("SampleA\tSampleB\tN_avail\tN_sh\tSH_A\tSH_B\tSH\tN_homoDiff\tF_homoDiff\n")
    f_out.write("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\n".format(sampleA, sampleB, n_avail, n_sh, sh_a, sh_b, sh, n_homoDiff, f_homoDiff))
    f_out.close()

pathA = sys.argv[1]
pathB = sys.argv[2]

sampleA = pathA.split("/")[-1].split("_indv")[0]
sampleB = pathB.split("/")[-1].split("_indv")[0]
out_path = "{}_{}_pairwise.txt".format(sampleA, sampleB)

cmd = "paste {} {} >./{}_{}_temp.txt".format(pathA, pathB, sampleA, sampleB)
subprocess.call(cmd, shell=True)

#run the calculation
pairwise("./{}_{}_temp.txt".format(sampleA, sampleB), sampleA, sampleB, out_path)

cmd = "rm ./{}_{}_temp.txt".format(sampleA, sampleB)
subprocess.call(cmd, shell=True)
