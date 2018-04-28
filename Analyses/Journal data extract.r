# Pull in relevant data from Journal data source files
# Replace with local directory where needed

Journal_data<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Google Scholar journals with WoS data.csv")

GS_rank<-Journal_data[,"GS_Rank"]
h5.index<-Journal_data[,"h5.index"]
Journal_names<-Journal_data[,"Publication"]
Journal_cites<-Journal_data[,"Total_cites"]
JIF_2016<-Journal_data[,"JIF_2016"]
WOS_rank<-Journal_data[,"WOS_rank"]


############# Acta Palaeontologica Polonica

# Note that some lines are still corrupted here, even after parsing. These were eliminated to avoid data errors (file version 2)
APP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Acta Palaeontologica Polonica/ActaPalaeontologicaPolonica_Scopus2.csv")
APP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Acta Palaeontologica Polonica/ActaPalaeontologicaPolonica_Unpaywall.csv")

# Create a new factor for OA status
APP_OA<-APP_unpaywall[,"is_oa"]

APP_DOI<-APP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
APP_cite<-APP_scopus[,"Cited.by"]
APP_cite[is.na(APP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Acta Palaeontologica Polonica/APP_citefreq.png',
         width=1000,height=600)
APP_hist<-hist(APP_cite,col="red",xlab="Citation count",
               main="Acta Palaeontologica Polonica",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(APP_cite),max(APP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(APP_cite),sd=sd(APP_cite)) 
yfit <- yfit*diff(APP_hist$mids[1:2])*length(APP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.565,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Acta Palaeontologica Polonica/APP_citedensity.png',
         width=1000,height=600)
plot(density(APP_cite),xlab="Citation count",
     main="Acta Palaeontologica Polonica")
polygon((density(APP_cite)),col = "red")
abline(v=1.565,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(APP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Acta Palaeontologica Polonica/APP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(APP_OA)),main="Acta Palaeontologica Polonica, OA proportion")
dev.off()

########### Bulletin of Geosciences

BoG_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Bulletin of Geosciences/BulletinofGeosciences_Scopus.csv")
BoG_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Bulletin of Geosciences/BulletinofGeosciences_Unpaywall.csv")

# Create a new factor for OA status
BoG_OA<-BoG_unpaywall[,"is_oa"]

BoG_DOI<-BoG_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
BoG_cite<-BoG_scopus[,"Cited.by"]
BoG_cite[is.na(BoG_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_citefreq.png',
         width=1000,height=600)
BoG_hist<-hist(BoG_cite,col="red",xlab="Citation count",
               main="Bulletin of Geosciences",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(BoG_cite),max(BoG_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(BoG_cite),sd=sd(BoG_cite)) 
yfit <- yfit*diff(BoG_hist$mids[1:2])*length(BoG_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.175,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_citedensity.png',
         width=1000,height=600)
plot(density(BoG_cite),xlab="Citation count",
     main="Bulletin of Geosciences")
polygon((density(BoG_cite)),col = "red")
abline(v=1.175,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(BoG_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(BoG_OA)),main="Bulletin of Geosciences, OA proportion")
dev.off()


########## Comptes Rendus Palevol

CRP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Comptes Rendus Palevol/ComptesRendusPalevol_Scopus.csv")
CRP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Comptes Rendus Palevol/ComptesRendusPalevol_Unpaywall.csv")

# Create a new factor for OA status
CRP_OA<-CRP_unpaywall[,"is_oa"]

CRP_DOI<-CRP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
CRP_cite<-CRP_scopus[,"Cited.by"]
CRP_cite[is.na(CRP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_citefreq.png',
         width=1000,height=600)
CRP_hist<-hist(CRP_cite,col="red",xlab="Citation count",
               main="Comptes Rendus Palevol",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(CRP_cite),max(CRP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(CRP_cite),sd=sd(CRP_cite)) 
yfit <- yfit*diff(CRP_hist$mids[1:2])*length(CRP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_citedensity.png',
         width=1000,height=600)
plot(density(CRP_cite),xlab="Citation count",
     main="Comptes Rendus Palevol")
polygon((density(CRP_cite)),col = "red")
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(CRP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(CRP_OA)),main="Comptes Rendus Palevol, OA proportion")
dev.off()


########## Cretaceous Research

CR_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Cretaceous Research/CretaceousResearch_Scopus.csv")
CR_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Cretaceous Research/CretaceousResearch_Unpaywall.csv")

# Create a new factor for OA status
CR_OA<-CR_unpaywall[,"is_oa"]

CR_DOI<-CR_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
CR_cite<-CR_scopus[,"Cited.by"]
CR_cite[is.na(CR_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_citefreq.png',
         width=1000,height=600)
CR_hist<-hist(CR_cite,col="red",xlab="Citation count",
               main="Cretaceous Research",breaks=30)

# Add a normal distribution curve
xfit<-seq(min(CR_cite),max(CR_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(CR_cite),sd=sd(CR_cite)) 
yfit <- yfit*diff(CR_hist$mids[1:2])*length(CR_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=2.015,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_citedensity.png',
         width=1000,height=600)
plot(density(CR_cite),xlab="Citation count",
     main="Cretaceous Research")
polygon((density(CR_cite)),col = "red")
abline(v=2.015,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(CR_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(CR_OA)),main="Cretaceous Research, OA proportion")
dev.off()


########## Facies

Facies_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Facies/Facies_Scopus.csv")
Facies_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Facies/Facies_Unpaywall.csv")

# Create a new factor for OA status
Facies_OA<-Facies_unpaywall[,"is_oa"]

Facies_DOI<-Facies_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Facies_cite<-Facies_scopus[,"Cited.by"]
Facies_cite[is.na(Facies_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Facies/Facies_citefreq.png',
         width=1000,height=600)
Facies_hist<-hist(Facies_cite,col="red",xlab="Citation count",
              main="Facies",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Facies_cite),max(Facies_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Facies_cite),sd=sd(Facies_cite)) 
yfit <- yfit*diff(Facies_hist$mids[1:2])*length(Facies_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.576,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Facies/Facies_citedensity.png',
         width=1000,height=600)
plot(density(Facies_cite),xlab="Citation count",
     main="Facies")
polygon((density(Facies_cite)),col = "red")
abline(v=1.576,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(Facies_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Facies/Facies_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Facies_OA)),main="Facies, OA proportion")
dev.off()


########## Geobios

Geobios_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Geobios/Geobios_Scopus.csv")
Geobios_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Geobios/Geobios_Unpaywall.csv")

# Create a new factor for OA status
Geobios_OA<-Geobios_unpaywall[,"is_oa"]

Geobios_DOI<-Geobios_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Geobios_cite<-Geobios_scopus[,"Cited.by"]
Geobios_cite[is.na(Geobios_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Geobios/Geobios_citefreq.png',
         width=1000,height=600)
Geobios_hist<-hist(Geobios_cite,col="red",xlab="Citation count",
                  main="Geobios",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Geobios_cite),max(Geobios_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Geobios_cite),sd=sd(Geobios_cite)) 
yfit <- yfit*diff(Geobios_hist$mids[1:2])*length(Geobios_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.431,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Geobios/Geobios_citedensity.png',
         width=1000,height=600)
plot(density(Geobios_cite),xlab="Citation count",
     main="Geobios")
polygon((density(Geobios_cite)),col = "red")
abline(v=1.431,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(Geobios_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Geobios/Geobios_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Geobios_OA)),main="Geobios, OA proportion")
dev.off()


########## Historical Biology

HB_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Historical Biology/HistoricalBiology_Scopus.csv")
HB_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Historical Biology/HistoricalBiology_Unpaywall.csv")

# Create a new factor for OA status
HB_OA<-HB_unpaywall[,"is_oa"]

HB_DOI<-HB_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
HB_cite<-HB_scopus[,"Cited.by"]
HB_cite[is.na(HB_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Historical Biology/HB_citefreq.png',
         width=1000,height=600)
HB_hist<-hist(HB_cite,col="red",xlab="Citation count",
                   main="Historical Biology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(HB_cite),max(HB_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(HB_cite),sd=sd(HB_cite)) 
yfit <- yfit*diff(HB_hist$mids[1:2])*length(HB_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.556,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Historical Biology/HB_citedensity.png',
         width=1000,height=600)
plot(density(HB_cite),xlab="Citation count",
     main="Historical Biology")
polygon((density(HB_cite)),col = "red")
abline(v=1.556,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(HB_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Historical Biology/HB_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(HB_OA)),main="Historical Biology, OA proportion")
dev.off()


########## Journal of Paleontology

JoP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Journal of Paleontology/JournalofPaleontology_Scopus.csv")
JoP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/Journal data/Journal of Paleontology/JournalofPaleontology_Unpaywall.csv")

# Create a new factor for OA status
JoP_OA<-JoP_unpaywall[,"is_oa"]

JoP_DOI<-JoP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
JoP_cite<-JoP_scopus[,"Cited.by"]
JoP_cite[is.na(JoP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Paleontology/JoP_citefreq.png',
         width=1000,height=600)
JoP_hist<-hist(JoP_cite,col="red",xlab="Citation count",
              main="Journal of Paleontology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(JoP_cite),max(JoP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(JoP_cite),sd=sd(JoP_cite)) 
yfit <- yfit*diff(JoP_hist$mids[1:2])*length(JoP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.591,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Paleontology/JoP_citedensity.png',
         width=1000,height=600)
plot(density(JoP_cite),xlab="Citation count",
     main="Journal of Paleontology")
polygon((density(JoP_cite)),col = "red")
abline(v=1.591,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(JoP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Paleontology/JoP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(JoP_OA)),main="Journal of Paleontology, OA proportion")
dev.off()