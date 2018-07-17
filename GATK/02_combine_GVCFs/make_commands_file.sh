for MYFILE in `ls *.list`
do
	echo "nice -n 19 /localdisk/home/bjackso4/dros_dsim/GATK/02_combine_GVCFs/run_combineGVCFs.sh" $MYFILE >> commands.txt
done
