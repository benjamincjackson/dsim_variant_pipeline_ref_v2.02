# use parallel to run GATK genotypeGVCFs for each contig

# e.g. run four instances of the script at any given time using -j4
parallel -j n_proc.txt :::: commands_Scf_4.txt
