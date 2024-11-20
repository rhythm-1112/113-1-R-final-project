#1
trafficAccidents <- read_csv("trafficAccidents.csv")  

glimpse(trafficAccidents$accident_date)
trafficAccidents <- trafficAccidents %>%
  mutate(accident_date = ymd(accident_date))
glimpse(trafficAccidents$accident_date)

#"20240327" -- yyyymmdd -- ymd
#"Jan. 21, 1997" -- mdy

#2
future <- read_csv("future.csv") 

glimpse(future$YEARMONTH) 
future <- future %>%
  mutate(YEARMONTH = ym(YEARMONTH))
glimpse(future$YEARMONTH) 

#3
growth <- read_csv("growth_tw.csv") 

glimpse(growth$PERIOD) 
growth <- growth %>%
  mutate(
    PERIOD = str_extract(PERIOD, "\\d+"),                      # Extracts the numeric part of the Taiwan year
    year = as.numeric(PERIOD) + 1911,                          # Converts Taiwan year to Gregorian year
    quarter = str_extract(growth$PERIOD, "第\\d季"),           # Extracts the quarter part (e.g., "第1季")
    quarter = str_replace_all(quarter, "第|季", ""),           # Removes the "第" and "季" characters
    PERIOD = paste0(year, "-Q", quarter),                      # Combines to form yyyy-Qq format
    PERIOD = yq(PERIOD)                                        # Parses the yyyy-Qq format to date
  ) %>%
  select(-year, -quarter)                                      # Removes temporary columns
glimpse(growth$PERIOD)

#4
CPI <- read_csv("CPI2.csv") 


glimpse(CPI$PERIOD)
CPI <- CPI %>%
  mutate(
    PERIOD = str_replace_all(PERIOD, "年|月", ""),         # Remove "年" and "月"
    year = as.numeric(str_sub(PERIOD, 1, 3)) + 1911,      # Convert Taiwan year to Gregorian year
    month = str_sub(PERIOD, 4, 5),                        # Extract the month
    PERIOD = ym(paste0(year, month))                      # Combine year and month, and parse as date
  ) %>%
  select(-year, -month)                                   # Remove temporary columns
glimpse(CPI$PERIOD)

#5
exchangeRate <- read_csv("exchangeRate2.csv") 

glimpse(exchangeRate$PERIOD) 
exchangeRate <- exchangeRate %>%
  mutate(
    PERIOD = str_replace(PERIOD, "年", ""),              # Remove "年"
    year = as.numeric(PERIOD) + 1911,                    # Convert Taiwan year to Gregorian year
    PERIOD = ymd(paste0(year, "-01-01"))                 # Set to January 1 of each year
  ) %>%
  select(-year)                                          # Remove the temporary year column
glimpse(exchangeRate$PERIOD)

#6
survey <- read_csv("https://raw.githubusercontent.com/tpemartin/113-1-R/refs/heads/main/Lecture-notes/ee-survey.csv") 

glimpse(survey) 
survey <- survey %>%
  mutate(Timestamp = mdy_hms(Timestamp, tz = "Asia/Taipei"))
glimpse(survey) 

#tz