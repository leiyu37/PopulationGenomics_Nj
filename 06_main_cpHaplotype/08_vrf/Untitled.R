#!/usr/bin/env Rscript

library(ggplot2)

obj <- read.table("./01_vrf.txt", header = FALSE)

pdf("vrf_histogram.pdf", width = 4, height = 4)
ggplot(obj, aes(V1)) +
  geom_histogram(binwidth = 0.05) +
  geom_vline(xintercept = 0.65) +
  xlab("Variant read frequency")
dev.off()
