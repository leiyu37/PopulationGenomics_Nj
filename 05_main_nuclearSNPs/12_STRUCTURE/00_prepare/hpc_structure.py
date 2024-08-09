#!/usr/bin/env python3
import subprocess
f_log = open("python_log.txt", "w")

for k in [2, 3]:
	for i in range(1,21):
		bash_name = "k{}_r{}.sh".format(k, i)
		f_bash = open(bash_name, "w")
		f_bash.write("#!/bin/bash\n")
		f_bash.write("#SBATCH --job-name={}_{}\n".format(k, i))
		f_bash.write("#SBATCH --nodes=1\n")
		f_bash.write("#SBATCH --tasks-per-node=1\n")
		f_bash.write("#SBATCH --cpus-per-task=1\n")
		f_bash.write("#SBATCH --mem=100G\n")
		f_bash.write("#SBATCH --time=239:00:00\n")
		f_bash.write("#SBATCH --output={}_{}.out\n".format(k, i))
		f_bash.write("#SBATCH --error={}_{}.err\n".format(k, i))
		f_bash.write("#SBATCH --partition=base\n")
		f_bash.write("#SBATCH --qos=long\n")

		f_bash.write("cd /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/12_STRUCTURE/00_results\n")
		f_bash.write("structure -m ../mainparams -e ../extraparams -K {} -i ../str_input.txt -o k{}_run_{} -D {}\n".format(k, k, i, i))
		f_bash.close()

		cmd = "sbatch k{}_r{}.sh".format(k, i)
		#subprocess.call(cmd, shell=True)
		f_log.write(cmd + "\n")
f_log.close()
