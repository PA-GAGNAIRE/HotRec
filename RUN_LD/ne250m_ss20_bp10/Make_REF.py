########################################################################
############################# EDIT REFERENCE ###########################
########################################################################

from pyfaidx import Fasta

#Génère une séquence de "référence" contenant que des A
seq = "A" * 10**6  #a modifier si on change la taille du segment simulé
ref = open("REF.fa", "w")
ref.write(">" + '1' + "\n" + seq + "\n")
ref.close

#Remplace dans la séquence de A les positions variable par les allèles de référence du fichier POS
with open('POS.txt') as mut_table:
	with Fasta('REF.fa', mutable=True) as fasta:
		for record in fasta:
			for line in mut_table:
				pos, base = line.rstrip().split()
				record[int(pos)-1] = base
