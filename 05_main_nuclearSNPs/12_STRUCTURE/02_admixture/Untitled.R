#!/usr/bin/env Rscript
library(ggplot2)

obj <- read.table("00_Rinput.txt", header = FALSE)

pdf("admixture.pdf", width = 3, height = 3)
ggplot(data=obj, aes(x=V1, y=V2, fill=V3)) +
  geom_bar(stat="identity") +
  theme_classic() +
  xlab("") +
  ylab("Proportion") +
  theme(legend.position = "none") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme(axis.text.y = element_text(angle = 90, vjust = 0.5, hjust=1))
dev.off()
