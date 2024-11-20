library(tidyverse)
glimpse(OpenData)

OpenData <- OpenData %>%
  rename(population_thousands = population)
OpenData <- OpenData %>%
  mutate(year = as.Date(paste0(year, "-01-01"), format = "%Y-%m-%d"))


glimpse(OpenData)
summary(Open)
