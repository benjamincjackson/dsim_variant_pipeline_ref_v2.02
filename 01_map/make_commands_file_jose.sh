# make the commands file for the mapping program

REFERENCE='/localdisk/home/bjackso4/dros_dsim/reference/dsim-all-chromosome-r2.02.fasta'

tail -n+2 /localdisk/home/bjackso4/dros_dsim/fastq/jose/PRJEB7673.txt | cut -f5 | {
    while read ERR
    do
      INFILE_1=${ERR}_1.fastq.gz
      INFILE_2=${ERR}_2.fastq.gz
      ID=${ERR}
      LB=`grep ${ERR} /localdisk/home/bjackso4/dros_dsim/fastq/jose/PRJEB7673.txt | cut -f18`
      SM=`grep ${ERR} /localdisk/home/bjackso4/dros_dsim/fastq/jose/PRJEB7673.txt | cut -f18`
      OUTFILE=/localdisk/home/bjackso4/dros_dsim/01_map_out/${ERR}.bam

      echo "nice -n 19 ./run_mapping.sh ${REFERENCE} /localdisk/home/bjackso4/dros_dsim/fastq/jose/${INFILE_1} /localdisk/home/bjackso4/dros_dsim/fastq/jose/${INFILE_2} ${ID} ${LB} ${SM} ${OUTFILE}" >> commands_jose.txt

    done
  }
