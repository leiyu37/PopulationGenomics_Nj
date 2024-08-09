#!/usr/bin/env Rscript
library(ggplot2)
obj <- read.table("./01_results_ready.txt", header = TRUE)

pdf("homoDiff_sh.pdf", width = 4, height = 4)
ggplot(obj, aes(N_homoDiff, SH)) +
  geom_point(shape = 4) +
  geom_vline(xintercept = 350, linetype = "dashed") +
  geom_hline(yintercept = 0.81, linetype = "dashed") +
  theme_classic() +
  scale_x_continuous(breaks = c(0, 350, 2000, 4000, 6000)) +
  scale_y_continuous(limit = c(0.0, 1), breaks = c(0, 0.25, 0.5, 0.75, 0.81, 1)) +
  xlab("Number of SNPs with pairwise fixed differences") +
  ylab("SH")
dev.off()

obj04 <- subset(obj, N_homoDiff < 350)
write.table(obj04, "00_clonemates.txt", quote = FALSE, sep = "\t", row.names = FALSE)
min(obj04$SH)

obj05 <- subset(obj, N_homoDiff > 350 & N_homoDiff < 4000)
max(obj05$SH)
