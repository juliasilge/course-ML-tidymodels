library(tidyverse)
library(tidymodels)

stack_train <- readRDS("data/c3_training.rds")

vote_recipe <- recipe(turnout16_2016 ~ ., data = vote_train) %>% 
    step_upsample(turnout16_2016) %>%
    step_normalize(all_numeric())

## Specify a k-nearest neighbor model
knn_spec <- ___ %>%
    set_engine("kknn")

## Add the recipe + model to a workflow
vote_wf <- workflow() %>%
    ___(vote_recipe) %>%
    ___(knn_spec)

vote_wf
