########################################################################
############################# PLOT OUTPUTS #############################
########################################################################


#Chargement du fichier
import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("infer_rate.txt")
data #pour affichier le fichier

#Sélection des colonnes
A = data[:,0] #positions des SNP
A
B = data[:,1] #mean recombination rate
B

#Représentation graphique
plt.plot(A, B, color = "indianred")
plt.xlabel("Positions (pb)")
plt.ylabel("Recombination rate(1/pb)")
plt.title("LDH Recombination Landscape, Ne = 25 000, \n block penalty = 5, MCMC = 1000000")
plt.savefig("large_scale_hotspot_bp5_1M.png")
#plt.show()

quit()


