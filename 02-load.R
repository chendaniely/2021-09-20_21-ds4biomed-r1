library(tidyverse)

read_csv("data/medicaldata_tumorgrowth.csv")

tumor <- read_csv("data/medicaldata_tumorgrowth.csv")
tumor

library(readxl)

tumor_xl <- read_excel("data/medicaldata_tumorgrowth.xlsx")

class(tumor_xl)

tumor

select(tumor, Size)

select(tumor, Group, Day, Size)

tumor %>%
  select(Group, Day, Size)

filter(tumor, Group == 1)

tumor %>%
  filter(Group == 1)

tumor %>%
  filter(Group == 1, Day == 0)

tumor %>%
  filter(Group == 1 & Day == 0)

tumor %>%
  filter(Group == 1 | Day == 0)

tumor %>%
  select(Group, Day, Size) %>%
  filter(Size > 2000)

# f(g(h(x)))

# x %>%
#   h() %>%
#   g() %>%
#   f()

filtered <- tumor %>%
  select(Group, ID, Day, Size) %>%
  filter(Day == 0 | Day == 15)

write_csv(filtered, "data/tumor_filtered.csv")

library(writexl)

write_xlsx(filtered, "data/tumor_filtered.xlsx")





# Read in all the patient data from the spreadsheets chapter (chapter 2) found in data > spreadsheets > all.csv
# select the first_name, last_name, day, time, and temp_f columns.
# filter the rows such that the person’s name is “Aniya Warner”
# Save the filtered dataset into the output folder named aniya_warner.csv.
#

library(tidyverse)
all <- read_csv("data/spreadsheets/all.csv")

aniya <- all %>%
  select(first_name, last_name, day, time, `temp_f`) %>%
  filter(first_name == "Aniya", last_name == "Warner")
aniya
write_csv(aniya, "output/aniya_warner.csv")
