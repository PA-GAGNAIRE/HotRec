The Rscript `get_outgroup_state.R` reads the output of a blastn search against an outgroup reference genome:

`blastn -subject ./subject_reference_genome.fa -query list_of_query_sequences_200bp.fa -out OUT_BLASTN_SNP_Seqs_200bp -num_threads 10 -outfmt "6 qseqid qlen sseqid bitscore evalue length pident mismatch qstart qend sstart send qseq sseq"`

To run:
`Rscript --vanilla get_outgroup_state.R OUT_BLASTN_SNP_Seqs_200bp outfile_name.txt`
