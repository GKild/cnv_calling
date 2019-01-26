args <- commandArgs(TRUE)
ascat.bc_ips_tum <- ascat.loadData(args[1], args[2], args[3], args[4])
ascat.bc_ips_tum <-ascat.GCcorrect(ascat.bc_ips_tum, args[5])
ascat.plotRawData(ascat.bc_ips_tum, img.dir = args[6]) 
ascat.bc_ips_tum = ascat.aspcf(ascat.bc_ips_tum, out.dir = args[6])
ascat.plotSegmentedData(ascat.bc_ips_tum img.dir = args[6])
ascat.output_ips_tum = ascat.runAscat(ascat.bc_ips_tum, gamma = 0.55, img.dir = args[6])

ascat.bc_fibro_tum <- ascat.loadData(args[3], args[4], args[1], args[2])
ascat.bc_fibro_tum <-ascat.GCcorrect(ascat.bc_fibro_tum, args[5])
ascat.plotRawData(ascat.bc_fibro_tum, img.dir = args[7]) 
ascat.bc_fibro_tum = ascat.aspcf(ascat.bc_fibro_tum, out.dir = args[6])
ascat.plotSegmentedData(ascat.bc_fibro_tum img.dir = args[6])
ascat.output_fibro_tum = ascat.runAscat(ascat.bc_fibro_tum, gamma = 0.55, img.dir = args[6])