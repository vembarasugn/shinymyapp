

shinyUI <- fluidPage(theme = "styles.css",
                     div(style = "padding: 2px 0px; width:'100%'",
                         titlePanel(
                           title = "",
                           windowTitle = "My shiny App"
                         )

                     ),


    navbarPage(
          #Title of the application.
           title = div(span(" DATA SOURCE ",
                        style = "position:relative;top:50%,transform: translateY(-50%);")),

     # About Page Informations .
           tabPanel(

                    "ABOUT",

               tabsetPanel(

                   id = "about",

               # General info.
                   tabPanel(

                     "Preface",
                     imageOutput("aboutImage"),
                     tags$h2("OVERVIEW",style = "color: #EDC6B1"),
                     tags$h3(HTML("This web application will be useful for an analysis of data from the databases                                      are made avaible from web sources.")),
                     tags$p(HTML("You can analyse data from Analysis page of this web application.If you navigate                                    through, it is helpful to get clear over view on working methods for performing                                    data analysis.Once you have retrieved result data from the filters applied and                                     download them from the concerned button given.You can download in a .csv                                           format data directly after you analsed.")),
                     tags$h1("BCL Database",style = "color: #EDC6B1",),
                     tags$h3(HTML("This database have the following categories.")),
                     tags$ol(
                     tags$li(HTML("Products: Beer, Spirits, Wine and Refreshment.")),
                     tags$li(HTML("Country: Canada, France and Italy.",style = "colour:blue")),
                     tags$li(HTML("Price ranges , please kindly refer database."))),
                     tags$p(HTML("For the analysis purpose, you can select multiple products or a single product                                     from the country with an appropriate selection between price ranges.")),
                     tags$h2("GitHub",style = "color: #EDC6B1"),
                     tags$em(HTML("Source code is available at <a href=\"https://github.com/kaplanas/Shiny-Lego\"                               >https://github.com/kaplanas/Shiny-Lego</a>."))
                           )
                         )
                      ),





  #Analysis thing Informations.
        tabPanel(

            "ANALYSIS",

         # Tab sets.
            tabsetPanel(
                #Nested tab set.
                id = "ANALYSIS",

                # type = "tabs",
                tabPanel(

                      "Data Analysis",

                #Side bar panel things.
                sidebarPanel(
                p("Please select atleast one of the below product or multiple products to get results."),
                checkboxGroupInput("typeInput","Product Details",
                                  choices = c("BEER" , "REFRESHMENT" , "SPIRITS" ,"WINE" ),
                                  selected = "BEER"),
                hr(),
                p("Please select any one of the country from below given options."),
                selectInput("countryInput", "Country",
                                  choices = c("CANADA", "FRANCE", "ITALY")),
                hr(),
                p("Please select price from the below given ranges."),
                sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),

                h3("Download filtered country data here"),
                #Download Data
                downloadButton("downloadData", "Download")
                       )
                    )
                ),

                #MainpanelLayout.

                mainPanel(
                #Righthand side nav bar hearder message.
                navbarPage("Graphs and Tables - You can get results for your search categories here."),
                    tabsetPanel(
                        tabPanel("Plot", plotOutput("applot")),
                          tabPanel("Table", DT::dataTableOutput("results"))
                           ),
                      )
                ) ,


  # Useful Resources Informations.
  tabPanel(

    "USEFUL RESOURCES",

    tabsetPanel(

      id = "contact",

      # General info.
      tabPanel(

        "Resources",

        tags$h3(" Documents for your references.",style = "color: #EDC6B1"),
        tags$h5(HTML("I have find myself very much helpful refering the below given links to learn how build R                     Shiny web application.It has enormous amount of informations guiding throughout this app to built.I                 am glad to recommend you all to have glance to these documents for any further learning about                      R shiny App developments.")),
        tags$h4(HTML("Please kindly find the below links:")),
        tags$h5(HTML(" Stat 545: <a href=\"https://stat545.com/index.html\">https://stat545.com/index.html</a>")),
        tags$h5(HTML(" R Documentation: <a href=\"https://www.rdocumentation.org\">https://www.rdocumentation.org                       </a>")),
        tags$h5(HTML(" R Studio Complete Guide: <a href=\"https://shiny.rstudio.com\">https://shiny.rstudio.com</a                      >")),
        tags$h5(HTML(" Posit Reference: <a href=\"https://support.posit.co/hc/en-us\">https://support.posit.co/hc                       /en-us</a>")),
        tags$h5(HTML(" Shiny App Deployment: <a href=\"https://shiny.rstudio.com/deploy\">https://shiny.rstudio.com                      /deploy/</a>")),
        tags$h3("Software Download Links:",style = "color: #EDC6B1"),
        tags$p(HTML("Please kindly navigate through the below given links steps for installation:")),
        tags$h5(HTML(" R Software Enviroment Installation: <a href=\"https://www.r-project.org/\">https://www.r                          -project.org/</a>")),
        tags$h5(HTML(" R Studio Installation Guide: <a href=\"https://cloud.r-project.org/\">https://cloud.r                             -project.org/</a>")),
        tags$p(HTML("Using the above links, you can fully understand how to install and use them in order to build                      R Shinyapps using R and R Studio in a way better.I highly recommand to you go through these                        documents before installing.It helps a lot.")),
         )
      )
   )

),

        #Footer
        div(class = "footer",
             includeHTML("html/footer.html"),
        )
)
