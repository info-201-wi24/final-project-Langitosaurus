library(ggplot2)
library(plotly)
library(dplyr)

crypto_data <- read.csv("https://raw.githubusercontent.com/info-201-wi24/final-project-Langitosaurus/main/nasdaq_xpr_comparison.csv")

server <- function(input, output) {
  
  # Output 1: Comparative Price by Time
  output$output_1 <- renderPlotly({
    plot_ly(data = crypto_data, x = ~Date, y = ~nasdaq_Price, type = 'scatter', mode = 'lines', name = 'Nasdaq') %>%
      add_trace(y = ~Crypto_Price, name = 'Cryptocurrency') %>%
      layout(title = 'Comparative Price by Time',
             xaxis = list(title = 'Date'),
             yaxis = list(title = 'Price'))
  })
  
  # Output 2: Fluctuation of Price Change by Time
  output$output_2 <- renderPlotly({
    crypto_data <- crypto_data %>%
      mutate(Nasdaq_Change = (nasdaq_Price / lag(Nasdaq_Price) - 1) * 100,
             Crypto_Change = (Crypto_Price / lag(Crypto_Price) - 1) * 100) %>%
      na.omit()  # Remove NA values caused by lag function
    
    plot_ly(data = crypto_data, x = ~Date) %>%
      add_trace(y = ~Nasdaq_Change, type = 'scatter', mode = 'lines', name = 'Nasdaq % Change') %>%
      add_trace(y = ~Crypto_Change, type = 'scatter', mode = 'lines', name = 'Cryptocurrency % Change') %>%
      layout(title = 'Fluctuation of Price Change by Time',
             xaxis = list(title = 'Date'),
             yaxis = list(title = 'Percentage Change (%)'))
  })
  
  # Output 3: Correlation Plot
  output$output_3 <- renderPlotly({
    plot_ly(data = crypto_data, x = ~Nasdaq_Price, y = ~Crypto_Price, type = 'scatter', mode = 'markers') %>%
      layout(title = 'Correlation between Nasdaq and Cryptocurrency Prices',
             xaxis = list(title = 'Nasdaq Price'),
             yaxis = list(title = 'Cryptocurrency Price'))
  })
}
