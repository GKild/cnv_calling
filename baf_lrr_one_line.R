#create BAF+LRR plots for all chromosomes per line
library(dplyr)
library(reshape2)
library(genoCN)
mydata <-read.table("/Users/gk14/Desktop/vcfs/HPSI0816pf-iase.wec.gtarray.HumanCoreExome-24_v1_1.20180102.genotypes.vcf.gz", sep = "\t", header = FALSE)
chroms <- c(1:22, "X")
sapply(chroms, function(x){
  chr_filtered <-filter(mydata, V1==x)
  new_col_names <- c("GT", "LRR", "BAF", "IA", "IB", "GC")
  new_cols <-colsplit(chr_filtered$V10, ":", new_col_names)
  final <-cbind(chr_filtered, new_cols)
  png(filename=paste0("/Users/gk14/Desktop/pf_iase/pf_iase_chr",x, ".png"), width = 800, height = 600)
  plotCN(final$V2, final$LRR, final$BAF, chr2plot = x, LRR.ylim = c(-1,1), main = paste0("BAF & LRR pf_iase_", x))
  dev.off()
})



?plotCN()
