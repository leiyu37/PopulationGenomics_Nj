#!/usr/bin/env Rscript
library(ggplot2)
args = commandArgs(trailingOnly=TRUE)

in_path = args[1]
out_path = args[2]

obj <- read.table(in_path, header = FALSE)

obj01 <- subset(obj, V1 < 0.9 & V1 > 0.1)

pdf(out_path, width = 4, height = 4)
ggplot(obj01, aes(V1)) +
  geom_histogram(binwidth = 0.02) +
  geom_vline(xintercept = 0.33, linetype = "dashed") +
  geom_vline(xintercept = 0.5, linetype = "dashed") +
  theme_classic() +
  facet_wrap(~V2) +
  scale_x_continuous(breaks = c(0.1, 0.33, 0.50, 0.75, 0.9)) +
  xlab("VRF")
dev.off()
