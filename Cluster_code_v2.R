library(reshape)
library(ggplot2)
##  ULD datasets


#obtain datasets at MSD Live:
#McManamay, R., Vernon, C., Thurber, T., Gao, J., & O'Neill, B. (2024). 
## Data for "Divergent urban land trajectories under alternative population projections within the shared socioeconomic pathways" (Version v1) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2318472



ssp2_rural <- read.csv(file="[your file path]/SSP2-Rural_norm.csv", header=TRUE)
ssp2_urban <- read.csv(file="[your file path]/SSP2-Urban_norm.csv", header=TRUE)

ssp3_rural <- read.csv(file="[your file path]/SSP3-Rural_norm.csv", header=TRUE)
ssp3_urban <- read.csv(file="[your file path]/SSP3-Urban_norm.csv", header=TRUE)

ssp5_rural <- read.csv(file="[your file path]/SSP5-Rural_norm.csv", header=TRUE)
ssp5_urban <- read.csv(file="[your file path]/SSP5-Urban_norm.csv", header=TRUE)



Urban_area <- read.csv(file="[your file path]/Urban_Areas.csv", header=TRUE)
Rural_area <- read.csv(file="[your file path]/Rural_Areas.csv", header=TRUE)

ssp2_rural_c <- ssp2_rural[-c(1)]
ssp2_urban_c <- ssp2_urban[-c(1)]

ssp3_rural_c <- ssp3_rural[-c(1)]
ssp3_urban_c <- ssp3_urban[-c(1)]

ssp5_rural_c <- ssp5_rural[-c(1)]
ssp5_urban_c <- ssp5_urban[-c(1)]



#distance matrix
ssp2_rural_d <- dist(ssp2_rural_c)
ssp2_urban_d <- dist(ssp2_urban_c)

ssp3_rural_d <- dist(ssp3_rural_c)
ssp3_urban_d <- dist(ssp3_urban_c)

ssp5_rural_d <- dist(ssp5_rural_c)
ssp5_urban_d <- dist(ssp5_urban_c)


#hierachical clustering

#ssp2_rural
ssp2_rural_clust<-hclust(ssp2_rural_d,method="ward.D2") 

plot(ssp2_rural_clust,labels=NULL, hang=-1) 

ssp2_rural_clust5 <- cutree(ssp2_rural_clust, k=5)
ssp2_rural_clust5 <- as.data.frame(ssp2_rural_clust5)
colnames(ssp2_rural_clust5) <- c("clusters")

ssp2_rural2 <- data.frame(ssp2_rural, ssp2_rural_clust5)

write.csv(ssp2_rural2, file="[your file path]/Cluster_Trend_analysis/ssp2_rural_clusters.csv")

#ssp2_urban

ssp2_urban_clust<-hclust(ssp2_urban_d,method="ward.D2") 

plot(ssp2_urban_clust,labels=NULL, hang=-1) 

ssp2_urban_clust5 <- cutree(ssp2_urban_clust, k=5)
ssp2_urban_clust5 <- as.data.frame(ssp2_urban_clust5)
colnames(ssp2_urban_clust5) <- c("clusters")

ssp2_urban2 <- data.frame(ssp2_urban, ssp2_urban_clust5)

write.csv(ssp2_urban2, file="[your file path]/Cluster_Trend_analysis/ssp2_urban_clusters.csv")



#ssp3_rural
ssp3_rural_clust<-hclust(ssp3_rural_d,method="ward.D2") 

plot(ssp3_rural_clust,labels=NULL, hang=-1) 

ssp3_rural_clust5 <- cutree(ssp3_rural_clust, k=5)
ssp3_rural_clust5 <- as.data.frame(ssp3_rural_clust5)
colnames(ssp3_rural_clust5) <- c("clusters")

ssp3_rural2 <- data.frame(ssp3_rural, ssp3_rural_clust5)

write.csv(ssp3_rural2, file="[your file path]/Cluster_Trend_analysis/ssp3_rural_clusters.csv")

#ssp3_urban

ssp3_urban_clust<-hclust(ssp3_urban_d,method="ward.D2") 

plot(ssp3_urban_clust,labels=NULL, hang=-1) 

ssp3_urban_clust5 <- cutree(ssp3_urban_clust, k=5)
ssp3_urban_clust5 <- as.data.frame(ssp3_urban_clust5)
colnames(ssp3_urban_clust5) <- c("clusters")

ssp3_urban2 <- data.frame(ssp3_urban, ssp3_urban_clust5)

write.csv(ssp3_urban2, file="[your file path]/Cluster_Trend_analysis/ssp3_urban_clusters.csv")





#ssp5_rural
ssp5_rural_clust<-hclust(ssp5_rural_d,method="ward.D2") 

plot(ssp5_rural_clust,labels=NULL, hang=-1) 

ssp5_rural_clust5 <- cutree(ssp5_rural_clust, k=5)
ssp5_rural_clust5 <- as.data.frame(ssp5_rural_clust5)
colnames(ssp5_rural_clust5) <- c("clusters")

ssp5_rural2 <- data.frame(ssp5_rural, ssp5_rural_clust5)

write.csv(ssp5_rural2, file="[your file path]/Cluster_Trend_analysis/ssp5_rural_clusters.csv")

#ssp5_urban

ssp5_urban_clust<-hclust(ssp5_urban_d,method="ward.D2") 

plot(ssp5_urban_clust,labels=NULL, hang=-1) 

ssp5_urban_clust5 <- cutree(ssp5_urban_clust, k=5)
ssp5_urban_clust5 <- as.data.frame(ssp5_urban_clust5)
colnames(ssp5_urban_clust5) <- c("clusters")

ssp5_urban2 <- data.frame(ssp5_urban, ssp5_urban_clust5)

write.csv(ssp5_urban2, file="[your file path]/Cluster_Trend_analysis/ssp5_urban_clusters.csv")



###############

#########
####

## plot trends by cluster

#ssp2_rural
ssp2_rural_melt <- melt(ssp2_rural2, id=c("FIPS_2", "clusters"))
ssp2_rural_melt$Year <- as.numeric(substr(ssp2_rural_melt$variable, 2,5))
ssp2_rural_melt$clusters <- as.factor(ssp2_rural_melt$clusters)

ggplot(ssp2_rural_melt, aes(y=value, x=Year, color=clusters, fill=clusters))+
geom_smooth(span=25, size=1.5, level=0.99)+
  scale_color_brewer(palette="BrBG")+
  scale_fill_brewer(palette="BrBG")+
  theme(text = element_text(size = 20))


#ssp2_urban
ssp2_urban_melt <- melt(ssp2_urban2, id=c("GEOID2", "clusters"))
ssp2_urban_melt$Year <- as.numeric(substr(ssp2_urban_melt$variable, 2,5))
ssp2_urban_melt$clusters <- as.factor(ssp2_urban_melt$clusters)

ggplot(ssp2_urban_melt, aes(y=value, x=Year, color=clusters, fill=clusters))+
  geom_smooth(span=25, size=1.5, level=0.99)+
  scale_color_brewer(palette="BrBG")+
  scale_fill_brewer(palette="BrBG")+
  theme(text = element_text(size = 20))





#ssp3_rural
ssp3_rural_melt <- melt(ssp3_rural2, id=c("FIPS_2", "clusters"))
ssp3_rural_melt$Year <- as.numeric(substr(ssp3_rural_melt$variable, 2,5))
ssp3_rural_melt$clusters <- as.factor(ssp3_rural_melt$clusters)

ggplot(ssp3_rural_melt, aes(y=value, x=Year, color=clusters, fill=clusters))+
  geom_smooth(span=25, size=1.5, level=0.99)+
  scale_color_brewer(palette="PRGn")+
  scale_fill_brewer(palette="PRGn")+
  theme(text = element_text(size = 20))


#ssp3_urban
ssp3_urban_melt <- melt(ssp3_urban2, id=c("GEOID2", "clusters"))
ssp3_urban_melt$Year <- as.numeric(substr(ssp3_urban_melt$variable, 2,5))
ssp3_urban_melt$clusters <- as.factor(ssp3_urban_melt$clusters)

ggplot(ssp3_urban_melt, aes(y=value, x=Year, color=clusters, fill=clusters))+
  geom_smooth(span=25, size=1.5, level=0.99)+
  scale_color_brewer(palette="PRGn")+
  scale_fill_brewer(palette="PRGn")+
  theme(text = element_text(size = 20))




#ssp5_rural
ssp5_rural_melt <- melt(ssp5_rural2, id=c("FIPS_2", "clusters"))
ssp5_rural_melt$Year <- as.numeric(substr(ssp5_rural_melt$variable, 2,5))
ssp5_rural_melt$clusters <- as.factor(ssp5_rural_melt$clusters)

ggplot(ssp5_rural_melt, aes(y=value, x=Year, color=clusters, fill=clusters))+
  geom_smooth(span=25, size=1.5, level=0.99)+
  scale_color_brewer(palette="RdYlBu")+
  scale_fill_brewer(palette="RdYlBu")+
  theme(text = element_text(size = 20))


#ssp5_urban
ssp5_urban_melt <- melt(ssp5_urban2, id=c("GEOID2", "clusters"))
ssp5_urban_melt$Year <- as.numeric(substr(ssp5_urban_melt$variable, 2,5))
ssp5_urban_melt$clusters <- as.factor(ssp5_urban_melt$clusters)

ggplot(ssp5_urban_melt, aes(y=value, x=Year, color=clusters, fill=clusters))+
  geom_smooth(span=25, size=1.5, level=0.99)+
  scale_color_brewer(palette="RdYlBu")+
  scale_fill_brewer(palette="RdYlBu")+
  theme(text = element_text(size = 20))