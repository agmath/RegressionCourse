#What is regression?
rm(list=ls())

library(tidyverse)

set.seed(123)
x <- runif(50, 0, 100)
#y <- 5*x
x
y <- 5*x + rnorm(50, 0, 75)

#Data
ggplot() +
  geom_point(aes(x = x, y = y), 
             color = "black")

#Null Model
ggplot() +
  geom_point(aes(x = x, y = y), color = "black") +
  geom_hline(yintercept = mean(y), 
             color = "red",
             linetype = "dashed",
             lwd = 1.5)


#Many candidate models
slopes <- rnorm(75, 0, 8)
intercepts <- mean(y) - slopes*mean(x) + rnorm(75, 0, 7)

#Null, Candidates, regression, and actual
ggplot() + 
  geom_point(aes(x = x, y = y)) +
  geom_abline(aes(slope = slopes, intercept = intercepts), alpha = 0.1) +
  geom_abline(slope = 5, intercept = 0, color = "purple", lwd = 2) + 
  geom_hline(yintercept = mean(y), 
             color = "red", linetype = "dashed", lwd = 1.5)

#A regression Model
ggplot() + 
  geom_point(aes(x = x, y = y)) +
  geom_abline(aes(slope = slopes, intercept = intercepts), alpha = 0.1) +
  geom_abline(slope = 5, intercept = 0, color = "purple", lwd = 2) + 
  geom_hline(yintercept = mean(y), 
             color = "red", linetype = "dashed", lwd = 1.5) +
  geom_smooth(aes(x = x, y = y),
              method = "lm", color = "blue", lwd = 1.5, se = FALSE)








########################################################
##Real Data
########################################################
library(palmerpenguins)
penguins <- penguins

#SF Rentals Data
rent <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-05/rent.csv")
#permits <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-05/sf_permits.csv')
#new_construction <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-05/new_construction.csv')

rent %>% 
  head()

