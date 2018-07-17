for FILE in `find /localdisk/home/bjackso4/dros_dsim/03_mark_duplicates_out/*bam`
do
  for REGION in Scf_2L Scf_2R Scf_3L Scf_3R Scf_X
  do
    SAMPLE=`echo $FILE | rev | cut -d'/' -f1 | rev | cut -d'.' -f1`
    echo "nice -n19 ./run_haplotype_caller.sh $FILE $SAMPLE $REGION" >> commands.txt
  done
done
