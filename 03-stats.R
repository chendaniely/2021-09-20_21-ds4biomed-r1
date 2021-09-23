library(tidyverse)

filtered_pipeline <- read_csv("data/tumor_filtered.csv")
filtered_pipeline

filtered_pipeline %>%
  filter(Day == 0) %>%
  select(Size)

filtered_pipeline %>%
  filter(Day == 0) %>%
  pull(Size) %>%
  mean()

filtered_pipeline %>%
  filter(Group == 1, Day == 0) %>%
  pull(Size) %>%
  mean()

filtered_pipeline %>%
  filter(Group == 2, Day == 0) %>%
  pull(Size) %>%
  mean()

filtered_pipeline %>%
  filter(Group == 3, Day == 0) %>%
  pull(Size) %>%
  mean()

filtered_pipeline %>%
  filter(Group == 4, Day == 0) %>%
  pull(Size) %>%
  mean()

filtered_pipeline %>%
  pull(Group) %>%
  unique()

filtered_pipeline %>%
  filter(Day == 0) %>%
  group_by(Group) %>%
  summarize(avg_size = mean(Size))

filtered_pipeline %>%
  group_by(Group, Day) %>%
  summarize(avg_size = mean(Size))

filtered_pipeline %>%
  group_by(Group, Day) %>%
  summarize(avg_size = mean(Size),
            sd_size = sd(Size),
            q1 = quantile(Size, probs = 0.25)
            )

