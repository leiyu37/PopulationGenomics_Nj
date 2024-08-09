#!/usr/bin/env python3
import subprocess
import os
temp = os.getcwd()

in_path = "./01_organize.txt"

dataid_path_dict = {}
f_in = open(in_path)
for line in f_in.readlines():
    columns = line.split()
    dataid_path_dict[columns[0]] = [columns[1], columns[2]]
f_in.close()

for dataid in dataid_path_dict.keys():
    f_bash = open("{}_filter.sh".format(dataid), "w")
    f_bash.write("#!/bin/bash\n")
    f_bash.write("#SBATCH --job-name=bbduk_{}\n".format(dataid))
    f_bash.write("#SBATCH --nodes=1\n")
    f_bash.write("#SBATCH --tasks-per-node=1\n")
    f_bash.write("#SBATCH --cpus-per-task=1\n")
    f_bash.write("#SBATCH --mem=100G\n")
    f_bash.write("#SBATCH --time=10:00:00\n")
    f_bash.write("#SBATCH --output={}.out\n".format(dataid))
    f_bash.write("#SBATCH --error={}.err\n".format(dataid))
    f_bash.write("#SBATCH --partition=base\n")

    f_bash.write("cd {}\n".format(temp))

    f_bash.write("$HOME/tools/bbmap/bbduk.sh \\\n")
    f_bash.write("in1={} \\\n".format(dataid_path_dict[dataid][0]))
    f_bash.write("in2={} \\\n".format(dataid_path_dict[dataid][1]))


    f_bash.write("out1=/gxfs_work/geomar/smomw353/zjspeciation/00_clean/{}_bbduk_1.fq.gz \\\n".format(dataid))
    f_bash.write("out2=/gxfs_work/geomar/smomw353/zjspeciation/00_clean/{}_bbduk_2.fq.gz \\\n".format(dataid))

    f_bash.write("ref=$HOME/tools/bbmap/resources/adapters.fa \\\n")
    f_bash.write("ktrim=r \\\n")
    f_bash.write("k=23 \\\n")
    f_bash.write("mink=11 \\\n")
    f_bash.write("hdist=1 \\\n")
    f_bash.write("tpe \\\n")
    f_bash.write("tbo \\\n")
    f_bash.write("qtrim=r \\\n")
    f_bash.write("trimq=20 \\\n")
    f_bash.write("maq=20 \\\n")
    f_bash.write("minlen=50\n")

    f_bash.close()

    #cmd = "sbatch {}_filter.sh".format(dataid)
    #subprocess.call(cmd, shell = True)
