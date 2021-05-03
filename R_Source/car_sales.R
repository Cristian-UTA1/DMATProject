data <- read.csv("/home/ana/Desktop/stats/data.csv", colClasses=c('numeric',  'character', 'numeric', 'numeric','numeric', 'numeric', 'numeric', 'numeric','numeric','numeric'))
data$has_covid <- ifelse(data$Covid_cases>0, TRUE, FALSE)
data$has_covid <- as.factor(data$has_covid)
data
                 
summary(data$Toyota[which(data$has_covid== TRUE)])
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 71645  165957  176268  175873  196381  249601 
summary(data$Toyota[which(data$has_covid== FALSE)])
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 143048  188698  205235  201608  215948  248334 


summary(data$Honda[which(data$has_covid== TRUE)])
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 57751  101872  115112  109667  125484  136467 
summary(data$Honda[which(data$has_covid== FALSE)])
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 100497  125007  137672  135211  147308  173993 

#ADDED
summary(data$Total_Sales[which(data$has_covid == TRUE)])
summary(data$Total_Sales[which(data$has_covid == FALSE)])

#Null hypothesis: data is normally distributed
#Alternative: data is not normally distributed
with(data, shapiro.test(Toyota[which(data$has_covid== TRUE)]))# p = 0.1
#W = 0.90798, p-value = 0.1473
with(data, shapiro.test(Toyota[which(data$has_covid== FALSE)]))# p = 0.4
#W = 0.97508, p-value = 0.394
#both p values are higher than 0.05, so there is no enough evidence data is different from normal distribution

with(data, shapiro.test(Mazda[which(data$has_covid== TRUE)]))# p = 0.09
with(data, shapiro.test(Mazda[which(data$has_covid== FALSE)]))# p = 0.4

t.test(data$Toyota[which(data$has_covid== TRUE)], data$Toyota[which(data$has_covid== FALSE)])

# Welch Two Sample t-test
# 
# data:  data$Toyota[which(data$has_covid == TRUE)] and data$Toyota[which(data$has_covid == FALSE)]
# t = -1.7336, df = 22.234, p-value = 0.09683
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -49919.080   4445.556
# sample estimates:
#   mean of x mean of y 
# 175873.1  198609.8 

t.test(data$Honda[which(data$has_covid== TRUE)], data$Honda[which(data$has_covid== FALSE)])

# Welch Two Sample t-test
# 
# data:  data$Toyota[which(data$has_covid == TRUE)] and data$Toyota[which(data$has_covid == FALSE)]
# t = -2.2811, df = 15.271, p-value = 0.03729
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -49745.025  -1725.124
# sample estimates:
#   mean of x mean of y 
# 175873.1  201608.1 

t.test(data$Mazda[which(data$has_covid== TRUE)], data$Mazda[which(data$has_covid== FALSE)])

# Welch Two Sample t-test
# 
# data:  data$Mazda[which(data$has_covid == TRUE)] and data$Mazda[which(data$has_covid == FALSE)]
# t = -0.71327, df = 15.991, p-value = 0.486
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -4001.971  1986.989
# sample estimates:
#   mean of x mean of y 
# 23277.07  24284.56 

t.test(data$Hyundai[which(data$has_covid== TRUE)], data$Hyundai[which(data$has_covid== FALSE)])

# Welch Two Sample t-test
# 
# data:  data$Hyundai[which(data$has_covid == TRUE)] and data$Hyundai[which(data$has_covid == FALSE)]
# t = -2.1566, df = 19.402, p-value = 0.04378
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -20070.7727   -314.1202
# sample estimates:
#   mean of x mean of y 
# 100436.4  110628.9 

t.test(data$Ford[which(data$has_covid== TRUE)], data$Ford[which(data$has_covid== FALSE)])

# Welch Two Sample t-test
# 
# data:  data$Ford[which(data$has_covid == TRUE)] and data$Ford[which(data$has_covid == FALSE)]
# t = -4.3213, df = 16.085, p-value = 0.0005209
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -63305.95 -21647.76
# sample estimates:
#   mean of x mean of y 
# 167143.6  209620.5 


# ADDED
t.test(data$Total_Sales[which(data$has_covid== TRUE)], data$Total_Sales[which(data$has_covid== FALSE)])

# Welch Two Sample t-test
# 
# data:  data$Total_Sales[which(data$has_covid == TRUE)] and data$Total_Sales[which(data$has_covid == FALSE)]
# t = -3.334, df = 14.196, p-value = 0.004837
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -502263.7 -109329.4
# sample estimates:
#   mean of x mean of y 
# 1132975   1438771

formula = Unemp_rate ~ has_covid
summary (m0 <- lm(formula, data = data))

# Call:
#   lm(formula = formula, data = data)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -4.343 -0.500 -0.150  0.500  6.957 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)     4.2000     0.2385  17.610  < 2e-16 ***
#   has_covidTRUE   3.6429     0.5019   7.258 9.07e-10 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 1.652 on 60 degrees of freedom
# Multiple R-squared:  0.4675,	Adjusted R-squared:  0.4587 
# F-statistic: 52.68 on 1 and 60 DF,  p-value: 9.066e-10

require("stargazer")
stargazer(m0, type = "latex", dep.var.labels=c("Unemployment rate"), column.labels=c("Linear Regression"), 
          covariate.labels=c("Covid cases > 0"),  no.space=TRUE
          , out="~/Desktop/stats/unemp-covid.tex")

exp(coef(m0))


formula = Honda ~ has_covid
summary (m1 <- lm(formula, data = data))

# Call:
#   lm(formula = formula, data = data)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -51916  -9492   2957  12495  38782 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)     135211       2505  53.984  < 2e-16 ***
#   has_covidTRUE   -25544       5271  -4.846 9.25e-06 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 17350 on 60 degrees of freedom
# Multiple R-squared:  0.2813,	Adjusted R-squared:  0.2693 
# F-statistic: 23.49 on 1 and 60 DF,  p-value: 9.25e-06

require("stargazer")
stargazer(m1, type = "latex", dep.var.labels=c("Honda sales"), column.labels=c("Linear Regression"), 
          covariate.labels=c("Covid cases > 0"),  no.space=TRUE
          , out="~/Desktop/stats/honda-covid.tex")

exp(coef(m1))

formula = Mazda ~ has_covid
summary (m2 <- lm(formula, data = data))

# Call:
#   lm(formula = formula, data = data)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -12337.1  -1890.2    474.2   1963.3   9017.4 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)    24284.6      519.2  46.769   <2e-16 ***
#   has_covidTRUE  -1007.5     1092.7  -0.922     0.36    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3597 on 60 degrees of freedom
# Multiple R-squared:  0.01397,	Adjusted R-squared:  -0.002463 
# F-statistic: 0.8501 on 1 and 60 DF,  p-value: 0.3602

require("stargazer")
stargazer(m2, type = "latex", dep.var.labels=c("Mazda sales"), column.labels=c("Linear Regression"), 
          covariate.labels=c("Covid cases > 0"),  no.space=TRUE
          , out="~/Desktop/stats/mazda-covid.tex")

exp(coef(m2))

formula = Honda ~ Unemp_rate
summary (m3 <- lm(formula, data = data))

# Call:
#   lm(formula = formula, data = data)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -54655 -11660   4595  13356  39525 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   148525       5818  25.528  < 2e-16 ***
#   Unemp_rate     -3799       1059  -3.588 0.000671 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 18570 on 60 degrees of freedom
# Multiple R-squared:  0.1766,	Adjusted R-squared:  0.1629 
# F-statistic: 12.87 on 1 and 60 DF,  p-value: 0.0006715

formula = Honda ~ Unemp_rate + has_covid
summary (m4 <- lm(formula, data = data))

# Call:
#   lm(formula = formula, data = data)
# 
# Residuals:
#   Min     1Q Median     3Q    Max 
# -45110 -11330   3099  12801  38293 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   139319.9     6246.1  22.305  < 2e-16 ***
#   Unemp_rate      -978.3     1361.3  -0.719  0.47521    
# has_covidTRUE -21980.4     7252.6  -3.031  0.00362 ** 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 17420 on 59 degrees of freedom
# Multiple R-squared:  0.2876,	Adjusted R-squared:  0.2634 
# F-statistic: 11.91 on 2 and 59 DF,  p-value: 4.531e-05

require("stargazer")
stargazer(m4, type = "latex", dep.var.labels=c("Honda sales"), column.labels=c("Linear Regression"), 
          covariate.labels=c("Unemployment rate","Covid cases > 0"),  no.space=TRUE
          , out="~/Desktop/stats/honda-covid-unemp.tex")

exp(coef(m4))

plot(data$Unemp_rate, data$Honda, pch = 16, cex = 1.3, col = "blue", main = "Honda sales in respect to unemployment rate", xlab = "Unemployment rate", ylab = "Honda sales")
abline(lm(data$Honda ~ data$Unemp_rate))

plot(data$has_covid,data$Honda, main = "Honda sales and COVID19", xlab = "COVID19 cases > 0", ylab = "Honda sales")

formula = Mazda ~ Unemp_rate + has_covid
summary (m5 <- lm(formula, data = data))

# Call:
#   lm(formula = formula, data = data)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -9702.6 -2030.1   470.9  2228.3  8941.7 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)    25875.0     1280.7  20.204   <2e-16 ***
#   Unemp_rate      -378.7      279.1  -1.357    0.180    
# has_covidTRUE    372.0     1487.1   0.250    0.803    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3573 on 59 degrees of freedom
# Multiple R-squared:  0.0438,	Adjusted R-squared:  0.01139 
# F-statistic: 1.351 on 2 and 59 DF,  p-value: 0.2668

require("stargazer")
stargazer(m5, type = "latex", dep.var.labels=c("Mazda sales"), column.labels=c("Linear Regression"), 
          covariate.labels=c("Unemployment rate","Covid cases > 0"),  no.space=TRUE
          , out="~/Desktop/stats/mazda-covid-unemp.tex")

exp(coef(m5))

plot(data$Unemp_rate, data$Mazda, pch = 16, cex = 1.3, col = "blue", main = "Mazda sales in respect to unemployment rate", xlab = "Unemployment rate", ylab = "Mazda sales")
abline(lm(data$Mazda ~ data$Unemp_rate))

plot(data$has_covid,data$Mazda, main = "Mazda sales and COVID19", xlab = "COVID19 cases > 0", ylab = "Mazda sales")

hist(data$Unemp_rate)


formula = Total_Sales ~ has_covid
summary (m6 <- lm(formula, data = data))

# Call:
#   lm(formula = formula, data = data)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -569853  -73291   24166  112811  464983 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)    1438771      28180  51.056  < 2e-16 ***
#   has_covidTRUE  -305796      59304  -5.156 2.97e-06 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 195200 on 60 degrees of freedom
# Multiple R-squared:  0.3071,	Adjusted R-squared:  0.2955 
# F-statistic: 26.59 on 1 and 60 DF,  p-value: 2.975e-06

require("stargazer")
stargazer(m6, type = "latex", dep.var.labels=c("Total sales"), column.labels=c("Linear Regression"), 
          covariate.labels=c("Covid cases > 0"),  no.space=TRUE
          , out="~/Desktop/stats/total-covid.tex")

exp(coef(m6))

plot(data$has_covid,data$Total_Sales, main = "Total sales and COVID19", xlab = "COVID19 cases > 0", ylab = "Total sales")

plot(data$Unemp_rate, data$Total_Sales, pch = 16, cex = 1.3, col = "blue", main = "Total sales in respect to unemployment rate", xlab = "Unemployment rate", ylab = "Total sales")
abline(lm(data$Total_Sales ~ data$Unemp_rate))

formula = Total_Sales ~ Unemp_rate
summary (m7 <- lm(formula, data = data))

require("stargazer")
stargazer(m7, type = "latex", dep.var.labels=c("Total sales"), column.labels=c("Linear Regression"), 
          covariate.labels=c("Unemployment rate"),  no.space=TRUE
          , out="~/Desktop/stats/total-unemp.tex")

exp(coef(m7))

library(ggplot2)
ggplot(data, aes(x=Unemp_rate, y=Total_Sales)) + 
  geom_bar(stat = "identity")
