bcftools query -H -f '%ID\t%CHROM\t%POS\t[%BAF]\n' input.vcf.gz > out.txt
