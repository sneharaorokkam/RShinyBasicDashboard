#Install Packages
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)

#Dashboard Page
dashboardPage(
  skin = "purple-light",
  dashboardHeader(title = "Data Science and AI Salary Analytics",
                  titleWidth = 550,
                  tags$li(class="dropdown", tags$a(href="https://ai-jobs.net/salaries/download/", icon("github"), "Data Source", target="_blank"))),
  dashboardSidebar(
    #Side bar Menu
    sidebarMenu(
      id = "sidebar",
      #First Menu item
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon=icon("chart-line")),
      menuItem(text = "Dashboard", tabName = "dshbd", icon=icon("calendar"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "data", 
              tabBox(id="t1", width=12,
                     tabPanel("About", icon = icon("address-card"),
                              fluidRow(
                                column(width = 7, tags$img(src="AI.jpg", width =600 , height = 300),
                                       tags$br()) , 
                                column(width = 5, 
                                       tags$br() ,
                                       tags$p("The data contains information about the salary, job title, experience level, employment type, remote ratio, company location, company size and residence of the employee for a specific year. The salary is in a specific currency and also provided in USD, calculated using the BIS data. The experience level and employment type are classified into different categories, and the remote ratio represents the percentage of work done remotely. The company size is also classified into different categories based on the number of employees.")
                                )
                              )
                     ),
                     tabPanel("Data", dataTableOutput("dataT"), icon = icon("table")), 
                     tabPanel("Structure", verbatimTextOutput("structure"), icon=icon("uncharted")),
                     tabPanel("Summary Stats", verbatimTextOutput("summary"), icon=icon("chart-pie"))
                     )
              ),
      
      #Tab Item -Landing Page
      tabItem(tabName = "viz",
              tabBox(id="t2", width=15,
                     tabPanel("Distribution", value="distro",plotlyOutput("histplot")),
                     tabPanel("Donut", value="donut",plotlyOutput("donutplot")),
                     tabPanel("Pie", value="pie", plotlyOutput("pie")),
                     tabPanel("Barplot1", value="bar", plotlyOutput("barplot1")),
                     tabPanel("Barplot2", value="bar", plotlyOutput("barplot2")),
                     )
              ),
      tabItem(tabName = "dshbd",
              tabBox(id="t3", width=15,
                     tabPanel("Dashboard", icon = icon("calendar"),
                              fluidRow(
                                column(12, 
                                       plotlyOutput("histplot2"))
                              ),
                              fluidRow(
                                column(7, 
                                       plotlyOutput("donutplot2")),
                                column(5, 
                                       plotlyOutput("pie2"))
                        ),
                        fluidRow(
                          column(7, 
                                 plotlyOutput("barplot3")),
                          column(5, 
                                 plotlyOutput("barplot4"))
                        )
                        
                     )
              )
      )
              )
      )
)
    
  
