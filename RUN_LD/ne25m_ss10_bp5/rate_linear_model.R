################################################################################
############################# MODELE LINEAIRE TAUX #############################
############################### DE RECOMBINAISON ############################### 
################################################################################  

###Make rate table
#Importe les fichiers
df <- read.table("/home/RUN_LD/ne25m_ss10_bp5/All_recombination_rate.txt", header = FALSE, sep="\t") #resultats simulations msprime
    
#Ajoute les noms au x colonnes
colnames(df) <- c("positions","real_rate","simul_rate", "infer_rate")

#Supprimer lesl ignes ou il y a une valeur manquante dans la colonne infer_rate
df <- df[!is.na(df$infer_rate), ]

#Représentation graphique
#install.packages("reshape2")
#library(reshape2)  
library(ggplot2)

#Repsésentation sur le meme graphique de la carte simulée par msprime et inferee par LDhelmet
graph <- ggplot(df, aes(x=positions))+
  geom_line(aes(y=simul_rate), size=0.5, color="deepskyblue3") + # msprime simulated rates
  geom_line(aes(y=infer_rate), size=0.5, color="coral3") + #ldhelmet inference
  theme_linedraw() + #encadrer le graphique
  theme(
    panel.background = element_rect(fill = "white",
                                    colour = "black",
                                    size = 0.5, linetype = "solid")) + #changer la couleur de fond
  ggtitle("LDhelmet Recombination Landscape compared to MSPRIME simulations, \n bp = 5, MCMC = 1 000 000")+
  ylab("Recombination Rate (M/pb)")+
  xlab("Positions (bp)")+
  theme(legend.title = element_blank(),
        plot.title = element_text(hjust = 0.5)) #pour centrer les titres des axes et du graphe
graph


#Enregistrement de la représentation graphique du modèle linéaire
dev.copy(png,"large_scale_hotspot_infer_vs_simul.png",width=8,height=6,units="in",res=100)
dev.off()
    
##### Modele lineaire #####
#install.packages("lmtest")
#install.packages("zoo")
library(zoo)
library(lmtest)

reg <- lm(infer_rate~simul_rate, data=df)
plot(df$simul_rate, df$infer_rate, pch = 16, cex = 1, col = "deepskyblue3", main = "LDhelmet infered rates plotted against MSPRIME simulated rates", xlab = "MSPRIME simulated rate (M/pb)", ylab = "LDhelmet infered rate (M/pb)")
abline(lm(infer_rate~simul_rate, data=df), col = "red") #ajoute la droite de regression
#Enregistrement de la représentation graphique du modèle linéaire
dev.copy(png,"large_scale_hotspot_lm.png",width=8,height=6,units="in",res=100)
dev.off()

#Summary regression
summary(reg)
intercept <- summary(reg)$coefficients[1, 1]
sd_intercept <- summary(reg)$coefficients[1, 2]
pval_intercept <- summary(reg)$coefficients[1, 4]
pente <- summary(reg)$coefficients[2, 1]
sd_pente <- summary(reg)$coefficients[2, 2]
pval_pente <- summary(reg)$coefficients[2, 4]
r_squared <- summary(reg)$r.squared
adj_r_squared <- summary(reg)$adj.r.squared


#Indépendance des résidus
pval_dwtest <- dwtest(reg)$p.value

#Normalite des residus 
#Test de Shapiro-Wilk
pval_shapirotest <- shapiro.test(residuals(reg))$p.value

#Homoscedasticite des residus
#Test  de Breush-Pagen
pval_bptest <- bptest(reg)$p.value

####Comparaison nombre de hotspots simulés VS nombre de hotspots inferes
#On considère une position comme etant un hotspot si son taux de recombinaison est 5 fois superieur au taux local
low_rate <- as.data.frame(df[1:1000,])
high_rate <- as.data.frame(df[1001:2000,])
simul_hotspot_1 <- nrow(subset(low_rate, simul_rate >= 5e-8))
infer_hotspot_1 <- nrow(subset(low_rate, infer_rate >= 5e-8))
simul_hotspot_3 <- nrow(subset(high_rate, simul_rate >= 15e-8))
infer_hotspot_3 <- nrow(subset(high_rate, infer_rate >= 15e-8))

###Summary dataframe
df1 <- data.frame(matrix(NA, ncol=15, nrow=1))
colnames(df1) <- c("intercept", "sd_intercept", "pval_intercep", "pente", "sd_pente", "pval_pente", "r_squared", "adj_r_suqared", "pval_dwtest", "pval_shapirotest", "pval_bptest", "simul_hotspot_1", "infer_hotspot_1", "simul_hotspot_3", "infer_hotspot_3")
df1[,1] <- as.numeric(c(intercept))  #valeur intercep
df1[,2] <- as.numeric(c(sd_intercept)) #ecart type intercept
df1[,3] <- as.numeric(c(pval_intercept)) 
df1[,4] <- as.numeric(c(pente))
df1[,5] <- as.numeric(c(sd_pente)) 
df1[,6] <- as.numeric(c(pval_pente)) 
df1[,7] <- as.numeric(c(r_squared)) 
df1[,8] <- as.numeric(c(adj_r_squared)) 
df1[,9] <- as.numeric(c(pval_dwtest)) 
df1[,10] <- as.numeric(c(pval_shapirotest)) 
df1[,11] <- as.numeric(c(pval_bptest)) 
df1[,12] <- as.numeric(c(simul_hotspot_1)) 
df1[,13] <- as.numeric(c(infer_hotspot_1)) 
df1[,14] <- as.numeric(c(simul_hotspot_3)) 
df1[,15] <- as.numeric(c(infer_hotspot_3)) 

#Exporter en fichier txt
#write.table(df1,file="/home/pierre-alexandre.gagnaire/Documents/ANALYSES/Simulations_msprime/data.txt", sep ="\t", quote = F, dec = ".", col.names = TRUE, row.names = FALSE)
write.csv(df1, file = "/home/RUN_LD/ne25m_ss10_bp5/large_scale_hotspot_recap_lm.csv")
