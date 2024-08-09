#!/usr/bin/env Rscript
library(ggplot2)
obj <- read.table("../pca.eigenvec", header = FALSE)

pdf("PCA_p1.pdf",height = 4, width = 4)
ggplot(data = obj, aes(V3)) +
  geom_histogram(binwidth = 0.03, fill="transparent",color="black") +
  xlab("PC1(75.57%)") +
  ylab("Number of samples") +
  theme_classic()
dev.off()


cn <- subset(obj, V3 > 0.04, select = V2)
write.table(cn, file = "ZJ_N.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

ci <- subset(obj, V3 > -0.04 & V3 < 0.04, select = V2)
write.table(ci, file = "ZJ_I.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

cs <- subset(obj, V3 < -0.04, select = V2)
write.table(cs, file = "ZJ_S.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
