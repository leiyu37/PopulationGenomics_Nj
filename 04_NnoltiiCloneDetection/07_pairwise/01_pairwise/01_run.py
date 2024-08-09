#!/usr/bin/env python3
import subprocess
import os

cwd = os.getcwd()
list_path = "./paths_list.txt"

cmd = "chmod 700 ./pairwise.py"
subprocess.call(cmd, shell=True)

path_list = []
f_in = open(list_path)
for line in f_in.readlines():
    path_list.append(line.rstrip())
f_in.close()

n_total = 0
for i in range(0, len(path_list) - 1):
    for j in range(i+1, len(path_list)):
        n_total += 1

n = 0
cmd_s = ""
for i in range(0, len(path_list) - 1):
    for j in range(i+1, len(path_list)):
            n += 1
            pathA = path_list[i]
            pathB = path_list[j]

            cmd_s += "./pairwise.py {0} {1}\n".format(pathA, pathB)
            if n % 500 == 0 or n == n_total:
            
                f_bash = open("{}.sh".format(n), "w")
                f_bash.write("#!/bin/bash\n")
                f_bash.write("#SBATCH --job-name={}\n".format(n))
                f_bash.write("#SBATCH --nodes=1\n")
                f_bash.write("#SBATCH --tasks-per-node=1\n")
                f_bash.write("#SBATCH --cpus-per-task=1\n")
                f_bash.write("#SBATCH --mem=80G\n")
                f_bash.write("#SBATCH --time=48:00:00\n")
                f_bash.write("#SBATCH --output={}.out\n".format(n))
                f_bash.write("#SBATCH --error={}.err\n".format(n))
                f_bash.write("#SBATCH --partition=base\n")
                f_bash.write("cd {}\n\n".format(cwd))
                f_bash.write(cmd_s)
                f_bash.close()
                #cmd = "sbatch {}.sh".format(n)
                #subprocess.call(cmd, shell=True)

                cmd_s = ""
