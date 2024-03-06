library("tidyverse")

#read data and construct dataframe
xpr_df <- read.csv("datasets/xrp.csv")
nasdaq_df <- read.csv("datasets/nasdaq.csv")

#ensure date data is usable
xpr_df$Date <- as.Date(xpr_df$Date, "%m/%d/%Y")
nasdaq_df$Date <- as.Date(nasdaq_df$Date, "%m/%d/%Y")

#Joining based on date, only closing prices used.
joined_df <- left_join(xpr_df
                       %>% rename(xpr_price = Price) 
                       %>% select(Date,xpr_price), 
                       nasdaq_df 
                       %>% rename(nasdaq_price = Close.Last) 
                       %>% select(Date,nasdaq_price))

#nasdaq data missing for sundays and saturdays, so we delete them.
joined_df <- joined_df %>% filter(!is.na(nasdaq_price))

#calculate change from each type of data
joined_df <- joined_df %>% arrange(Date) %>%  
  mutate(xpr_change = xpr_price - lag(xpr_price)) %>% mutate(nasdaq_change = nasdaq_price - lag(nasdaq_price))

#Categorical variable indicating whether the XRP price increased, decreased, or stayed the same 
#compared to the previous day.
joined_df <- joined_df %>% 
  mutate(xpr_status = ifelse(xpr_change < 0, "Increased", 
                             ifelse(xpr_change > 0, "Decreased", "No Change"))) %>% 
  mutate(nasdaq_status = ifelse(nasdaq_change < 0, "Increased", 
                                ifelse(nasdaq_change > 0, "Decreased", "No Change")))
#calculate change in percentage
joined_df <- joined_df %>% 
  mutate(xpr_perc = round(xpr_change / lag(xpr_price) * 100, 3) ) %>% 
  mutate(nasdaq_perc = round(nasdaq_change / lag(nasdaq_price) * 100, 3) )

#summarize mean and median of change for each
xpr_mean <- joined_df %>%  summarize(xpr_mean = mean(xpr_perc, na.rm = TRUE))
xpr_median <- joined_df %>%  summarize(xpr_median = median(xpr_perc, na.rm = TRUE))
nasdaq_mean <- joined_df %>%  summarize(nasdadq_mean = mean(nasdaq_perc, na.rm = TRUE))
nasdaq_median <- joined_df %>%  summarize(nasdaq_median = median(nasdaq_perc, na.rm = TRUE))

#trying gg-plots
  ggplot() + 
    geom_line(data = joined_df, aes(x = Date, y = xpr_perc, color = "blue"), na.rm = TRUE) + 
    geom_line(data = joined_df, aes(x = Date, y = nasdaq_perc, color = "red"), na.rm = TRUE)

write.csv(joined_df, "nasdaq_xpr_comparison.csv")
