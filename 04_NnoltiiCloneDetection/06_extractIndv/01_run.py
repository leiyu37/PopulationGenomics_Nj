#!/usr/bin/env python3
import subprocess
import os
temp = os.getcwd()

vcf_path = "/gxfs_work/geomar/smomw353/projectZJ_final_v2/01_ncAnalyses/02_ZNgenotype/05_selectChr/10_Chr.vcf"

cmd = "head -3000 {} >head.txt".format(vcf_path)
subprocess.call(cmd, shell = True)

head_path = "./head.txt"

f_in = open(head_path)
for line in f_in.readlines():
    if line.startswith("#CHROM"):
        columns = line.split()
        for i in range(9, len(columns)):
            sample = columns[i]

            f_bash = open("geno_{}.sh".format(sample), "w")
            f_bash.write("#!/bin/bash\n")
            f_bash.write("#SBATCH --job-name={}_geno\n".format(sample))
            f_bash.write("#SBATCH --nodes=1\n")
            f_bash.write("#SBATCH --tasks-per-node=1\n")
            f_bash.write("#SBATCH --cpus-per-task=1\n")
            f_bash.write("#SBATCH --mem=100G\n")
            f_bash.write("#SBATCH --time=10:00:00\n")
            f_bash.write("#SBATCH --output={}.out\n".format(sample))
            f_bash.write("#SBATCH --error={}.err\n".format(sample))
            f_bash.write("#SBATCH --partition=base\n")
            f_bash.write("cd {}\n\n".format(temp))

            cmd = "vcftools --vcf {} --indv {} --out {} --recode --recode-INFO-all".format(vcf_path, sample, sample)
            f_bash.write(cmd + "\n")

            cmd = "chmod 700 ./extractIndv.py"
            f_bash.write(cmd + "\n")
            
            cmd = "./extractIndv.py {}".format(sample)
            f_bash.write(cmd + "\n")

            f_bash.close()

            #cmd = "sbatch geno_{}.sh".format(sample)
            #subprocess.call(cmd, shell = True)

        break
f_in.close()

cmd = "rm ./head.txt"
subprocess.call(cmd, shell = True)
