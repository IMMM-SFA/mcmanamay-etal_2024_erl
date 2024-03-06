library(raster)
#library(maptools)
#library(rasterVis)
#library(maps)
library(rgdal)
library(dplyr)
library(bnspatial)
library(RColorBrewer)


## get population datasets from
## default population:  https://www.nature.com/articles/s41467-020-15788-7
##updated population: https://zenodo.org/records/3756179


## get data from MSD Live
#McManamay, R., Vernon, C., Thurber, T., Gao, J., & O'Neill, B. (2024). 
## Data for "Divergent urban land trajectories under alternative population projections within the shared socioeconomic pathways" (Version v1) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2318472



fips <- raster("[your file path]/UA_county_FID.tif")



## default population
## read path for default population rasters
pop_path1 <- "[your file path]/Population_rasters/"
pname <- paste(pop_path1, "Gao_ssp5_2100_CONUS.tif", sep="")
s1 <- raster(pname)
s1 <- projectRaster(s1, crs="+proj=longlat +datum=WGS84 +no_defs")
#s1 <- extractByMask(s1, fips, spatial=TRUE)
#s1_area <- s1*s_area

##  Updated population
pop_path2 <- "[your file path]/zoraghein-oneill_population_gravity_national-ssp-maps/"
pname2 <- paste(pop_path2, "National_1km_SSP5_Total_2100.tif", sep="")
s2 <- raster(pname2)
s2 <- projectRaster(s2, crs="+proj=longlat +datum=WGS84 +no_defs")
#s2 <- extractByMask(s2, fips, spatial=TRUE)
#s2_area <- s2*s_area


#example for SSp5
#population delta
pop_delta_ssp5 <- s2 - s1


writeRaster(pop_delta_ssp5, file="[your file path]/Population_delta_SSP5_2100.tif", overwrite=TRUE)




#f0f9e8
#ccebc5
#a8ddb5
#7bccc4
#4eb3d3
#2b8cbe
#08589e
pal <- colorRampPalette(c("#f0f9e8","#ccebc5", "#a8ddb5", "#7bccc4","#4eb3d3", "#2b8cbe", "#08589e" ))
cuts=c(0, 2.5, 250, 500,50000,80000) #set breaks

########################################################################################################
########################################################################################################
########################################################################################################


### New Analysis: Create plots of urban fraction maps for original and updated population sectarians

############## SSP2 ##############


## Select US county raster

fips <- raster("UA_county_FID.tif", sep="")
plot(fips)

##  Select original and updated data


plot(s1, breaks=cuts, col = pal(7)) 

# Increase the size of the X and Y labels, and the plot title
par(cex.axis = 1, cex.lab = 1)

plot(log(s2+1), xlim=c(-124.849,-66.88231), ylim=c(24,50.5))



Popdelta_pal <- colorRampPalette(c("#C6030C", "#ff0f32", "#ff546c", "#ff99a7", "#ffdee1","#d3d3d3","#89ddff", "#6eb3f3", "#5389e7", "#375eda", "#1c34ce", "#010ac2"))
#pop_delta cuts  
cuts_delta <- c(-17000, -10000,-500, -250, -100, 0, 100, 500, 1000, 5000,50000,150000)

plot(pop_delta, breaks=cuts_delta, col=Popdelta_pal(12),xlim=c(-124.849,-66.88231), ylim=c(24,50.5))




########################################################################################################
########################################################################################################


############## SSP3 ##############


plot(log(s1+1), xlim=c(-124.849,-66.88231), ylim=c(24,50.5))

plot(log(s2+1), xlim=c(-124.849,-66.88231), ylim=c(24,50.5))


Popdelta_pal <- colorRampPalette(c("#C6030C", "#ff0f32", "#ff546c", "#ff99a7", "#ffdee1","#d3d3d3","#89ddff", "#6eb3f3", "#5389e7", "#375eda", "#1c34ce", "#010ac2"))
#pop_delta cuts  
cuts_delta <- c(-17000, -10000,-500, -250, -100, 0, 100, 500, 1000, 5000,50000,150000)

plot(pop_delta_ssp3, breaks=cuts_delta, col=Popdelta_pal(12),xlim=c(-124.849,-66.88231), ylim=c(24,50.5))


pop_delta_ssp3

########################################################################################################
########################################################################################################



############## SSP5 ##############


plot(log(s1+1), xlim=c(-124.849,-66.88231), ylim=c(24,50.5))

plot(log(s2+1), xlim=c(-124.849,-66.88231), ylim=c(24,50.5))


Popdelta_pal <- colorRampPalette(c("#C6030C", "#ff0f32", "#ff546c", "#ff99a7", "#ffdee1","#d3d3d3","#89ddff", "#6eb3f3", "#5389e7", "#375eda", "#1c34ce", "#010ac2"))
#pop_delta cuts  
cuts_delta <- c(-17000, -10000,-500, -250, -100, 0, 100, 500, 1000, 5000,50000,150000)

plot(pop_delta_ssp5, breaks=cuts_delta, col=Popdelta_pal(12),xlim=c(-124.849,-66.88231), ylim=c(24,50.5))






########################################################################################################
########################################################################################################
########################################################################################################

