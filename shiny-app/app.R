# global.R
library(shiny)
library(tidyverse)
library(stringr)
library(dplyr)

# Load the data
data <- readr::read_csv("shiny-app/app-data/train.csv")

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

# ui.R

library(shiny)
library(bslib)
library(shinyWidgets)
library(plotly)

shinyUI(
  fluidPage(
    theme = bs_theme(
      bootswatch = "sketchy",
      font_scale = 1.1
    ),
    
    titlePanel("Exploring Social Media Use"),
    
    card(
      card_header("Customize Your Graphs"),
      card_body(
        fluidRow(
          column(4,
                 selectInput("color_theme", "Color Theme:",
                             choices = list(
                               "Pastel Dream" = "pastel",
                               "Sunset Vibes" = "sunset",
                               "Ocean Breeze" = "ocean"
                             ),
                             selected = "pastel"
                 )
          ),
          column(4,
                 sliderInput("point_size", "Point Size",
                             min = 3, max = 15, value = 8, step = 1
                 )
          ),
          column(4,
                 checkboxInput("show_grid", "Show Grid Lines", value = TRUE)
          )
        )
      )
    ),
    
    br(),
    
    # Graph cards
    fluidRow(
      column(4,
             card(
               height = 450,
               card_header("Graph 1"),
               card_body(
                 plotlyOutput("scatter_plot", height = "350px")
               )
             )
      ),
      column(4,
             card(
               height = 450,
               card_header("Graph 2"),
               card_body(
                 plotlyOutput("line_plot", height = "350px")
               )
             )
      ),
      column(4,
             card(
               height = 450,
               card_header("Graph 3"),
               card_body(
                 plotlyOutput("bar_plot", height = "350px")
               )
             )
      )
    ),
    
    br(),
    
    # Fun footer
    card(
      card_body(
        div(
          style = "text-align: center; color: #666; font-style: italic;",
          "Data Source: shiny-app/app-data/train.csv"
        )
      )
    )
  )
)

  
# server.R

server <- function(input, output, session) {
}

