<<<<<<< Updated upstream
# global.R
data <- readr::read_csv("data/train.csv")
  
# ui.R
  
# server.R
=======
library(shiny)
library(tidyverse)
library(lubridate)
library(forcats) 

# Load the data
nsf_terminations <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-05-06/nsf_terminations.csv')

# TODO: Preprocess the data
# convert grant_number to character
# collapse division column to only keep the 9 most frequent divisions and a catch-all category called Other
# collapse nsf_program_name column to only keep the 9 most frequent divisions and  and a catch-all category called Other
# your code here:
nsf_data <- nsf_terminations %>%
  mutate(
    grant_number = as.character(grant_number),
    division = fct_lump(fct_infreq(division), n = 9),
    nsf_program_name = fct_lump(fct_infreq(nsf_program_name), n = 9))


>>>>>>> Stashed changes

