library(tidyverse)
stack_overflow <- read_csv("data/stack_overflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Load tidymodels
library(___)

# Create stack_select dataset
stack_select <- stack_overflow %>%
    select(-Respondent)

# Split the data into training and testing sets
set.seed(1234)
stack_split <- stack_select %>%
    initial_split(___,
                  strata = ___)

stack_train <- training(___)
stack_test <- testing(___)


