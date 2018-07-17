# run haplotype caller on a chromosome for an individual,
# and output all sites with the BP_RESOLUTION argument

# USAGE:
# ./run_haplotype_caller.sh SAMPLEPATH(path) SAMPLE REGION

export LD_BIND_NOW=1

SAMPLEPATH=$1
SAMPLE=$2
REGION=$3

java -Xmx8g -jar /localdisk/home/bjackso4/programs/GenomeAnalysisTK.jar \
	-T HaplotypeCaller \
	-nct 4 \
	-R /localdisk/home/bjackso4/dros_dsim/reference/dsim-all-chromosome-r2.02.fasta \
	-I $SAMPLEPATH \
	-L $REGION \
	--emitRefConfidence BP_RESOLUTION \
	--max_alternate_alleles 2 \
	-o /localdisk/home/bjackso4/dros_dsim/GATK/01_haplotype_caller_out/${SAMPLE}.${REGION}.g.vcf.gz \
	2> /localdisk/home/bjackso4/dros_dsim/GATK/01_haplotype_caller_out/${SAMPLE}.${REGION}.err
