#What is regression?
rm(list=ls())
library(tidyverse)

x <- runif(50, 0, 100)
y <- 5*x
#y <- 5*x + rnorm(50, 0, 75)

ggplot() +
  geom_point(aes(x = x, y = y), color = "black")

slopes <- rnorm(75, 0, 8)
intercepts <- mean(y) - slopes*mean(x) + rnorm(75, 0, 7)

ggplot() + 
  geom_point(aes(x = x, y = y)) +
  geom_abline(aes(slope = slopes, intercept = intercepts), alpha = 0.1) +
  geom_abline(slope = 5, intercept = 0, color = "purple", lwd = 2) + 
  geom_hline(yintercept = mean(y), 
             color = "red", linetype = "dashed", lwd = 1.5) +
  geom_smooth(aes(x = x, y = y),
              method = "lm", color = "blue", lwd = 1.5, se = FALSE)

