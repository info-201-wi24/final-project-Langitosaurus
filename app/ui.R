## OVERVIEW TAB INFO

overview_tab <- tabPanel("Project Overview",
   h1("Crypto : Nasdaq"),
   p("With the rise of cryptocurrency as an investment model, it is")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Scale by Time"),
  h2("Data Selection"),
)

viz_1_main_panel <- mainPanel(
  h2("Comparative Price by Time"),
  plotlyOutput(outputId = "output_1")
)

viz_1_tab <- tabPanel("Price Plot",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h2("Scale by Time"),
  h2("Data Selection"),
)

viz_2_main_panel <- mainPanel(
  h2("Fluctuation of Price Change by Time"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_2_tab <- tabPanel("Change Plot",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Vizualization 3 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_3_tab <- tabPanel("",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("In Conclusion",
 h1("Comparability of Cryptocurrency"),
 p("some conclusions")
)



ui <- navbarPage("Example Project Title",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)