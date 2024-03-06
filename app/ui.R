library(plotly)
library(bslib)
library(dplyr)
library(markdown)

pastel_blue <- "#ADD8E6"

# Introduction Page
introduction_tab <- tabPanel("Introduction",
                             h1("Welcome to Crypto Nasdaq Analysis", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
                             br(),
                             br(),
                             p("Dataset 1: Cryptocurrency prediction AI training dataset Cryptocurrency Prediction Artificial Intelligence", style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             p("Dataset 2: Nasdaq Composite prices dataset Nasdaq Composite Historical Prices.", style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             br(),
                             p("Major Questions:", style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             br(),
                             p("1. How do cryptocurrency trends compare to movements in the Nasdaq Composite index?",style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             p("2. What insights can be gained from comparing AI predictions on cryptocurrency trends with movements of the Nasdaq Composite index?",style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             p("3. What are the implications of these comparisons for investment strategies and market predictions?",style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             br(),
                             p("Our project aims to explore the conjunction between cryptocurrency predictions and traditional stock market movements. By comparing the cryptocurrency prediction AI training dataset with the NASDAQ Composite prices dataset, we seek to uncover insights into the financial landscape, the influence of AI and ML on market predictions, and the varying dynamics between traditional and digital financial markets.", style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             br(),
                             p("In addition to the comparison of existing data and innovative adaptation, we also incorporate recent innovations in technology to obtain predictive data. This includes using AI-generated datasets to predict future cryptocurrency market movements beyond the limitations of historical records. By leveraging machine learning and AI-generated data, we aim to provide further understanding of digital financial markets and enhance predictive capabilities.", style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             br(),
                             p("Ethical considerations include transparency, bias, and market manipulation associated with the use of AI and machine learning in financial markets. Privacy concerns may also arise from access to historical financial data, raising questions about individual trading activities and market behaviors.", style = "color: #333; font-family: Georgia, serif; font-size: 20px;"),
                             br(),
                             p("Our project emphasizes the importance of understanding the relationship and behavior between new digital markets (cryptocurrency) and traditional financial institutions (the stock market). By comparing these datasets, we hope to shed light on the evolving narrative of finance, providing insights into investment strategies and market predictions.", style = "color: #333; font-family: Georgia, serif; font-size: 20px;")
)

# Visualization 1 Page
viz_1_sidebar <- sidebarPanel(
  h2("Scale by Time", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 18px; font-weight: bold;"),
  h2("Data Selection", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 18px; font-weight: bold;")
)

viz_1_main_panel <- mainPanel(
  h2("Comparative Price by Time", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
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
  h2("Scale by Time", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
  h2("Data Selection", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 18px; font-weight: bold;")
)

viz_2_main_panel <- mainPanel(
  h2("Fluctuation of Price Change by Time", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
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
  h2("Options for graph", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 18px; font-weight: bold;")
)

viz_3_main_panel <- mainPanel(
  h2("Visualization 3 Title", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
  plotlyOutput(outputId = "output_3")
)

viz_3_tab <- tabPanel("Visualization 3",
                      sidebarLayout(
                        viz_3_sidebar,
                        viz_3_main_panel
                      )
)

# Conclusion Page
conclusion_tab <- tabPanel("Conclusion",
                           h1("Summary and Conclusion", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 30px; font-weight: bold;"),
                           p("In this analysis, we explored the comparability of cryptocurrencies and their trends.", style = "color: #333; font-family: Georgia, serif; text-align: center; font-size: 20px;")
)

# UI
ui <- navbarPage("Crypto Nasdaq Analysis",
                 introduction_tab,
                 viz_1_tab,
                 viz_2_tab,
                 viz_3_tab,
                 conclusion_tab,
                 tags$body(style = paste0("background-color: ", pastel_blue, ";"))
)
