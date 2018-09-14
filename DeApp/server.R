#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)



# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  data("mtcars")
  data("iris")
  data("ToothGrowth")
  data("USArrests")
  data_sets <- list('mtcars'=list("dataset"=mtcars, "label" ="mpg", "wiki_link"="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html"),
                    'iris'=list("dataset"=iris, "label" ="Species", "wiki_link"="https://en.wikipedia.org/wiki/Iris_flower_data_set"),
                    'ToothGrowth'=list("dataset"=ToothGrowth, "label" ="", "wiki_link"=""),
                    'USArrests'=list("dataset"=USArrests, "label" ="", "wiki_link"="")

                    )


  #--------------------------
  # Rendering UI
  #--------------------------
  #generate the list of data Sets
  output$dataSetList = renderUI({
    selectInput('dataSetList', 'Select Data', names(data_sets), selected=names(data_sets)[1])

  })
  #generate the list of features related to the selected dataset

  features <- reactive({

        if (!is.null(input$dataSetList)){

        #data(output$dataSetList)
      return ((names(data_sets[[input$dataSetList]][["dataset"]])))
    }

  })


  buttonDisplay <- reactive({

    if (!is.null(input$features_1) & !is.null(input$features_2) & input$features_1 != input$features_2){
      return(TRUE)
    } else{
      return(FALSE)
    }

  })



  output$featuresList_1 <- renderUI({
    if (!is.null(features())){
      feature_list <- features()
    }else{
      feature_list <- c('')
    }

    selectInput('features_1', 'Select Dependent Feature',feature_list, selected = feature_list[1])
  })

  output$featuresList_2 <- renderUI({
    if (!is.null(features())){
      feature_list <- features()
    }else{
      feature_list <- c('')
    }

    selectInput('features_2', 'Select Independent Feature',feature_list)
  })


  output$outPlot_btn <-renderUI({
    if(buttonDisplay() ==T){
      actionButton("plot_btn", "Plot", style='font-size:80%', width="60%", align="center")
    }

  })

  output$message <- renderText(input$dataSetList)



  observeEvent(input$plot_btn, {
    ds <- data_sets[[input$dataSetList]][["dataset"]]
    print(class(input$features_1))


    output$scatPlot <- renderPlotly({

      s <- input$cluster_table_rows_selected

      if (input$features_1 %in% names(ds)) {
        f <- list(
          family = "Arial,
          size = 18,
          color = "#7f7f7f"
        )
        x <- list(
          title = input$features_1,
          titlefont = f
        )
        y <- list(
          title = input$features_2,
          titlefont = f
        )



        p <- ds %>% plot_ly(x=~ds[,input$features_1],y=~ds[,input$features_2]) %>%
          add_trace(x=~ds[,input$features_1],y=~ds[,input$features_2], showlegend=TRUE,
                    type='scatter', mode='markers'
                    ,marker=list(size=8))
        p <- layout(p,title="Plotting data",xaxis = x, yaxis = y)
        p


      }
    })

    })


})
