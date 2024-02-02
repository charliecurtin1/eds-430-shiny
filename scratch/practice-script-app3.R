# load packages -----
library(tidyverse)
library(leaflet)

# read in data -----
lake_data <- read_csv(here::here("shinydashboard", "data", "lake_data_processed.csv"))

# practice filtering -----
filtered_lakes <- lake_data %>% 
  filter(Elevation >= 8 & Elevation <= 20) %>% 
  filter(AvgDepth >= 2 & AvgDepth <= 3) %>% 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

# build leaflet map -----
leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  setView(lng = -152.05, lat = 70.25, zoom = 6) %>% 
  addMiniMap(toggleDisplay = TRUE, minimized = FALSE) %>% 
  addMarkers(data = filtered_lakes,
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude,
             popup = paste0(
               "Site Name: ", filtered_lakes$Site, "<br>",
               "Elevation: ", filtered_lakes$Elevation, " meters (above sea level)", "<br>",
               "Avg Depth: ", filtered_lakes$AvgDepth, " meters", "<br>",
               # unicode for degrees symbol
               "Avg Lake Bed Temperature: ", filtered_lakes$AvgTemp, "\u00B0C"
             ))

# 
