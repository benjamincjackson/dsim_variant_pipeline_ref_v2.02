for FILE in `find /localdisk/home/bjackso4/dros_dsim/03_mark_duplicates_out/*bam`
do
  for REGION in Scf_4
  do
    SAMPLE=`echo $FILE | rev | cut -d'/' -f1 | rev | cut -d'.' -f1`
    echo "nice -n19 ./run_haplotype_caller.sh $FILE $SAMPLE $REGION" >> commands_Scf_4.txt
  done
done
