library(tidyverse)
glimpse(OpenData)

OpenData <- OpenData %>%
  rename(population_thousands = population)
OpenData <- OpenData %>%
  mutate(year = as.Date(paste0(year, "-01-01"), format = "%Y-%m-%d"))

glimpse(OpenData)

ggplot(data = OpenData)
ggplot(
  data = OpenData,
  mapping = aes(x = population_thousands, y = labor_force_thousands)
)
