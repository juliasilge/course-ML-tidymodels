library(tidyverse)
library(tidymodels)

stack_train <- readRDS("data/c2_training.rds")

stack_recipe <- recipe(remote ~ ., data = stack_train) %>% 
    step_downsample(remote)
