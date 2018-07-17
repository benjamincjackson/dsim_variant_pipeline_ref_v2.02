# Make list files by chromosome by population in order to make final VCF
# files with separate populations in them.

for CONTIG in Scf_4
do
	for POP in NS MD
	do
	# make the .list file
	  ls /localdisk/home/bjackso4/dros_dsim/GATK/01_haplotype_caller_out/${POP}*.${CONTIG}.g.vcf.gz >> gVCF_paths.${POP}.${CONTIG}.list
  done
done
