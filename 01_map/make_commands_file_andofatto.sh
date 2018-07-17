# make the commands file for the mapping program

REFERENCE='/localdisk/home/bjackso4/dros_dsim/reference/dsim-all-chromosome-r2.02.fasta'

tail -n+2 /localdisk/home/bjackso4/dros_dsim/fastq/andolfatto/PRJNA215932.txt | cut -f5 | {
    while read SRR
    do
      INFILE_1=${SRR}_1.fastq.gz
      INFILE_2=${SRR}_2.fastq.gz
      ID=${SRR}
      LB=`grep ${SRR} /localdisk/home/bjackso4/dros_dsim/fastq/andolfatto/PRJNA215932.txt | cut -f18`
      SM=`grep ${SRR} /localdisk/home/bjackso4/dros_dsim/fastq/andolfatto/PRJNA215932.txt | cut -f18`
      OUTFILE=/localdisk/home/bjackso4/dros_dsim/01_map_out/${SRR}.bam

      echo "nice -n 19 ./run_mapping.sh ${REFERENCE} /localdisk/home/bjackso4/dros_dsim/fastq/andolfatto/${INFILE_1} /localdisk/home/bjackso4/dros_dsim/fastq/andolfatto/${INFILE_2} ${ID} ${LB} ${SM} ${OUTFILE}" >> commands_andolfatto.txt

    done
  }
