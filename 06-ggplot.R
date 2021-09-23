library(tidyverse)
library(ggplot2)
library(medicaldata)

blood_storage

class(blood_storage)

blood_storage %>%
  group_by(Recurrence) %>%
  summarize(ct = n())

ggplot(data = blood_storage, mapping = aes(x = Recurrence)) +
  geom_bar()

ggplot(data = blood_storage,
       mapping = aes(x = as.factor(Recurrence))) +
  geom_bar()

ggplot(blood_storage,
       aes(x = as.factor(Recurrence))) +
  geom_bar()

ggplot(blood_storage) +
  geom_bar(aes(x = as.factor(Recurrence)))

ggplot(blood_storage, aes(x = Age)) + geom_histogram()

ggplot(blood_storage, aes(x = Age)) + geom_histogram(bins = 10)
ggplot(blood_storage, aes(x = Age)) + geom_histogram(bins = 4)
ggplot(blood_storage, aes(x = Age)) + geom_histogram(bins = 2)

ggplot(blood_storage) +
  geom_boxplot(aes(x = TVol, y = Age))

ggplot(blood_storage) +
  geom_boxplot(aes(x = as.factor(TVol), y = Age))

ggplot(blood_storage) +
  geom_violin(aes(x = as.factor(TVol), y = Age))

ggplot(blood_storage) +
  geom_violin(aes(x = as.factor(TVol), y = Age)) +
  geom_point(aes(x = as.factor(TVol), y = Age))

ggplot(blood_storage) +
  geom_violin(aes(x = as.factor(TVol), y = Age)) +
  geom_jitter(aes(x = as.factor(TVol), y = Age))

ggplot(blood_storage) +
  geom_boxplot(aes(x = as.factor(TVol), y = Age)) +
  geom_jitter(aes(x = as.factor(TVol), y = Age))

ggplot(blood_storage, aes(x = as.factor(TVol), y = Age)) +
  geom_boxplot() +
  geom_jitter()

ggplot(blood_storage, aes(x = PVol,
                          y = PreopPSA,
                          color = as.factor(sGS))) +
  geom_point(alpha = 0.25)

ggplot(blood_storage, aes(x = PVol,
                          y = PreopPSA,
                          color = as.factor(sGS))) +
  geom_point() +
  facet_wrap(~ RBC.Age.Group)

ggplot(blood_storage, aes(x = PVol,
                          y = PreopPSA,
                          color = as.factor(sGS),
                          shape = as.factor(sGS))) +
  geom_point() +
  facet_grid(RBC.Age.Group ~ Recurrence)

ggplot(blood_storage, aes(x = PVol,
                          y = PreopPSA,
                          color = as.factor(sGS),
                          shape = as.factor(sGS))) +
  geom_point() +
  facet_grid(RBC.Age.Group ~ Recurrence) +
  theme_minimal()

library(ggthemes)

g <- ggplot(blood_storage, aes(x = PVol,
                          y = PreopPSA,
                          color = as.factor(sGS),
                          shape = as.factor(sGS))) +
  geom_point() +
  facet_grid(RBC.Age.Group ~ Recurrence)

g + theme_wsj()

# Load the cytomegalovirus dataset, assign it to the variable cmv
cmv <- cytomegalovirus


# Bar chart of the cmv response variable
ggplot(cmv) + geom_bar(aes(x = cmv))

#bar plot of prior.transplant, colored by cmv values

ggplot(cmv, aes(x = as.factor(prior.transplant))) +
  geom_bar(aes(fill = as.factor(cmv)))

ggplot(cmv, aes(x = as.factor(prior.transplant))) +
  geom_bar(aes(fill = as.factor(cmv)), position = "dodge")

# facet by both donor.cmv and recipient.cmv

ggplot(cmv, aes(x = as.factor(prior.transplant))) +
  geom_bar(aes(fill = as.factor(cmv)), position = "dodge") +
  facet_grid(donor.cmv ~ recipient.cmv)
