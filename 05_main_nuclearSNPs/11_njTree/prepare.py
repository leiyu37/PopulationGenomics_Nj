#!/usr/bin/env python3
f_out = open("zj.meg", "w")
f_out.write("#mega\n!Title: Zostera japonica;\n!Format DataType=Distance DataFormat=LowerLeft;\n")

f_in = open("./plink.mdist.id")
for line in f_in.readlines():
    columns = line.split()
    name = columns[0]
    f_out.write("# {}\n".format(name))
f_in.close()

f_in = open("./plink.mdist")
for line in f_in.readlines():
    columns = line.split()
    if "e" in columns[0]:
        f_out.write("{}".format("%f" % float(columns[0])))
    else:
        f_out.write(columns[0])
    for i in range(1, len(columns)):
        if "e" in columns[i]:
            f_out.write("\t{}".format("%f" % float(columns[i])))
        else:
            f_out.write("\t{}".format(columns[i]))
    f_out.write("\n")
f_in.close()

f_out.close()
