library(raster)
#library(maptools)
#library(rasterVis)
#library(maps)
library(rgdal)
library(dplyr)
library(bnspatial)


#retrieve default and updated SELECT runs (default=original population, updated = state-specific population).
# files located at: 
# McManamay, R., Thurber, T., Vernon, C. R., O'Neill, B. C., & Gao, J. (2022). IM3 SELECT Urbanization Data (v1.0.0) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/1887521 
# download files locally

#other supporting files located at:
#McManamay, R., Vernon, C., Thurber, T., Gao, J., & O'Neill, B. (2024). 
## Data for "Divergent urban land trajectories under alternative population projections within the shared socioeconomic pathways" (Version v1) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2318472



## other files provided on github repo https://github.com/IMMM-SFA/mcmanamay_etal_2024_erl



sdl <- read.csv(file="[your file path]/select_data_list5.csv")
citycounty <- read.csv(file="[your file path]/county_ua_fips.csv")

fips <- raster("[your file path]/UA_county_FID.tif")

s_area <- area(fips)


## you will need to re-run for every SSP scenario
##currently showing SSP3

for (row in 1:nrow(sdl)) {
  select_orig <- sdl[row, "orig"]
  select_upd  <- sdl[row, "update"]
  
  ##  Select original data
  spath1 <- "[your file path]/default_population/downscaled/SSP3/"
  sname <- paste(spath1, select_orig, sep="")
  s1 <- raster(sname)
  s1 <- extractByMask(s1, fips, spatial=TRUE)
  s1_area <- s1*s_area
  
  ##  Select updated data
  spath2 <- "[your file path]/updated_population/downscaled/SSP3/"
  sname2 <- paste(spath2, select_upd, sep="")
  s2 <- raster(sname2)
  s2 <- extractByMask(s2, fips, spatial=TRUE)
  s2_area <- s2*s_area
  
  ## urban 
  uf_delta <- s2 - s1
  uf_delta_area <- uf_delta*s_area
  
  u_stack <- stack(fips, s1_area, s2_area, uf_delta_area)
  u_stack <- as.data.frame(u_stack)
  colnames(u_stack) <- c("FID","s1_area", "s2_area", "uf_delta_area")
  
  
  s1_new <- merge(u_stack, citycounty, by="FID", all.x=TRUE)
  
  s1_new[is.na(s1_new)] <- 0
  
  urb_s1_calc <- s1_new %>%
    group_by(FIPS_2, GEOID2) %>%
    summarize(orig_area=sum(s1_area), update_area=sum(s2_area), uf_delta_area=sum(uf_delta_area))	
  
  urb_s1_calc$scenario <- select_orig
  
  # write out summary file
  datpath <- "[your file path]/output/summary/"
  sumdat <- paste0(datpath, select_orig,".csv")
  
  write.csv(urb_s1_calc, file=sumdat)
  
}

#create list of all files in output file
files <- list.files(path="[your file path]/output/summary/", pattern=".csv")
setwd("[your file path]/output/summary/")
my_data <- lapply(files, read.csv)
unlink("[your file path]/output/summary/")
all_uf_delta_area <- do.call(rbind, my_data)

write.csv(all_uf_delta_area, file="[your file path]/Urban_Land_delta_UA_County.csv")