library(tidyverse)
stack_overflow <- read_csv("data/stack_overflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Load tidymodels
library(tidymodels)

# Create stack_select dataset
stack_select <- stack_overflow %>%
    select(-Respondent)

# Split the data into training and testing sets
set.seed(1234)
stack_split <- stack_select %>%
    initial_split(p = 0.8,
                  strata = remote)

stack_train <- training(stack_split)
stack_test <- testing(stack_split)
