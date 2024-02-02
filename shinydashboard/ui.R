# dashboard header -----------------
header <- dashboardHeader()

# dashboard sidebar -----------------
sidebar <- dashboardSidebar()

# dashboard body -----------------
body <- dashboardBody()

# combine all into a dashboard page -----
dashboardPage(header, sidebar, body)