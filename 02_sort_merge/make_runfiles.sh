# make a runfile for each simulans line because the number
# of input BAM files to pass to picardtools is sometimes 2 (for MD225)

# get the samples:
cut -d' ' -f10 /localdisk/home/bjackso4/dros_dsim/01_map/commands* | sort | uniq | {
	while read SAMPLE
		do
			# start writing the command file:
			# make a temporary directory
			echo -e "mkdir /localdisk/home/bjackso4/tmp/${SAMPLE}" > run_${SAMPLE}.sh

			echo -e "java -Xmx12G -Djava.io.tmpdir=/localdisk/home/bjackso4/tmp/${SAMPLE} -jar /localdisk/home/bjackso4/programs/picard-2.8.3/picard.jar MergeSamFiles \\" >> run_${SAMPLE}.sh

			# grep the sample name and then cut out column 8, which is the run accession,
			# which also corresponds to the output bam file name from the mapping
			RUN=`grep [[:space:]]${SAMPLE}[[:space:]] /localdisk/home/bjackso4/dros_dsim/01_map/commands* | cut -d' ' -f8`
			for ERR in $RUN
				do
					echo -e "INPUT=/localdisk/home/bjackso4/dros_dsim/01_map_out/${ERR}.bam \\" >> run_${SAMPLE}.sh
				done
			echo -e "OUTPUT=/localdisk/home/bjackso4/dros_dsim/2_sort_merge_out/${SAMPLE}.merged.sorted.bam \\" >> run_${SAMPLE}.sh
			echo -e "SORT_ORDER=coordinate \\" >> run_${SAMPLE}.sh
			echo -e "USE_THREADING=true \\" >> run_${SAMPLE}.sh
			echo -e "CREATE_INDEX=true \\" >> run_${SAMPLE}.sh
			echo -e "2>/localdisk/home/bjackso4/dros_dsim/2_sort_merge_out/${SAMPLE}.merged.sorted.bam.err" >> run_${SAMPLE}.sh
			echo -e "rm -rf /localdisk/home/bjackso4/tmp/${SAMPLE}" >> run_${SAMPLE}.sh
		done
}
