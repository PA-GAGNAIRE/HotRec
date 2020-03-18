########################################################################
############################# SIMULATIONS ##############################
########################################################################

import msprime
import scipy.stats
import numpy as np
import matplotlib.pyplot as plt

#Import recombination map
infile = "/RUN/genetic_map_large_scale_hotspot.txt"
recomb_map = msprime.RecombinationMap.read_hapmap(infile)

#Récupère positions et tauxbinnés en 2000 fenêtre de 500 pour la représentation graphique
positions = np.array(recomb_map.get_positions()[1:]) #récupère les positions
rates = np.array(recomb_map.get_rates()[1:]) #récupère les taux
num_bins = 2000 #nombre de fenetres (200 pour faire des fenetres de 500 si le chrom fait 100kb, si il fait 1Mb il faut 2000bins pour avoir des fenetres de 500)

v, bin_edges, _ = scipy.stats.binned_statistic(
    positions, rates, bins=num_bins)

x = bin_edges[:-1][np.logical_not(np.isnan(v))]#enlève les valeurs manquantes = vecteurs positions binné
y = v[np.logical_not(np.isnan(v))]#idem = vectuer des taux binné

#Simulation tree sequence
tree_sequence = msprime.simulate(
    sample_size=40, #sample_size = 200 pour avoir ensuite 100 individus diploides dans le VCF
    Ne=2.5*10**4,
    recombination_map=recomb_map)

breakpoints = np.array(list(tree_sequence.breakpoints())) #récupère les breakpoints

tree_sequence = msprime.mutate(
	tree_sequence, rate=10**-8,
	model=msprime.InfiniteSites(alphabet=msprime.NUCLEOTIDES))

#Représentation graphique
v, bin_edges = np.histogram(breakpoints, num_bins, density=None)
n = 40
x1 = np.arange(1, n, 1) #vecteur de valeurs de 1 à 99
x2 = np.full(shape=n-1, fill_value = 1) #vecteurs de 99 "1"
x3 = np.divide(x2,x1) #divise le vecteur x2 par x1 (1/1, 1/2, 1/3 ...)
somme = np.sum(x3) # somme du vecteur x3 
rho = np.divide(v, somme) #on obtient le 4Ner fois la taille des bins 
r = np.divide(rho, 4 * (2.5*10**4) * 500)

#Représentation graphique
plt.plot(bin_edges[:-1],y, label = "recomb_map", color = "blue")
plt.plot(bin_edges[:-1],r, label = "simul_map", color = "orange")
plt.legend()
plt.xlabel("Positions (pb)")
plt.ylabel("Recombination rate(M/pb)")
plt.title("Fine scale recombination landscape \n Ne = 25 000, Sample size = 20")
plt.savefig("simul_large_scale_hotspot.png")

#Tableau récapitulatif
bin_edges=bin_edges[:-1].tolist()
y=y.tolist()
r=r.tolist()

rec = open('Recombination_rate.txt', 'w')
for i in range(len(bin_edges)):
	pos = str(bin_edges[i])
	real_rate = str(y[i])
	simul_rate = str(r[i])
	rec.write(pos + "\t" + real_rate + "\t" + simul_rate + "\n")


rec.close()

#Export to a vcf file
with open("large_scale_hotspot_int.vcf", "w") as vcf_file: #changer le nom du fichier output
    tree_sequence.write_vcf(vcf_file, ploidy=2) # ploidie = 2 car on veut des dipoides
