#Load packages
library(tidyverse)
library(tidymodels)

#Simulate common data
set.seed(123)
nobs <- 100
x_vals <- runif(nobs, 0, 100)
y_vals <- 3*x_vals + 10 + rnorm(nobs, mean = 0, sd = 10)

my_data <- tibble(
  x = x_vals,
  y = y_vals
)

#Split into training and test sets
#Replace seed with your birthdate
set.seed(09302016)
data_splits <- initial_split(my_data, prop = 0.75)
train <- training(data_splits)
test <- testing(data_splits)

train_folds <- vfold_cv(train, v = 10)

#Construct and fit model
lr_spec <- linear_reg() %>%
  set_engine("lm")

#Uncomment the pipe and the polynomial feature engineering
#step to build a higher-order model
lr_rec <- recipe(y ~ x, data = train) %>%
  step_poly(x, degree = 3, options = list(raw = TRUE))

lr_wf <- workflow() %>%
  add_model(lr_spec) %>%
  add_recipe(lr_rec)

lr_cv_results <- lr_wf %>%
  fit_resamples(train_folds)

# #Assess model on test data
# test_rmse <- lr_fit %>%
#   augment(test) %>%
#   rmse(y, .pred) %>%
#   pull(.estimate)
# 
# ##Share your test RMSE and what it suggests about your model's predictions...
# print(paste0("Test RMSE: ", test_rmse))
# print(paste0("We expect predictions accurate to within about: +/- ", 2*test_rmse))

lr_cv_results %>%
  collect_metrics()

# lr_cv_results %>%
#   collect_metrics(summarize = FALSE)
