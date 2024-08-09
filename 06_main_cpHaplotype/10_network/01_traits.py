#!/usr/bin/env python3
pop_list = ["Nj_S", "Nj_N", "Nj_I"]

f_out = open("traits.txt", "w")
f_out.write("BEGIN TRAITS;\n")
f_out.write("\tDimensions NTRAITS={};\n".format(len(pop_list)))
f_out.write("\tFormat labels=yes missing=? separator=Comma;\n")
f_out.write("\tTraitLabels")
for i in range(0, len(pop_list)):
    f_out.write(" {}".format(pop_list[i]))
f_out.write(";\n\tMatrix\n")

f_in = open("/Users/lyu/projectZJ/zjspeciation/04_ncAnalyses/10_pca/00_plot/ZJ_N.txt")
for line in f_in.readlines():
    taxon = line.strip()
    f_out.write(taxon + " 0,1,0\n")
f_in.close()

f_in = open("/Users/lyu/projectZJ/zjspeciation/04_ncAnalyses/10_pca/00_plot/ZJ_S.txt")
for line in f_in.readlines():
    taxon = line.strip()
    f_out.write(taxon + " 1,0,0\n")
f_in.close()

f_in = open("/Users/lyu/projectZJ/zjspeciation/04_ncAnalyses/10_pca/00_plot/ZJ_I.txt")
for line in f_in.readlines():
    taxon = line.strip()
    f_out.write(taxon + " 0,0,1\n")
f_in.close()

f_out.write(";\nEND;\n")
f_out.close()
