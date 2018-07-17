# combine each pop's sample gVCFs into one large gVCF for each contig,
# because this should speed up GenotypeGVCFs.

# Usage: run_combineGVCFs.sh {.listfile}

LISTFILE=$1
CONTIG=`echo $LISTFILE | cut -d'.' -f3`
POP=`echo $LISTFILE | cut -d'.' -f2`

java -Xmx8g -jar /localdisk/home/bjackso4/programs/GenomeAnalysisTK.jar \
	-T CombineGVCFs \
	-R /localdisk/home/bjackso4/dros_dsim/reference/dsim-all-chromosome-r2.02.fasta \
	-V $LISTFILE \
	-o /localdisk/home/bjackso4/dros_dsim/GATK/02_combine_GVCFs_out/${CONTIG}.${POP}.combined.g.vcf.gz \
	2> /localdisk/home/bjackso4/dros_dsim/GATK/02_combine_GVCFs_out/${CONTIG}.${POP}.err
