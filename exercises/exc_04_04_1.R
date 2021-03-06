library(tidyverse)
sisters67 <- read_csv("data/sisters.csv")

# Print the structure of sisters67
glimpse(sisters67)

# Tidy the data set
tidy_sisters <- sisters67 %>%
    select(-sister) %>%
    ___(-age, names_to = "question", values_to = "rating")

# Print the structure of tidy_sisters
___
