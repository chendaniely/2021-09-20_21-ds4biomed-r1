# 0. Open the ds4biomed-learner project
# 1. Load the tidyverse and readxl libraries
library(tidyverse)
library(readxl)

# 2. Load the “data/medicaldata_tumorgrowth.xlsx” dataset to the variable “tumor” using the read_excel() function
tumor <- read_excel("data/medicaldata_tumorgrowth.xlsx")

# 3. Filter tumor such that it only contains the values from Day 21
# 4. Calculate the average Size for each value of Group

tumor %>%
  filter(Day == 21) %>%
  group_by(Group) %>%
  summarize(avg_size = mean(Size))

tumor %>%
  group_by(Group) %>%
  summarize(avg_size = mean(Size))

