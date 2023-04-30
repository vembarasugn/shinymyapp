shinyServer <- function(input, output) {

  bclstore <- read.csv("data_files/bclstore-data.csv",stringsAsFactors = FALSE)

  output$aboutImage <- renderImage({

    list(src = "www/img/about.png",
         width = "100%",
         height = 320)

  }, deleteFile = F)

  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bclstore$Country)),
                selected = "CANADA")
  })

  #filtered data from the left panel.
  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }

    bclstore %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })

  #Render plot.
  output$applot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram(col = 'blue')
  })

  output$results <- DT::renderDataTable({
    filtered()
  })

  #Download selected dataset.
  output$downloadData <- downloadHandler(
    filename = function() {
      paste( input$countryInput,".csv", sep = "")
    },
    content = function(file){
       write.csv(filtered(),file,row.names = FALSE)
     }
   )
}


