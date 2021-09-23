library(medicaldata)
library(tidyverse)

blood <- blood_storage

mod1 <- glm(Recurrence ~ Age, data = blood, family = "binomial")
mod1

summary(mod1)

library(broom)

res1 <- tidy(mod1)
res1

res1 %>%
  mutate(odds = exp(estimate))

mod2 <- glm(Recurrence ~ Age + PVol + PreopPSA, data = blood, family = "binomial")

tidy(mod2)

mod2 %>%
  tidy() %>%
  mutate(odds = exp(estimate))

mod3 <- glm(Recurrence ~ Age + PVol + PreopPSA + as.factor(TVol), data = blood, family = "binomial")
summary(mod3)

mod3_or <- mod3 %>%
  tidy() %>%
  mutate(odds = exp(estimate))

ggplot(mod3_or, aes(x = term, y = odds)) +
  geom_point() +
  geom_hline(yintercept = 1) +
  coord_flip()
