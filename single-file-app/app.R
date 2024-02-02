# load packages ----- 
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)
library(bslib)

thematic::thematic_shiny()

# user interface -----
ui <- fluidPage(
  
  # set theme -----
  theme = bs_theme(
    
    bg = "cornflowerblue", # background color
    fg = "#a36f6f", # foreground color
    primary = "#FDF7f7", # primary accent
    base_font = font_google("Honk") # font from google
      
  ),
  
  # app title -----
  tags$h1("Charlie's app"),
  
  # app subtitle -----
  h4(strong("exploring little penguins stuff")),
  
  # body mass slider input -----
  sliderInput(inputId = "body_mass_input",
              label = "Select a range of body masses (g):",
              min = 2700, max = 6300, value = c(3000, 4000)),
  
  # body mass plot output -----
  plotOutput(outputId = "body_mass_scatterplot_output"),
  
  # year input -----
  checkboxGroupInput(inputId = "year_input",
                     label = "Select year(s)",
                     choices = unique(penguins$year),
                     selected = c("2007", "2008")),
  
  # DT datable output -----
  DT::dataTableOutput(outputId = "penguins_DT_output")
  
)

# server -----
server <- function(input, output) {
  
  # render penguin scatterplot -----
  output$body_mass_scatterplot_output <- renderPlot({
    
    # filter body masses -----
    body_mass_df <- reactive({
      
      penguins %>% 
        filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2]))
      
    })
    
    # plot penguins scatterplot
    ggplot(na.omit(body_mass_df()),
           aes(x = flipper_length_mm, 
               y = bill_length_mm,
               color = species,
               shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", 
           y = "Bill length (mm)",
           color = "Penguin species",
           shape = "Penguin species") +
      theme_minimal() +
      theme(legend.position = c(.85, .2),
            legend.background = element_rect(color = "white"))
    
  })
  
  # filter for penguins year -----
  penguins_year_df <- reactive({
    
    penguins %>% 
      filter(year %in% c(input$year_input))
    
  })
  
  # penguins data table year checkbox -----
  output$penguins_DT_output <- DT::renderDataTable({
    
    # create datatable for the year
    DT::datatable(penguins_year_df())
  })
}

# combine ui and server into app -----
shinyApp(ui = ui, server = server)