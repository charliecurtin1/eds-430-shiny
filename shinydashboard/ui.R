# dashboard header -----------------
header <- dashboardHeader(
  # title -----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
)

# dashboard sidebar -----------------
sidebar <- dashboardSidebar(
  # sidebar -----
  sidebarMenu(
    # menuItem
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
  ) # END sidebarMenu
)

# dashboard body -----------------
body <- dashboardBody(
  
  # tabItems -----
  tabItems(
    
    # welcome tabItem -----
    tabItem(tabName = "welcome",
            
            # left-hand column ------
            column(width = 6,
                   
                   # background info box -----
                   box(width = NULL,
                       
                       "background info here"
                       
                   ) # END background box -----
                   
            ), # END column ------
            
            # right-hand column -----
            column(width = 6,
                   
                   # first fluidRow -----
                   fluidRow(
                     
                     # citation box -----
                     box(width = NULL,
                         
                         "citation here"
                         
                     ) # END citation box -----
                     
                   ), # END first fluidRow -----
                   
                   # second fluidRow -----
                   fluidRow(
                     
                     # disclaimer box -----
                     box(width = NULL,
                         
                         "disclaimer here"
                         
                     ) # END disclaimer box -----
                     
                   ) # END second fluidRow -----
                   
            ) # END column -----
            
    ), # END welcome tabItem -----
    
    # dashboard tabItem -----
    tabItem(tabName = "dashboard",
            
            # fluidRow -----
            fluidRow(
              
              # input box -----
              box(width = 4,
                  
                  "slider inputs here"
                  
              ), # END input box -----
              
              # map box -----
              box(width = 8,
                  
                  "leaflet map here"
                  
              ) # END map box -----
              
            ) # END fluidRow -----
            
    ) # END dashboard tabItem -----
    
  ) # END tabItems -----
)

# combine all into a dashboard page -----
dashboardPage(header, sidebar, body)