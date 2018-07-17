# Run genotypeGVCFs on the per-contig GVCFs produced by haplotype caller
# after merging them with combineGVCFs, which should speed things up

# Usage: run_genotypeGVCFs.sh {CONTIG.POP.combined.g.vcf.gz}

GVCFFILE=$1
TEMP=${GVCFFILE##*/}
CONTIG=`echo $TEMP | cut -d'.' -f1`
POP=`echo $TEMP | cut -d'.' -f2`

java -XX:ParallelGCThreads=4 -Xmx16g -jar /localdisk/home/bjackso4/programs/GenomeAnalysisTK.jar \
	-T GenotypeGVCFs \
	-R /localdisk/home/bjackso4/dros_dsim/reference/dsim-all-chromosome-r2.02.fasta \
	-V $GVCFFILE \
	--includeNonVariantSites \
	-o /localdisk/home/bjackso4/dros_dsim/GATK/03_genotype_GVCFs_out/${CONTIG}.${POP}.g.vcf.gz \
	2> /localdisk/home/bjackso4/dros_dsim/GATK/03_genotype_GVCFs_out/${CONTIG}.${POP}.err

