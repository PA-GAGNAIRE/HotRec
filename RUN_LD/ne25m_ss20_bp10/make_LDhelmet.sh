###############################################################################
############################# MAKE LDHELMET FILE ##############################
###############################################################################

#!/bin/bash

#run la simulation avec msprime
python simulation.py

#enlève les lignes dupliqées
#k2,2 signifie que sort trie sur la deuxieme colonne
#n signifie que le trie se fait numériquement par ordre croissant (sinon ça fait un tri bizarre)
grep '#' large_scale_hotspot_int.vcf > large_scale_hotspot.vcf #pour récupérer l'entête comme il faut
grep -v '#' large_scale_hotspot_int.vcf |sort -bunk2,2 >> large_scale_hotspot.vcf #met les variants non dupliqué à la suite du fichier avec l'entête

#Récupère juste les positions et les allèles de références du fichier VCF pour mettre dans un fichier POS.txt
grep -v '#' large_scale_hotspot.vcf | cut -f 2,4 > POS.txt #POS.txt va servir pour faire la matrice des états ancestraux

#Génome de référence (réalisé en générant d'abord une séquence de 1 Mb de A et on rajoute sur celle ci les allèles de référence des positions variables
python Make_REF.py

#fait un fasta pour tous les individus a partir du vcf et sur génome de référence (créée un fichier de séquence fasta par individu)
vcf2fasta large_scale_hotspot.vcf -f REF.fa

#fait un multifasta a partir des fasta de tous les individus
cat tsk* > LDH_large_scale_hotspot.fa

#supprime tous les dossiers fasta des individus
rm tsk*


#Faire les fichiers .snps et .pos avec vcftools qui sont plus rapides à traiter dans ldhelmet
vcftools --vcf large_scale_hotspot.vcf --ldhelmet --chr 1 --out large_scale_hotspot

#Enleve les fichiers transitoires inutiles
rm REF.fa.fai
rm large_scale_hotspot.log



