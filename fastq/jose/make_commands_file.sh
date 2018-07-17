# download the campos dsim fastq files from ebi:
# https://www.ebi.ac.uk/ena/data/view/PRJEB7673

# which are listed in the file 'PRJEB7673.txt'
# this file has a header, and then the (paired) fastq files are semi-colon
# separated in the eleventh column

tail -n+2 PRJEB7673.txt | cut -f11 | {
  while read LINE
  do
    FILE1=`echo $LINE | cut -d';' -f1`
    echo "wget" $FILE1 >> commands.txt
    FILE2=`echo $LINE | cut -d';' -f2`
    echo "wget" $FILE2 >> commands.txt
  done
}
