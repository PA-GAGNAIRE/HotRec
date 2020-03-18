##############################################################
##################### LDHELMET INFERENCE #####################
##############################################################

import scipy.stats
import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('infer_rate.txt') #charge le document texte des taux inférés par LDH comme des vecteurs
positions = data[:,0] #indique que la premiere colonne est le vecteur positions
rates = data[:,1] #la deuxieme colonne est le vecteur rates

num_bins = 2000
v, bin_edges, _ = scipy.stats.binned_statistic(
    positions, rates, bins=num_bins, range=(0,1000000))

#Conversion des valeurs en rho/pb en cM/Mb
r = (np.divide(v, 4 * (2.5*10**4))) 

#Enleve les bins sans variants
#x = bin_edges[:-1][np.logical_not(np.isnan(v))]
#y = v[np.logical_not(np.isnan(v))] 

#Ajouter ce vecteur au tableau récapitulatif des taux de recombinaison
recap = np.loadtxt('Recombination_rate.txt')
x1 = recap[:,0] 
x2 = recap[:,1]
x3 = recap[:,2]

#Convertir les np.array en liste
x1=x1.tolist()
x2=x2.tolist()
x3=x3.tolist()
r=r.tolist()


#Faire le tableau des r donnés dans r, simulés par msprime et inférés par ldhelmet avec une boucle for
rec = open('All_recombination_rate.txt', 'w')
for i in range(len(x1)):
	pos = str(x1[i])
	real_rate = str(x2[i])
	simul_rate = str(x3[i])
	infer_rate = str(r[i])
	rec.write(pos + "\t" + real_rate + "\t" + simul_rate + "\t" + infer_rate +"\n")


rec.close()



