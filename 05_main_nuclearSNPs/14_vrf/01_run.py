#!/usr/bin/env python3
import subprocess
import os
temp = os.getcwd()

vcf_path = "/gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/03_filter/11_LowMissing.recode.vcf"

cmd = "head -3000 {} >head.txt".format(vcf_path)
subprocess.call(cmd, shell = True)

head_path = "./head.txt"

f_in = open(head_path)
for line in f_in.readlines():
    if line.startswith("#CHROM"):
        columns = line.split()
        for i in range(9, len(columns)):
            sample = columns[i]

            f_bash = open("vrf_{}.sh".format(sample), "w")
            f_bash.write("#!/bin/bash\n")
            f_bash.write("#SBATCH --job-name={}_vrf\n".format(sample))
            f_bash.write("#SBATCH --nodes=1\n")
            f_bash.write("#SBATCH --tasks-per-node=1\n")
            f_bash.write("#SBATCH --cpus-per-task=1\n")
            f_bash.write("#SBATCH --mem=100G\n")
            f_bash.write("#SBATCH --time=10:00:00\n")
            f_bash.write("#SBATCH --output={}.out\n".format(sample))
            f_bash.write("#SBATCH --error={}.err\n".format(sample))
            f_bash.write("#SBATCH --partition=base\n")
            f_bash.write("cd {}\n\n".format(temp))

            cmd = "module load gcc12-env/12.3.0\n"
            f_bash.write(cmd + "\n")

            cmd = "module load python/3.11.5\n"
            f_bash.write(cmd + "\n")

            cmd = "module load openjdk/17.0.5_8\n"
            f_bash.write(cmd + "\n")

            cmd = "module load R/4.3.1\n"
            f_bash.write(cmd + "\n")

            cmd = "chmod 700 ./extractIndv.py"
            f_bash.write(cmd + "\n")

            cmd = "chmod 700 ./vrfPlot.R"
            f_bash.write(cmd + "\n")

            cmd = "./extractIndv.py {}".format(sample)
            f_bash.write(cmd + "\n")

            cmd = "./vrfPlot.R {0}_vrf.txt {0}_vrf.pdf".format(sample)
            f_bash.write(cmd + "\n")

            f_bash.close()

            cmd = "sbatch vrf_{}.sh".format(sample)
            subprocess.call(cmd, shell = True)

        break
f_in.close()

cmd = "rm ./head.txt"
subprocess.call(cmd, shell = True)
