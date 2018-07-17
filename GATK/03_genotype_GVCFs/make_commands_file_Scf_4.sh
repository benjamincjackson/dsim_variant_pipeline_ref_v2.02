for MYFILE in /localdisk/home/bjackso4/dros_dsim/GATK/02_combine_GVCFs_out/Scf_4*combined*.gz
do
	echo "nice -n 19 /localdisk/home/bjackso4/dros_dsim/GATK/03_genotype_GVCFs/run_genotypeGVCFs.sh" $MYFILE >> commands_Scf_4.txt
done
