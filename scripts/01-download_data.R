#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Andy Wang
# Date: January 23, 2023
# Contact: jming.wang@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
licences_raw_data <-
  list_package_resources("57b2285f-4f80-45fb-ae3e-41a02c3a137f") |>
  filter(name == 
           "Business licences data.csv") |>
  get_resource()

head(licences_raw_data)


covid_raw_data <-
  list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe") |>
  filter(name == 
           "COVID19 cases") |>
  get_resource()

head(covid_raw_data)


#### Save data ####
write_csv(
  x = licences_raw_data,
  file = "inputs/data/licences_raw_data.csv"
)

write_csv(
  x = covid_raw_data,
  file = "inputs/data/covid_raw_data.csv"
)

