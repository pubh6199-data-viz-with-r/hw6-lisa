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
      card_header("Choose The Social Media Platforms You Want To View"),
      card_body(
        checkboxGroupInput(
          inputId = "selected_platforms",
          label = "Select Social Media Platforms:",
          choices = unique(data_clean$platform),
          selected = unique(data_clean$platform),
          inline = TRUE,
        )
      )
    ),
    
    br(),
    
    # Graph cards
    fluidRow(
      column(4,
             card(
               height = 450,
               card_header("Graph 1: Average Social Media Metric by Gender"),
               card_body(
                 fluidRow(
                   column(8,
                          selectInput(
                            inputId = "select_variable", "Select a variable:",
                            choices = c("Number of posts made" = "posts_daily", 
                                        "Number of likes received" = "likes_daily", 
                                        "Number of comments received" = "comments_daily",
                                        "Number of messages" = "messages_daily")
                                  ),
                            selected = "posts_daily"
                   )
                 ),
                  plotlyOutput("graph1")
               )
             )
            ),
      column(4,
             card(
               height = 450,
               card_header("Graph 2: Average Daily Usage by Age Group"),
               card_body(
                 fluidRow(
                   column(12,
                 sliderInput(
                   inputId = "age_bin_width",
                   label = "Select age bin size (years):",
                   min = 1,
                   max = 15,
                   value = 5,
                   step = 1,
                 ),
                 plotlyOutput("graph2")
               )
              )
           )
         )
      ),
      column(4,
             card(
               height = 450,
               card_header("Graph 3: Emotional Response Ratios Across Platforms"),
               card_body(
                 plotlyOutput("graph3")
               )
             )
      )
    ),
    
    br(),
    
    # Footer
    card(
      card_body(
        div(
          style = "text-align: center; color: #666; font-style: italic;",
          "Data Source: https://www.kaggle.com/datasets/emirhanai/social-media-usage-and-emotional-well-being"
           )
          )
        )
      )
    )

