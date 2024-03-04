
library(dplyr)
library(ggplot2)

#download cities from
#MSD Live:
#McManamay, R., Vernon, C., Thurber, T., Gao, J., & O'Neill, B. (2024). 
## Data for "Divergent urban land trajectories under alternative population projections within the shared socioeconomic pathways" (Version v1) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2318472



cities <- read.csv(file="[your file path]/City_Case_studies.csv", header=TRUE)


city_sum <- cities %>%
  group_by(City, Type, Year, SSP) %>%
  summarize(uf_delta_area=sum(uf_delta_area))	



atlanta <- city_sum[which(city_sum$City=="Atlanta"),]
houston <- city_sum[which(city_sum$City=="Houston"),]
newyork <- city_sum[which(city_sum$City=="New_York"),]
la <- city_sum[which(city_sum$City=="Los_Angeles"),]


###############
### Atlanta Plots
atlanta_urban <- atlanta[which(atlanta$Type=="Urban"),]
ggplot(data=atlanta_urban, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

atlanta_rural <- atlanta[which(atlanta$Type=="Rural"),]
ggplot(data=atlanta_rural, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

## total urban area
atlanta_urban_m <- atlanta_m[which(atlanta_m$Type=="Urban"),]
ggplot(data=atlanta_urban_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

atlanta_rural_m <- atlanta_m[which(atlanta_m$Type=="Rural"),]
ggplot(data=atlanta_rural_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))


################
### Houston Plots
houston_urban <- houston[which(houston$Type=="Urban"),]
ggplot(data=houston_urban, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

houston_rural <- houston[which(houston$Type=="Rural"),]
ggplot(data=houston_rural, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

## total urban area
houston_urban_m <- houston_m[which(houston_m$Type=="Urban"),]
ggplot(data=houston_urban_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

houston_rural_m <- houston_m[which(houston_m$Type=="Rural"),]
ggplot(data=houston_rural_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

################
### New York Plots
newyork_urban <- newyork[which(newyork$Type=="Urban"),]
ggplot(data=newyork_urban, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

newyork_rural <- newyork[which(newyork$Type=="Rural"),]
ggplot(data=newyork_rural, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))
  
## total urban area
newyork_urban_m <- newyork_m[which(newyork_m$Type=="Urban"),]
ggplot(data=newyork_urban_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

newyork_rural_m <- newyork_m[which(newyork_m$Type=="Rural"),]
ggplot(data=newyork_rural_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))


### Los Angeles
la_urban <- la[which(la$Type=="Urban"),]
ggplot(data=la_urban, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

la_rural <- la[which(la$Type=="Rural"),]
ggplot(data=la_rural, aes(x=Year, y=uf_delta_area, color=SSP))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

## total urban area
la_urban_m <- la_m[which(la_m$Type=="Urban"),]
ggplot(data=la_urban_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))

la_rural_m <- la_m[which(la_m$Type=="Rural"),]
ggplot(data=la_rural_m, aes(x=Year, y=urban_area, color=SSP, linetype=PopScenario))+
  geom_smooth(size=2, level=0)+
  scale_color_brewer(palette="RdYlBu", direction=-1)+
  theme(axis.text=element_text(size=14), axis.title=element_text(size=16))
