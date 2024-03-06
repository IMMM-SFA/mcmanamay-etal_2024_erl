install.packages("ggallin")

library(ggplot2)
library(ggallin)
library(dplyr)

## obtain data from MSD Live
#McManamay, R., Vernon, C., Thurber, T., Gao, J., & O'Neill, B. (2024). 
## Data for "Divergent urban land trajectories under alternative population projections within the shared socioeconomic pathways" (Version v1) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2318472



data <- read.csv(file="[your file path]/JO_Gao_pop_ufdelta.csv", header=TRUE)


data_state <- data %>%
  group_by(STATE, Type, Year, scenario) %>%
  summarize(Pop_delta=sum(PopDelta), Urban_delta=sum(uf_delta_area), PopPC=mean(Pop_per_change), UrbPC=mean(Perc_change))	


data$ssp_year <- paste0(data$scenario,"_", data$Year)

group.colors <- c(ssp2_2050="#9ecae1", ssp3_2050="#fff7bc", ssp5_2050="#fc9272", ssp2_2100="#3182bd", ssp3_2100="#fec44f",ssp5_2100="#de2d26")


ggplot(data=data, aes(x=PopDelta, y=uf_delta_area, group=ssp_year, color=ssp_year))+
  geom_point()+
  scale_x_continuous(trans = pseudolog10_trans, breaks=c(-4e07,-2e07,-1e06,-1e04,-1e03, -1e02,0,1e02, 1e03,1e04,1e06,2e07)) +
  scale_y_continuous(trans = pseudolog10_trans, breaks=c(-3000, -2000, -1000, -500, -200, -100, 0, 100, 200,500, 3000, 6000))+
  scale_colour_manual(values=group.colors)


data_urban <- data[which(data$Type=="Urban"),]
data_rural <- data[which(data$Type=="Rural"),]


ggplot(data=data_urban, aes(x=PopDelta, y=uf_delta_area, group=ssp_year, color=ssp_year))+
  geom_hline(yintercept = 0, color="darkgrey", size = 0.8)+
  geom_vline(xintercept = 0, color="darkgrey",size=0.8)+
  geom_point()+
  ylim(-3000,6000)+
  xlim(-4e07,2e07)+
  scale_x_continuous(trans = pseudolog10_trans, breaks=c(-4e07,-2e07,-1e06,-1e04,-1e03, -1e02,0,1e02, 1e03,1e04,1e06,2e07)) +
  scale_y_continuous(trans = pseudolog10_trans, breaks=c(-3000, -2000, -1000, -500, -200, -100, 0, 100, 200,500, 3000, 6000))+
  scale_colour_manual(values=group.colors)
  


ggplot(data=data_urban, aes(x=PopDelta, y=uf_delta_area, group=ssp_year, color=ssp_year))+
  geom_hline(yintercept = 0, color="darkgrey", size = 0.8)+
  geom_vline(xintercept = 0, color="darkgrey",size=0.8)+
  geom_point()+
  ylim(-3000,6000)+
  xlim(-4e07,2e07)+
  scale_x_continuous(trans = pseudolog10_trans) +
  scale_y_continuous(trans = pseudolog10_trans)+
  scale_colour_manual(values=group.colors)


ggplot(data=data_rural, aes(x=PopDelta, y=uf_delta_area, group=ssp_year, color=ssp_year))+
  geom_hline(yintercept = 0, color="darkgrey", size = 0.8)+
  geom_vline(xintercept = 0, color="darkgrey",size=0.8)+
  geom_point()+
  ylim(-3000,6000)+
  xlim(-4e07,2e07)+
  scale_x_continuous(trans = pseudolog10_trans, breaks=c(-4e07,-2e07,-1e06,-1e04,-1e03, -1e02,0,1e02, 1e03,1e04,1e06,2e07)) +
  scale_y_continuous(trans = pseudolog10_trans, breaks=c(-3000, -2000, -1000, -500, -200, -100, 0, 100, 200,500, 3000, 6000))+
  scale_colour_manual(values=group.colors)




#### State summary comparison
data_state$ssp_year <- paste0(data_state$scenario,"_", data_state$Year)


data_state_urban <- data_state[which(data_state$Type=="Urban"),]
data_state_rural <- data_state[which(data_state$Type=="Rural"),]


ggplot(data=data_state_urban, aes(x=Pop_delta, y=Urban_delta, group=ssp_year, color=ssp_year))+
  geom_hline(yintercept = 0, color="darkgrey", size = 0.8)+
  geom_vline(xintercept = 0, color="darkgrey",size=0.8)+
  geom_point()+
  ylim(-3000,6000)+
  xlim(-4e07,2e07)+
  scale_x_continuous(trans = pseudolog10_trans, breaks=c(-4e07,-2e07,-1e06,-1e04,-1e03, -1e02,0,1e02, 1e03,1e04,1e06,2e07)) +
  scale_y_continuous(trans = pseudolog10_trans, breaks=c(-3000, -2000, -1000, -500, -200, -100, 0, 100, 200,500, 3000, 6000))+
  scale_colour_manual(values=group.colors)



ggplot(data=data_state_rural, aes(x=Pop_delta, y=Urban_delta, group=ssp_year, color=ssp_year))+
  geom_hline(yintercept = 0, color="darkgrey", size = 0.8)+
  geom_vline(xintercept = 0, color="darkgrey",size=0.8)+
  geom_point()+
  ylim(-3000,6000)+
  xlim(-4e07,2e07)+
  scale_x_continuous(trans = pseudolog10_trans, breaks=c(-4e07,-2e07,-1e06,-1e04,-1e03, -1e02,0,1e02, 1e03,1e04,1e06,2e07)) +
  scale_y_continuous(trans = pseudolog10_trans, breaks=c(-3000, -2000, -1000, -500, -200, -100, 0, 100, 200,500, 3000, 6000))+
  scale_colour_manual(values=group.colors)


ggplot(data=data_state_rural, aes(x=PopPC, y=UrbPC, group=ssp_year, color=ssp_year))+
  geom_hline(yintercept = 0, color="darkgrey", size = 0.8)+
  geom_vline(xintercept = 0, color="darkgrey",size=0.8)+
  geom_point()+
  ylim(-3000,6000)+
  xlim(-4e07,2e07)+
  scale_x_continuous(trans = pseudolog10_trans, breaks=c(-4e07,-2e07,-1e06,-1e04,-1e03, -1e02,0,1e02, 1e03,1e04,1e06,2e07)) +
  scale_y_continuous(trans = pseudolog10_trans, breaks=c(-3000, -2000, -1000, -500, -200, -100, 0, 100, 200,500, 3000, 6000))+
  scale_colour_manual(values=group.colors)
