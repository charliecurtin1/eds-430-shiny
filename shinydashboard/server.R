server <- function(input, output) {
  
  # filter lake data -----
  filtered_lakes_df <- reactive({
    
    lake_data %>% 
      filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2]) %>% 
      filter(AvgDepth >= input$depth_slider_input[1] & AvgDepth <= input$depth_slider_input[2]) %>% 
      filter(AvgTemp >= input$temp_slider_input[1] & AvgTemp <= input$temp_slider_input[2])
    
  })
  
  # building map -----
  output$lake_map_output <- renderLeaflet({
    
    # build leaflet map
    leaflet() %>% 
      addProviderTiles(providers$Esri.WorldImagery) %>% 
      setView(lng = -152.05, lat = 70.25, zoom = 6) %>% 
      addMiniMap(toggleDisplay = TRUE, minimized = FALSE) %>% 
      addMarkers(data = filtered_lakes_df(),
                 lng = filtered_lakes_df()$Longitude,
                 lat = filtered_lakes_df()$Latitude,
                 popup = paste0(
                   "Site Name: ", filtered_lakes_df()$Site, "<br>",
                   "Elevation: ", filtered_lakes_df()$Elevation, " meters (above sea level)", 
                   "<br>",
                   "Avg Depth: ", filtered_lakes_df()$AvgDepth, " meters", "<br>",
                   # unicode for degrees symbol
                   "Avg Lake Bed Temperature: ", filtered_lakes_df()$AvgTemp, "\u00B0C"
                 ))
    
  })
  
  
  
  
}