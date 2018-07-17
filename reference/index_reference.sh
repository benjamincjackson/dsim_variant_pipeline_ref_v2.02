samtools faidx dsim-all-chromosome-r2.02.fasta
bwa index -a is dsim-all-chromosome-r2.02.fasta
java -jar ~/programs/picard-2.8.3/picard.jar CreateSequenceDictionary \
	R=dsim-all-chromosome-r2.02.fasta \
	O=dsim-all-chromosome-r2.02.dict
