library(plotly)
library(bslib)
library(dplyr)
library(markdown)

pastel_blue <- "#ADD8E6"

# Introduction Page
introduction_tab <- tabPanel("Introduction",
                             h1("Welcome to Crypto Nasdaq Analysis", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
                             p("This dashboard provides insights into cryptocurrency trends and market analysis.", style = "color: #333; font-family: Georgia, serif;")
)

# Visualization 1 Page
viz_1_sidebar <- sidebarPanel(
  h2("Scale by Time", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
  h2("Data Selection", style = "color: #333; font-family: Georgia, serif; text-align: center;")
)

viz_1_main_panel <- mainPanel(
  h2("Comparative Price by Time", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
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
  h2("Scale by Time", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
  h2("Data Selection", style = "color: #333; font-family: Georgia, serif; text-align: center;")
)

viz_2_main_panel <- mainPanel(
  h2("Fluctuation of Price Change by Time", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
  plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_2_tab <- tabPanel("Change Plot",
                      sidebarLayout(
                        viz_2_sidebar,
                        viz_2_main_panel
                      )
)

# Visualization 3 Page
viz_3_sidebar <- sidebarPanel(
  h2("Options for graph", style = "color: #333; font-family: Georgia, serif; text-align: center;")
  # TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Visualization 3 Title", style = "color: #333; font-family: Georgia, serif; text-align: center;")
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_3_tab <- tabPanel("",
                      sidebarLayout(
                        viz_3_sidebar,
                        viz_3_main_panel
                      )
)

# Conclusion Page
conclusion_tab <- tabPanel("Conclusion",
                           h1("Summary and Conclusion", style = "color: #333; font-family: Georgia, serif; text-align: center;"),
                           p("In this analysis, we explored the comparability of cryptocurrencies and their trends.", style = "color: #333; font-family: Georgia, serif;")
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
