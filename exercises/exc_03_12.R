library(tidyverse)
library(tidymodels)

vote_train <- readRDS("data/c3_training.rds")

vote_folds <- vfold_cv(vote_train, ___ = 10, ___ = 5)

vote_folds
