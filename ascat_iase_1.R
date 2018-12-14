#try run ascat with pf_iase as a match normal and iase_1 as "sample" - what results for aneuploidy in normal?
library(ASCAT)
library(dplyr)
library(reshape2)
pf_iase <-read.table('/Users/gk14/Desktop/vcfs/HPSI0816pf-iase.wec.gtarray.HumanCoreExome-24_v1_1.20180102.genotypes.vcf.gz',
           sep = "\t", header = F)
iase_1 <-read.table('/Users/gk14/Desktop/vcfs/HPSI0816i-iase_1.wec.gtarray.HumanCoreExome-24_v1_1.20180102.genotypes.vcf.gz',
                 sep = "\t", header = F)

new_col_names <- c("GT", "LRR", "BAF", "IA", "IB", "GC")
pf_iase_new_cols <-colsplit(pf_iase$V10, ":", new_col_names)
iase_1_new_cols <-colsplit(iase_1$V10, ":", new_col_names)
pf_iase_final <-cbind(pf_iase, pf_iase_new_cols)
iase_1_final <-cbind(iase_1, iase_1_new_cols)

pf_iase_baf <- data.frame(pf_iase_final$V3, pf_iase_final$V1, pf_iase_final$V2, pf_iase_final$BAF)
pf_iase_lrr <-data.frame(pf_iase_final$V3, pf_iase_final$V1, pf_iase_final$V2, pf_iase_final$LRR)
iase_1_baf <-data.frame(iase_1_final$V3, iase_1_final$V1, iase_1_final$V2, iase_1_final$BAF)
iase_1_lrr <-data.frame(iase_1_final$V3, iase_1_final$V1, iase_1_final$V2, iase_1_final$LRR)
names(pf_iase_baf) <- c("probe_id", "chr", "pos", "baf")
names(iase_1_baf) <- c("probe_id", "chr", "pos", "baf")
names(pf_iase_lrr) <- c("probe_id", "chr", "pos", "lrr")
names(iase_1_lrr) <- c("probe_id", "chr", "pos", "lrr")
write.table(pf_iase_lrr, file = "germline_lrr_iase.txt", sep = "\t", quote = F, row.names = F)
write.table(pf_iase_baf, file = "germline_baf_iase.txt", sep = "\t", quote = F, row.names = F)
write.table(iase_1_baf, file = "tumour_baf_iase_1.txt", sep = "\t", quote = F, row.names = F)
write.table(iase_1_lrr, file = "tumour_lrr_iase_1.txt", sep = "\t", quote = F, row.names = F)
ascat.bc = ascat.loadData("tumour_lrr_iase_1.txt", "tumour_baf_iase_1.txt", "germline_lrr_iase.txt", "germline_baf_iase.txt")
ascat.plotRawData(ascat.bc)
ascat.bc = ascat.aspcf(ascat.bc)
ascat.plotSegmentedData(ascat.bc)
ascat.output = ascat.runAscat(ascat.bc)

