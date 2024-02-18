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

#Categorical variable indicating whether the XRP price increased, decreased, or stayed the same 
#compared to the previous day.
joined_df <- joined_df %>%
  mutate(xpr_change = ifelse(xpr_price > lag(xpr_price), "Increased",
                             ifelse(xpr_price < lag(xpr_price), "Decreased", "No Change")))


