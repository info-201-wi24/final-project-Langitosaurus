library(plotly)
library(bslib)
library(dplyr)
library(markdown)

pastel_blue <- "#ADD8E6"

my_theme <- bs_theme(bg = "#ADD8E6", preset = "lumen", 
                fg = "#000")
box_theme <- bs_theme(bg = "#FFF", preset = "lumen", 
                     fg = "#000")
# Introduction Page
introduction_tab <- tabPanel(
  "Introduction",
  h1("Welcome to Crypto Nasdaq Analysis", style = "color: #333; font-family: Georgia, serif; text-align: center; font-weight: bold;"),
  br(),
  fluidRow(
    column(2),
    column(8,
           style="bg-color: #FFF",
           p("Our project aims to explore the conjunction between cryptocurrency predictions and traditional stock market movements. By comparing the cryptocurrency prediction AI training dataset with the NASDAQ Composite prices dataset, we seek to uncover insights into the financial landscape, the influence of AI and ML on market predictions, and the varying dynamics between traditional and digital financial markets.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;"),
           br(),
           p("In addition to the comparison of existing data and innovative adaptation, we also incorporate recent innovations in technology to obtain predictive data. This includes using AI-generated datasets to predict future cryptocurrency market movements beyond the limitations of historical records. By leveraging machine learning and AI-generated data, we aim to provide further understanding of digital financial markets and enhance predictive capabilities.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;"),
           #br(),
           #p("Ethical considerations include transparency, bias, and market manipulation associated with the use of AI and machine learning in financial markets. Privacy concerns may also arise from access to historical financial data, raising questions about individual trading activities and market behaviors.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;"),
           br(),
           p("Our project emphasizes the importance of understanding the relationship and behavior between new digital markets (cryptocurrency) and traditional financial institutions (the stock market). By comparing these datasets, we hope to shed light on the evolving narrative of finance, providing insights into investment strategies and market predictions.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;"),
    ),
    column(2)
  ),
  br(),
  fluidRow(
    column(6,
           h2("Dataset", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
           br(),
           fluidRow(
             column(2),
             column(8,
                    p("Dataset 1: Cryptocurrency prediction AI training dataset Cryptocurrency Prediction Artificial Intelligence", style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                    p("Dataset 2: Nasdaq Composite prices dataset Nasdaq Composite Historical Prices.", style = "color: #333; font-family: Georgia, serif; font-size: 20px;")
                    ),
             column(2)
           )
    ),
    column(6,
           h2("Major Questions", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
           br(),
           fluidRow(
             column(1),
             column(10,
                    p("1. How do cryptocurrency trends compare to movements in the Nasdaq Composite index?",style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                    p("2. What insights can be gained from comparing AI predictions on cryptocurrency trends with movements of the Nasdaq Composite index?",style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                    p("3. What are the implications of these comparisons for investment strategies and market predictions?",style = "color: #333; font-family: Georgia, serif; font-size: 20px;")
             ),
             column(1)
           )
      ),
    ),
  br(),
  )

# Visualization 1 Page
viz_1_sidebar <- sidebarPanel(
  theme= box_theme,
  h2("Filters", style = "color: #333; font-family: Georgia, serif; text-align: center; font-weight: bold; font-size: 30px;"),
  br(),
  dateRangeInput(inputId = "date_range_1",
                 label = h4("Date Range", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
                 format = "mm-dd-yyyy",
                 start = "2018-01-02",
                 end = "2024-02-09",
                 min = "2018-01-02",
                 max = "2024-02-09",
                 startview = "year",
                 separator = "to"
  ),
  #call input$dates_range (vector with two Date objects to measure the max and min date range)
  checkboxGroupInput(inputId = "check_1",
                     label = h4("Statistical Lines", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
                     choices = list("Average Line" = "avg","Median Line" = "med", "Range Line" = "range")
  #call input$check (vector with string for checking line types)
  )
)

viz_1_main_panel <- mainPanel(
  h2("Comparative Price by Time", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
  br(),
  plotlyOutput(outputId = "output_1")
)

viz_1_tab <- tabPanel("Price Plot",
                      sidebarLayout(
                        viz_1_sidebar,
                        viz_1_main_panel
                      )
)

# Visualization 2 Page
viz_2_sidebar <- sidebarPanel(
  h2("Filters", style = "color: #333; font-family: Georgia, serif; text-align: center; font-weight: bold; font-size: 30px;"),
  br(),
  dateRangeInput(inputId = "date_range_2",
                 label = h4("Date Range", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
                 format = "mm-dd-yyyy",
                 start = "2018-01-02",
                 end = "2024-02-09",
                 min = "2018-01-02",
                 max = "2024-02-09",
                 startview = "year",
                 separator = "to"
  ),
  checkboxGroupInput(inputId = "check_2",
                     label = h4("Statistical Lines", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
                     choices = list("Average Line" = "avg","Median Line" = "med", "Range Line" = "range")
  #call input$check (vector with string for checking line types)
  )
)

viz_2_main_panel <- mainPanel(
  h2("Fluctuation of Price Change by Time", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
  br(),
  plotlyOutput(outputId = "output_2")
)

viz_2_tab <- tabPanel("Change Plot",
                      sidebarLayout(
                        viz_2_sidebar,
                        viz_2_main_panel
                      )
)

# Visualization 3 Page
viz_3_sidebar <- sidebarPanel(
  h2("Filters", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
  br(),
  dateRangeInput(inputId = "date_range_3",
                 label = h4("Date Range", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
                 format = "mm-dd-yyyy",
                 start = "2018-01-02",
                 end = "2024-02-09",
                 min = "2018-01-02",
                 max = "2024-02-09",
                 startview = "year",
                 separator = "to"
  ),
  #call input$dates_range (vector with two Date objects to measure the max and min date range)
  sliderInput(inputId = "slider_1",
              label = h3("Range of Nasdaq Price"), min = 0, 
              max = 16, value = c(0, 16), step = 0.5),
  sliderInput(inputId = "slider_2",
              label = h3("Range of Crypto Price"), min = 0, 
              max = 3, value = c(0, 3), step = 0.1)
#call input$slider (vector with min and maximum value bounds)
)

viz_3_main_panel <- mainPanel(
  h2("Correlation between Nasdaq and Cryptocurrency Prices", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
  br(),
  plotlyOutput(outputId = "output_3")
)

viz_3_tab <- tabPanel("Corellation Plot",
                      sidebarLayout(
                        viz_3_sidebar,
                        viz_3_main_panel
                      )
)

# Conclusion Page
conclusion_tab <- tabPanel("Conclusion",
                           h1("Summary and Conclusion", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
                           br(),
                           fluidRow(
                             column(2),
                             column(8,
                                    p("To summarize, we explored the comparability of direct prices, the comparability of the price changes, and the correlation between prices regarding cryptocurrencies and NASDAQ (2018-2024). From the three comparisons, several different conclusions can be drawn to answer our main questions:", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;"),
                                    br(),
                                    p("1.	The cryptocurrency trade does not compare well with the Nasdaq trends. Correlation comparison also shows that the relation between cryptocurrency and Nasdaq price has a slight positive correlation in general (there is a slight incline such that as the Nasdaq Prices go higher, the cryptocurrency prices also increase) Though there is some degree of a positive relationship between the two, their general trend of cluster pairs accumulates around the 0.5 price line of cryptocurrency price. This trend justifies our conclusion that the general trend of cryptocurrency prices stays stagnant despite an increase/decrease in Nasdaq prices.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;"),
                                    br(),
                                    p("2.	In regards to comparing the price changes between AI prediction of cryptocurrency prices and Nasdaq prices, it can be concluded that the Nasdaq prices are more stable in their price changes compared to cryptocurrency changes. (Crypto changes range up to 86% in a day, while Nasdaq at maximum changes up to around 12%) As such, cryptocurrency does not work on the same principles as the Nasdaq market. This conclusion is not necessarily a perfect generalization of the complete market, as it is a comparison between composite price data and a singular cryptocurrency.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;"),
                                    br(),
                                    p("3.	As such, it can be concluded that the usage of cryptocurrency predicting AI to predict market (Nasdaq) prices requires some form of changes in its principles to accommodate for the lack of correlation between prices and stability in price changes.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;")
),
                             column(2)
                           )
                           
)

# UI
ui <- navbarPage("Crypto Nasdaq Analysis",
                 introduction_tab,
                 viz_1_tab,
                 viz_2_tab,
                 viz_3_tab,
                 conclusion_tab,
                 theme = my_theme
)
