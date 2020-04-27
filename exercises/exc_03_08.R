library(tidyverse)
library(tidymodels)

vote_train <- readRDS("data/c3_training.rds")

vote_recipe <- ___(turnout16_2016 ~ ., data = ___) %>% 
    ___(turnout16_2016)
