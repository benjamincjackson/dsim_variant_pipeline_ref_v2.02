# use parallel to run GATK combineGVCFs for each contig

# e.g. run four instances of the script at any given time using -j4
parallel :::: commands_Scf_4.txt
