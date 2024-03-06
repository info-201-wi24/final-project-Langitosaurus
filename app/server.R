library(ggplot2)
library(plotly)
library(dplyr)

crypto_data <- read.csv("https://raw.githubusercontent.com/info-201-wi24/final-project-Langitosaurus/main/nasdaq_xpr_comparison.csv")

server <- function(input, output) {
  
  # Output 1: Comparative Price by Time
  output$output_1 <- renderPlotly({
    
    #view(as.Date(input$date_range_1[1],"%m/%d/%Y"))
    crypto_data_sorted <- crypto_data %>%
      filter(Date >= as.Date(input$date_range_1[1],"%m/%d/%Y")) %>%
      filter (Date <= as.Date(input$date_range_1[2],"%m/%d/%Y"))
    avg_nasdaq <- crypto_data_sorted %>% summarise(avg = round(mean(nasdaq_price),0)) %>% pull(avg)
    avg_xpr <- crypto_data_sorted %>% summarise(avg = round(mean(xpr_price),3)) %>% pull(avg)
    med_nasdaq <- crypto_data_sorted %>% summarise(med = round(median(nasdaq_price),0)) %>% pull(med)
    med_xpr <- crypto_data_sorted %>% summarise(med = round(median(xpr_price),0)) %>% pull(med)
    
    res_plot <- plot_ly(data = crypto_data_sorted, x = ~Date, y = ~nasdaq_price, type = 'scatter', mode = 'lines', name = 'Nasdaq') %>%
      add_trace(y = ~xpr_price, name = 'Cryptocurrency') %>%
      layout(title = 'Comparative Price by Time',
             xaxis = list(title = 'Date'),
             yaxis = list(title = 'Price in USD'))
    for(x in input$check_1) {
      if (x == "avg") {
        #view(avg_xpr)
        res_plot <- res_plot %>% add_lines(y = ~avg_xpr, name = 'Average Crypto Price') %>%
          add_lines(y = ~avg_nasdaq, name = 'Average Nasdaq Price')
      }
      if (x == "med"){
        res_plot <- res_plot %>% add_lines(y = ~med_xpr, name = 'Median Crypto Price') %>%
          add_lines(y = ~med_nasdaq, name = 'Median Nasdaq Price')
      }
    } 
    return(res_plot)
  })
  
  # Output 2: Fluctuation of Price Change by Time
  output$output_2 <- renderPlotly({
   # crypto_data <- crypto_data %>%
   #   mutate(Nasdaq_Change = (nasdaq_price / lag(nasdaq_price) - 1) * 100,
   #          Crypto_Change = (xpr_price / lag(xpr_price) - 1) * 100) %>%
   #   na.omit()  
   # Remove NA values caused by lag function\
    crypto_data_sorted <- crypto_data %>%
      filter(Date >= input$date_range_2[1]) %>%
      filter (Date <= input$date_range_2[2])
    avg_nasdaq <- crypto_data_sorted %>% summarise(avg = round(mean(nasdaq_perc, na.rm = TRUE),3)) %>% pull(avg)
    avg_xpr <- crypto_data_sorted %>% summarise(avg = round(mean(xpr_perc, na.rm = TRUE),3)) %>% pull(avg)
    med_nasdaq <- crypto_data_sorted %>% summarise(med = round(median(nasdaq_perc, na.rm = TRUE),3)) %>% pull(med)
    med_xpr <- crypto_data_sorted %>% summarise(med = round(median(xpr_perc, na.rm = TRUE),3)) %>% pull(med)
    
    res_plot <- plot_ly(data = crypto_data_sorted, x = ~Date) %>%
      add_trace(y = ~xpr_perc, type = 'scatter', mode = 'lines', name = 'Cryptocurrency % Change')%>% 
      add_trace(y = ~nasdaq_perc, type = 'scatter', mode = 'lines', name = 'Nasdaq % Change') %>%
      layout(title = 'Fluctuation of Price Change by Time',
             xaxis = list(title = 'Date'),
             yaxis = list(title = 'Percentage Change (%)'))
    for(x in input$check_2) {
      if (x == "avg") {
        res_plot <- res_plot %>% add_lines(y = ~avg_xpr, name = 'Average Crypto Price') %>%
          add_lines(y = ~avg_nasdaq, name = 'Average Nasdaq Price')
      }
      if (x == "med"){
        res_plot <- res_plot %>% add_lines(y = ~med_xpr, name = 'Median Crypto Price') %>%
          add_lines(y = ~med_nasdaq, name = 'Median Nasdaq Price')
      }
    } 
    return(res_plot)
  })
  
  # Output 3: Correlation Plot
  output$output_3 <- renderPlotly({
    crypto_data_sorted <- crypto_data %>%
      filter(Date >= input$date_range_3[1]) %>%
      filter (Date <= input$date_range_3[2]) %>%
      filter(nasdaq_price >= input$slider_1[1] * 1000) %>% 
      filter(nasdaq_price <= input$slider_1[2] * 1000) %>%
      filter(xpr_price >= input$slider_2[1]) %>%
      filter(xpr_price <= input$slider_2[2])
    
    avg_nasdaq <- crypto_data_sorted %>% summarise(avg = round(mean(nasdaq_price, na.rm = TRUE),3)) %>% pull(avg)
    avg_xpr <- crypto_data_sorted %>% summarise(avg = round(mean(xpr_price, na.rm = TRUE),3)) %>% pull(avg)
    med_nasdaq <- crypto_data_sorted %>% summarise(med = round(median(nasdaq_price, na.rm = TRUE),3)) %>% pull(med)
    med_xpr <- crypto_data_sorted %>% summarise(med = round(median(xpr_price, na.rm = TRUE),3)) %>% pull(med)
    
    res_plot <- plot_ly(data = crypto_data_sorted, x = ~nasdaq_price, y = ~xpr_price, type = 'scatter', mode = 'markers', name ="Nasdaq-Crypto price pairing") %>%
      layout(title = 'Correlation between Nasdaq and Cryptocurrency Prices',
             xaxis = list(title = 'Nasdaq Price'),
             yaxis = list(title = 'Cryptocurrency Price'))
    for(x in input$check_3) {
      if (x == "avg") {
        #view(avg_xpr)
        res_plot <- res_plot %>% add_lines(y = ~avg_xpr, name = 'Average Crypto Price') %>%
          add_lines(x = ~avg_nasdaq, name = 'Average Nasdaq Price')
      }
      if (x == "med"){
        res_plot <- res_plot %>% add_lines(y = ~med_xpr, name = 'Median Crypto Price') %>%
          add_lines(x = ~med_nasdaq, name = 'Median Nasdaq Price')
      }
    } 
    return(res_plot)
  })
}
