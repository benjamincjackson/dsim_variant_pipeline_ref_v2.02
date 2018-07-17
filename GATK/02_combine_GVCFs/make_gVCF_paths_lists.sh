# Make list files by chromosome by population in order to make final VCF
# files with separate populations in them.

for CONTIG in Scf_2L Scf_2R Scf_3L Scf_3R Scf_X
do
	for POP in NS MD
	do
	# make the .list file
	  ls /localdisk/home/bjackso4/dros_dsim/GATK/01_haplotype_caller_out/${POP}*.${CONTIG}.g.vcf.gz >> gVCF_paths.${POP}.${CONTIG}.list
  done
done
