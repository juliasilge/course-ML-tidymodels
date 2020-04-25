library(tidyverse)
library(tidymodels)

stack_train <- readRDS("data/c2_training.rds")

stack_recipe <- ___(remote ~ ., data = stack_train) %>% 
    step_downsample(___)
