library(tidyverse)
library(tidymodels)

stack_train <- readRDS("data/c3_training.rds")

vote_recipe <- ___(turnout16_2016 ~ ., data = ___) %>% 
    ___(turnout16_2016) %>%
    ___(all_numeric())
