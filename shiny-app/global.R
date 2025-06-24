# global.R
library(shiny)
library(tidyverse)
library(stringr)
library(dplyr)

# Load the data
data <- readr::read_csv("/cloud/project/shiny-app/app-data/train.csv")

#Clean data by fixing mismatch in rows
data_clean <- data %>%
  mutate(
    is_misplaced = str_to_lower(Age) %in% c("male", "female", "non-binary"),
    true_age = if_else(is_misplaced, Gender, Age),
    true_gender = if_else(is_misplaced, Age, Gender),
    Age = as.numeric(true_age),
    Gender = true_gender
  ) %>%
  select(-true_age, -true_gender, -is_misplaced)

#Drop problematic row with na values for age and gender
data_clean <- data_clean %>%
  filter(!is.na(Age))

#Rename columns
data_clean <- data_clean %>%
  rename(
    user_id = User_ID,
    age = Age,
    gender = Gender,
    platform = Platform,
    usage_mins = `Daily_Usage_Time (minutes)`,
    posts_daily = Posts_Per_Day,
    likes_daily = Likes_Received_Per_Day,
    comments_daily = Comments_Received_Per_Day,
    messages_daily = Messages_Sent_Per_Day,
    emotion = Dominant_Emotion
  )
