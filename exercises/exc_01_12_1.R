library(tidyverse)
library(tidymodels)

lm_res <- readRDS("data/c1_lm_res.rds")
rf_res <- readRDS("data/c1_rf_res.rds")

results <-  bind_rows(___ %>%
                          unnest(.predictions) %>%
                          mutate(model = "lm"),
                      ___ %>%
                          unnest(.predictions) %>%
                          mutate(model = "rf"))

results
