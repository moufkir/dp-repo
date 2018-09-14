#
# Shiny UI part , web application for managing different linear regressing model and displying its properties
#

if(require(shiny)==FALSE)(install.packages("shiny")); library(shiny)
if(require(shinyjs)==FALSE)(install.packages("shinyjs")); library(shinyjs)
if(require(plotly)==FALSE)(install.packages("plotly")); library(plotly)
if(require(rmarkdown)==FALSE)(install.packages("rmarkdown")); library(rmarkdown)



# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Data Set Explorer"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

      uiOutput('dataSetList'),
      uiOutput('featuresList_1'),
      uiOutput('featuresList_2'),
      uiOutput('outPlot_btn')



    ),


    mainPanel(
      tabsetPanel(id = "tabs",

                  tabPanel("Plot", value = "Plot",

                           h1('Plot Details'),
                           #textOutput("message"),
                           plotlyOutput('scatPlot')
                  ),

                  tabPanel("Help", value = "help",
                           includeMarkdown("help.md")
                  )

    )
  )
))
)
