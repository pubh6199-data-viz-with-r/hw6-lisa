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
          "Data Source: https://www.kaggle.com/datasets/emirhanai/social-media-usage-and-emotional-well-being"
        )
      )
    )
  )
)

