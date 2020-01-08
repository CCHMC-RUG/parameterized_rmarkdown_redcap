



# The `GSODR` package contains historical weather data.  
# The code below downloads weather data recorded at CVG from 1980 to 2019.

#Run line below if you do not have the GSODR package installed
#install.packages("GSODR")

library(tidyverse)

cincy_stations <- GSODR::nearest_stations(LAT = 39.10312, LON = -84.51202, distance = 20) # WEATHER STATIONS
d_cincy <- GSODR::get_GSOD(years = 1980:2019, station = "724210-93814") # GET WEATHER DATA

cincy_clean <- d_cincy %>% 
  filter(STNID == "724210-93814") %>% ### CVG WEATHER 
  select(-c(NAME:END, contains("ATTRIBUTES"))) %>% 
  mutate(temp_f = TEMP * 1.8 + 32,
         max_temp_f = MAX * 1.8 + 32,
         min_temp_f = MIN * 1.8 +32)

write_rds(cincy_clean, "cincy_weather.rds")

