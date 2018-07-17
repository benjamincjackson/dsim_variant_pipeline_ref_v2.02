
INFILE=$1
TEMP=${INFILE##*/}
SAMPLE=${TEMP%%.*}


mkdir /localdisk/home/bjackso4/tmp/${SAMPLE}

java -Xmx32G -Djava.io.tmpdir=/localdisk/home/bjackso4/tmp/${SAMPLE} -jar /localdisk/home/bjackso4/programs/picard-2.8.3/picard.jar MarkDuplicates \
	INPUT=$INFILE \
	OUTPUT=/localdisk/home/bjackso4/dros_dsim/03_mark_duplicates_out/${SAMPLE}.merged.sorted.dedupped.bam \
	CREATE_INDEX=true \
	METRICS_FILE=/localdisk/home/bjackso4/dros_dsim/03_mark_duplicates_out/${SAMPLE}.merged.sorted.dedupped.bam.metrics \
	MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 \
	2>/localdisk/home/bjackso4/dros_dsim/03_mark_duplicates_out/${SAMPLE}.merged.sorted.dedupped.bam.err

rm -rf /localdisk/home/bjackso4/tmp/${SAMPLE}
