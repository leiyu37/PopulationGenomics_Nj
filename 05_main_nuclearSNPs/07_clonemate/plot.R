#!/usr/bin/env Rscript
library(ggplot2)
obj <- read.table("../06_pairwise_results/01_results_ready.txt", header = TRUE)

pdf("01_nsh_sh.pdf", width = 4, height = 4)
ggplot(obj, aes(N_sh, SH)) +
  geom_point(shape = 4) +
  geom_hline(yintercept = 0.90, linetype = "dashed") +
  theme_classic() +
  scale_y_continuous(limit = c(0.0, 1), breaks = c(0, 0.25, 0.5, 0.75, 0.90, 1)) +
  xlab("N_SH") +
  ylab("SH")
dev.off()

obj01 <- subset(obj, SH > 0.90)
obj01 <- subset(obj, SH > 0.90 & N_homoDiff < 20)

min(obj01$N_sh) #19879
min(obj01$SH) #0.9291

write.table(obj01, "00_clonemates.txt", quote = FALSE, sep = "\t", row.names = FALSE)
