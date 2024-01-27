# user interface -----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel -----
  tabPanel(title = "About this page",
           
           # intro text fluidRow -----
           fluidRow(
             
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
             
           ), # END intro text fluidRow
           
           hr(),
           
           includeMarkdown("text/footer.md")
           
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel
  tabPanel(title = "Explore the data",
           
           # tabsetPanel to contain tabs for data viz -----
           tabsetPanel(
             
             # trout tabPanel -----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout -----
                      sidebarLayout(
                        
                        # trout sidebarPanel -----
                        sidebarPanel(
                          
                          # channel type pickerInput -----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("cascade", "pool"),
                                      options = pickerOptions(actionsBox = TRUE),
                                      multiple = TRUE),
                          
                          # section checkboxGroupButtons -----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = c("clear cut forest", "old growth forest"),
                                               selected = c("clear cut forest", "old growth forest"),
                                               individual = FALSE,
                                               justified = TRUE,
                                               size = "sm",
                                               checkIcon = list(yes = icon("check"),
                                                                no = icon("xmark")))
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel
                        mainPanel(
                          
                          # trout scatterplot output -----
                          plotOutput(outputId = "trout_scatterplot_output") %>% 
                            
                            # add a loading bar for plot output
                            withSpinner(color = "magenta", type = 4)
                          
                        ) # END trout mainPanel
                        
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tabPanel -----
             tabPanel(title = "Penguins",
                      
                      # penguins sidebarLayout -----
                      sidebarLayout(
                        
                        # penguins sidebarPanel
                        sidebarPanel(
                          
                          # island pickerInput -----
                          pickerInput(inputId = "island_input",
                                      label = "Select island(s):",
                                      choices = unique(penguins$island),
                                      selected = unique(penguins$island),
                                      options = pickerOptions(actionsBox = TRUE),
                                      multiple = TRUE),
                          
                          # bin number slider -----
                          sliderInput(inputId = "bin_input",
                                      label = "Select number of bins:",
                                      min = 1,
                                      max = 40,
                                      value = 25)
                          
                          
                        ), # END penguins sidebarPanel
                        
                        # penguins mainPanel
                        mainPanel(
                          
                          # histogram output -----
                          plotOutput(outputId = "penguins_histogram_output") %>% 
                            
                            # add a loading bar for plot output
                            withSpinner(color = "magenta", type = 4, size = 2)
                          
                        ) # END penguins mainPanel
                        
                      ) # END penguins sidebarLayout
                      
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
  
  
  
  
  
  
) # END navbarPage
