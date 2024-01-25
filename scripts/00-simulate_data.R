#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Simulate data ####
set.seed(6321)

ids <- 1:1000

start_date <- ymd("2018-01-01")
end_date <- ymd("2023-12-31")

total_days <- as.integer(end_date - start_date)
random_days <- floor(runif(1000, min = 0, max = total_days))
dates <- start_date + days(random_days)

business_types <- c("Retail", "Transportation", "Entertainment", "Others")
business_categories <- sample(business_types, 1000, replace = TRUE)

toronto_areas <- c("North York", "Mississauga", "Markham", "Toronto")
addresses <- sample(toronto_areas, 1000, replace = TRUE)

simulated_data_licences <- tibble(
  id = ids,
  issued_date = dates,
  address = addresses,
  business_category = business_categories
)

random_days <- floor(runif(1000, min = 0, max = total_days))
dates <- start_date + days(random_days)


set.seed(6322)
start_date <- ymd("2018-01-01")
end_date <- ymd("2023-12-31")

total_days <- as.integer(end_date - start_date)
random_days <- floor(runif(1000, min = 0, max = total_days))
dates_2 <- start_date + days(random_days)

simulated_data_covid <- tibble(
  id = ids,
  reported_date = dates_2
)


head(simulated_data_licences)
head(simulated_data_covid)