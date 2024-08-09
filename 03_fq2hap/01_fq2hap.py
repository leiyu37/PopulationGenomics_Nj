#!/usr/bin/env python3
import subprocess
import os
temp = os.getcwd()

cmd = "rm -r ./00_haps"
subprocess.call(cmd, shell = True)

cmd = "mkdir ./00_haps"
subprocess.call(cmd, shell = True)

in_path = "./01_organize.txt"
refFolder_path = "/gxfs_work/geomar/smomw353/ref_HQ"
ref_path = "/gxfs_work/geomar/smomw353/ref_HQ/Genome.HQ.fa"
ref_code = "zj_HQ"

f_in = open(in_path)

for line in f_in.readlines():
    sample = line.rstrip().split()[0]
    f_bash = open("{}.sh".format(sample), "w")
    f_bash.write("#!/bin/bash\n")
    f_bash.write("#SBATCH --job-name=nc_{}\n".format(sample))
    f_bash.write("#SBATCH --nodes=1\n")
    f_bash.write("#SBATCH --tasks-per-node=1\n")
    f_bash.write("#SBATCH --cpus-per-task=18\n")
    f_bash.write("#SBATCH --mem=100G\n")
    f_bash.write("#SBATCH --time=100:00:00\n")
    f_bash.write("#SBATCH --output={}.out\n".format(sample))
    f_bash.write("#SBATCH --error={}.err\n".format(sample))
    f_bash.write("#SBATCH --partition=base\n")
    f_bash.write("#SBATCH --qos=long\n\n")
    f_bash.write("cd {}\n\n".format(refFolder_path))

    cmd = "module load gcc12-env/12.3.0\n"
    f_bash.write(cmd + "\n")

    cmd = "module load python/3.11.5\n"
    f_bash.write(cmd + "\n")

    cmd = "module load openjdk/17.0.5_8\n"
    f_bash.write(cmd + "\n")

    cmd = "$HOME/tools/bwa-0.7.17/bwa mem -R \"@RG\\tID:{0}\\tSM:{0}\\tPL:illumina\\tLB:lib\\tPU:unit\" -t 16 -M {2} /gxfs_work/geomar/smomw353/zjspeciation/00_clean/{0}_bbduk_1.fq.gz /gxfs_work/geomar/smomw353/zjspeciation/00_clean/{0}_bbduk_2.fq.gz >{1}/00_haps/{0}.sam\n".format(sample, temp, ref_code)

    f_bash.write(cmd)

    f_bash.write("cd {}/00_haps\n".format(temp))

    cmd = "samtools view -Sb ./{0}.sam >./{0}.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "rm ./{0}.sam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "samtools sort ./{0}.bam >./{0}_sort.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "samtools index ./{}_sort.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "samtools flagstat ./{0}_sort.bam >{0}_Sstat.txt".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "rm ./{0}.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "$HOME/tools/gatk-4.4.0.0/gatk --java-options \"-Xmx90G\" MarkDuplicates -I ./{0}_sort.bam -O ./{0}_markdup.bam -M ./{0}_metrics.txt -MAX_FILE_HANDLES 1000 --REMOVE_DUPLICATES true".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "rm ./{0}_sort.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "rm ./{0}_sort.bam.bai".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "samtools view -q 20 -f 0x2 -b ./{0}_markdup.bam >./{0}_Qfiltered.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "rm ./{0}_markdup.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "samtools index ./{}_Qfiltered.bam".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "samtools flagstat ./{0}_Qfiltered.bam >{0}_Qstat.txt".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "$HOME/tools/gatk-4.4.0.0/gatk --java-options \"-Xmx80G\" HaplotypeCaller -R {1} -I ./{0}_Qfiltered.bam -O ./{0}.g.vcf.gz -ERC GVCF".format(sample, ref_path)
    f_bash.write(cmd + "\n")

    cmd = "rm ./{0}_Qfiltered.bam.bai".format(sample)
    f_bash.write(cmd + "\n")

    cmd = "rm ./{0}_Qfiltered.bam".format(sample)
    f_bash.write(cmd + "\n")

    f_bash.close()

    #cmd = "sbatch {}.sh".format(sample)
    #subprocess.call(cmd, shell = True)

f_in.close()
