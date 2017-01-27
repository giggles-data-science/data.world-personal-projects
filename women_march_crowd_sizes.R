df <- read.csv("/Users/laurenwashington/Downloads/womens-marches-crowd-sizes-QueryResult.csv")
View(df)
df_na <- na.omit(df)
#sort high to low by high estimates
df_na <- df_na[order(-df_na$crowd.high.estimate),]
#view top 10 high estimate crowds columns 1:5
top_ten_high_estimate <- head(df_na[,1:5], 10)
#view bottom 10 high estimate crowds columns 1:5
bottom_ten_high_estimate <- tail(df_na[,1:5], 10)
#locations in top 25% of crowd sizes
top_25_percent <- subset(df_na, df_na$crowd.high.estimate >= 3000)
top_25_percent <- top_25_percent[order(-top_25_percent$crowd.high.estimate),]
#add difference column
df_na$difference <- df_na$crowd.high.estimate - df_na$crowd.low.estimate
#accurate estimate
accurate_estimates <- subset(df_na, df_na$difference == 0)
accurate_estimates <- accurate_estimates[order(-accurate_estimates$crowd.high.estimate),]
#sorted df by difference column
crowd_high_difference <- df_na[order(-df_na$difference),]
#interquartile range for all marches
quantile(df_na$crowd.high.estimate)
#calculate size of top 10% crowds
quantile(df_na$crowd.high.estimate, .90)
#view subset of top 10%
top_10 <- subset(df_na, df_na$crowd.high.estimate >= 10000)
top_10 <- top_10[order(-top_10$crowd.high.estimate), ]
top_10
#view top 10 locations with exceeding expectations crowd sizes
top_10_ee <- head(crowd_high_difference, 10)
#view bottom 10 locations with exceeding expectations crowd sizes
bottom_10_ee <- tail(subset(crowd_high_difference,crowd_high_difference$difference > 0), 10)
#create subset w/ locations w/ difference > 0
difference_greater_than_zero <- subset(df_na, df_na$difference > 0)
#interquartile range for all marches w/ difference > 0
quantile(difference_greater_than_zero$difference)
#view subset of top 25% of locations w/ difference > 0
top_25_percent_expectations_diff_gt0 <- subset(difference_greater_than_zero, difference_greater_than_zero$difference >= 2000)
top_25_percent_expectations_diff_gt0 <- top_25_percent_expectations_diff_gt0[order(-top_25_percent_expectations_diff_gt0$difference),]
top_25_percent_expectations_diff_gt0
#calculate size of top 10% crowds
quantile(difference_greater_than_zero$difference, .90)
#view subset of top 10% of locations w/ difference > 0
top_10_percent_expectations_diff_gt0 <- subset(top_25_percent_expectations_diff_gt0, top_25_percent_expectations_diff_gt0$difference >= 6600)
top_10_percent_expectations_diff_gt0 <- na.omit(top_10_percent_expectations_diff_gt0)
top_10_percent_expectations_diff_gt0 <- top_10_percent_expectations_diff_gt0[order(-top_10_percent_expectations_diff_gt0$difference),]
top_10_percent_expectations_diff_gt0
