library("tidyverse")

xpr_df <- read.csv("datasets/xrp.csv")
nasdaq_df <- read.csv("datasets/nasdaq.csv")

#Joining based on date, need new column labels to differentiate xpr and nasdaq
