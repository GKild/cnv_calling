#run like this: while read line; do ./run_ascat.sh $line; done < all_inputs.txt
# all_inputs.txt contains paths to rel files in this order - tumour_lrr, tumour_baf, normal_lrr, normal_baf
line_lrr=$1
line_baf=$2
fibro_lrr=$3
fibro_baf=$4
out_dir=$(basename -- "$(dirname -- "$line_lrr")")
donor_id=$(echo $out_dir |cut -c 11-14)
sex=$(grep $donor_id /nfs/teams/team170/gerda/scripts/run_ascat/donor_sex.txt| awk '{print $1}')
mkdir /lustre/scratch117/cellgen/team170/gk14/ascat_outputs/$out_dir
mkdir /lustre/scratch117/cellgen/team170/gk14/ascat_outputs/$out_dir/ips_as_tumor
mkdir /lustre/scratch117/cellgen/team170/gk14/ascat_outputs/$out_dir/fibro_as_tumor
/software/team170/R-3.5.1/bin/Rscript run_ascat.R $line_lrr $line_baf $fibro_lrr $fibro_baf $sex /nfs/teams/team170/gerda/scripts/run_ascat/GC_SNPos.combined.gcContent.txt.txt /lustre/scratch117/cellgen/team170/gk14/ascat_outputs/$out_dir/ips_as_tumor /lustre/scratch117/cellgen/team170/gk14/ascat_outputs/$out_dir/fibro_as_tumor 
