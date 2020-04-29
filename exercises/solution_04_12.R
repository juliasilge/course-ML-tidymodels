library(tidyverse)
library(tidymodels)

sisters_other <- readRDS("data/c4_other.rds")
sisters_val <- readRDS("data/c4_val.rds")

sisters_recipe <- recipe(age ~ ., data = sisters_other) %>% 
    step_normalize(all_predictors()) %>%
    step_pca(all_predictors(), num_comp = tune())

knn_spec <- nearest_neighbor(
    neighbors = tune(),
    dist_power = tune()
) %>%
    set_engine("kknn") %>%
    set_mode("regression")

knn_wf <- workflow() %>%
    add_recipe(sisters_recipe) %>%
    add_model(knn_spec)

tree_grid <- grid_regular(num_comp(c(3, 12)),
                          cost_complexity(),
                          tree_depth(),
                          levels = 2)
set.seed(123)
tree_res <- tune_grid(
    tree_wf,
    sisters_val,
    tree_grid
)
