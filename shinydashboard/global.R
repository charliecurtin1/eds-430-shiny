# load packages -----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)

# read in data -----
# relative to app files in global.R, will fail but leave it as is
lake_data <- read_csv("data/lake_data_processed.csv")

