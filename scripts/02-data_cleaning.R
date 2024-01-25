#### Preamble ####
# Purpose: Cleans two raw dats downloaded from opendatatoronto
# Author: Andy Wang
# Date: January 23, 2023
# Contact: jming.wang@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(janitor)
library(knitr)
library(lubridate)
library(opendatatoronto)
library(tidyverse)


#### Clean data ####
licences_raw_data <-
  read_csv(
    "inputs/data/licences_raw_data.csv",
    show_col_types = FALSE
  )

licences_cleaned_data <-
  clean_names(licences_raw_data) |>
  mutate(issued = ymd(issued)) |> 
  select(x_id, category, issued, licence_address_line_2) |>
  tidyr::drop_na() |>
  rename(id = x_id,
         issued_date = issued,
         address = licence_address_line_2) |>
  mutate(category = case_when(
    category == "EATING ESTABLISHMENT" ~ "eating_establishment",
    category == "RETAIL STORE (FOOD)" ~ "retail_store_food",
    category == "PUBLIC GARAGE" ~ "public_garage",
    category == "PERSONAL SERVICES SETTINGS" ~ "personal_services_settings",
    category == "LAUNDRY" ~ "laundry",
    category == "COMMERCIAL PARKING LOT" ~ "commercial_parking_lot",
    category == "HOLISTIC CENTRE" ~ "holistic_centre",
    category == "BUILDING RENOVATOR" ~ "building_renovator",
    category == "TOW TRUCK OWNER" ~ "tow_truck_owner",
    category == "TAXICAB OWNER" ~ "taxicab owner",
    TRUE ~ "other"))|>
  mutate(address = tolower(address),
         address = substr(address, 1, nchar(address) - 4)) |>
  filter(year(issued_date) >= 2018, 
         year(issued_date) <= 2023)

licences_raw_data <-
  read_csv(
    "inputs/data/covid_raw_data.csv",
    show_col_types = FALSE
  )

covid_cleaned_data <-
  clean_names(covid_raw_data) |>
  mutate(reported_date = ymd(reported_date)) |>
  select(id, reported_date) |>
  tidyr::drop_na()

head(covid_cleaned_data)


#### Save data ####
write_csv(licences_cleaned_data, "outputs/data/licences_cleaned_data.csv")
write_csv(covid_cleaned_data, "outputs/data/covid_cleaned_data.csv")

