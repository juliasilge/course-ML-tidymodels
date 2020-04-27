library(tidyverse)
library(tidymodels)

vote_train <- readRDS("data/c3_training.rds")

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016) %>%
    step_normalize(all_numeric())

## Specify a k-nearest neighbor model
knn_spec <- nearest_neighbor() %>%
    set_engine("kknn") %>%
    set_mode("classification")

## Add the recipe + model to a workflow
vote_wf <- workflow() %>%
    add_recipe(vote_recipe) %>%
    add_model(knn_spec)

vote_wf
