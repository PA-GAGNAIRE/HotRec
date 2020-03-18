#####################################################################################
############################# ANCESTRAL ALLELES PRIOR ############################### 
#####################################################################################

#Importe les fichiers
pos <- read.table("/home/RUN_LD/ne250m_ss20_bp10/POS.txt", header = FALSE, sep="\t") #fichiers des positions et des alleles de reference

#Matrice des probabilites des etats ancestraux
#mymat <- matrix(nrow=30, ncol=30)
anc <- NULL

for (i in 1:nrow(pos)) {
  if (pos[i,2] == "A")
  {anc <- rbind(anc, c(pos[i,1], c("1.0", "0.0", "0.0", "0.0")))}
  if (pos[i,2] == "C")
  {anc <- rbind(anc, c(pos[i,1], c("0.0", "1.0", "0.0", "0.0")))}
  if (pos[i,2] == "G")
  {anc <- rbind(anc, c(pos[i,1], c("0.0", "0.0", "1.0", "0.0")))}
  if (pos[i,2] == "T")
  {anc <- rbind(anc, c(pos[i,1], c("0.0", "0.0", "0.0", "1.0")))}
}


#Exporter en fichier txt
write.table(anc,file="/home/RUN_LD/ne250m_ss20_bp10/anc_prior.txt", sep =" ", quote = F, dec = ".", col.names = FALSE, row.names = FALSE)
