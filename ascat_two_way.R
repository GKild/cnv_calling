#tumour lrr, tumour baf, normal lrr, normal baf
library(ASCAT)
args <- commandArgs(TRUE)
ascat.bc_ips_tum <- ascat.loadData(args[1], args[2], args[3], args[4], gender = args[5])
ascat.bc_ips_tum <-ascat.GCcorrect(ascat.bc_ips_tum, args[6])
ascat.plotRawData(ascat.bc_ips_tum, img.dir = args[7]) 
ascat.bc_ips_tum = ascat.aspcf(ascat.bc_ips_tum, out.dir = args[7])
ascat.plotSegmentedData(ascat.bc_ips_tum, img.dir = args[7])
ascat.output_ips_tum = ascat.runAscat(ascat.bc_ips_tum, gamma = 0.55, img.dir = args[7])
segment_file_ips <-ascat.output_ips_tum$segments
segment_file_ips$aberrant_cell_fraction <- ascat.output_ips_tum$aberrantcellfraction

write.table(segment_file_ips, paste0(args[7],"/ips_frags.txt"), sep="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)

ascat.bc_fibro_tum <- ascat.loadData(args[3], args[4], args[1], args[2], gender = args[5])
ascat.bc_fibro_tum <-ascat.GCcorrect(ascat.bc_fibro_tum, args[6])
ascat.plotRawData(ascat.bc_fibro_tum, img.dir = args[8]) 
ascat.bc_fibro_tum = ascat.aspcf(ascat.bc_fibro_tum, out.dir = args[8])
ascat.plotSegmentedData(ascat.bc_fibro_tum , img.dir = args[8])
ascat.output_fibro_tum = ascat.runAscat(ascat.bc_fibro_tum, gamma = 0.55, img.dir = args[8])
segment_file_fibro <-ascat.output_fibro_tum$segments
segment_file_fibro$aberrant_cell_fraction <- ascat.output_fibro_tum$aberrantcellfraction
write.table(segment_file_fibro, paste0(args[8],"/fibro_frags.txt"), sep="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)