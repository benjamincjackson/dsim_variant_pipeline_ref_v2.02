mkdir /localdisk/home/bjackso4/tmp/MD233
java -Xmx12G -Djava.io.tmpdir=/localdisk/home/bjackso4/tmp/MD233 -jar /localdisk/home/bjackso4/programs/picard-2.8.3/picard.jar MergeSamFiles \
INPUT=/localdisk/home/bjackso4/dros_dsim/01_map_out/SRR1943276.bam \
OUTPUT=/localdisk/home/bjackso4/dros_dsim/02_sort_merge_out/MD233.merged.sorted.bam \
SORT_ORDER=coordinate \
USE_THREADING=true \
CREATE_INDEX=true \
2>/localdisk/home/bjackso4/dros_dsim/02_sort_merge_out/MD233.merged.sorted.bam.err
rm -rf /localdisk/home/bjackso4/tmp/MD233
