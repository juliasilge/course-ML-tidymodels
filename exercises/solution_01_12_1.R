library(tidyverse)
library(tidymodels)

lm_res <- readRDS("data/c1_lm_res.rds")
rf_res <- readRDS("data/c1_rf_res.rds")

results <-  bind_rows(lm_res %>%
                          unnest(.predictions) %>%
                          mutate(model = "lm"),
                      rf_res %>%
                          unnest(.predictions) %>%
                          mutate(model = "rf"))

results
