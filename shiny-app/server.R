# server.R

library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(viridis)

shinyServer(function(input, output) {
  
  output$checkbox <- renderUI({
    req(input$select)
    choice <- data_clean %>%
      filter(category %in% input$select) %>%
      pull(platform) %>%
      unique()
    checkboxGroupInput("checkbox", "Select A Social Media Platform:",
                       choices = choice, 
                       selected = choice)
  })

  filtered_data <- reactive({
    req(input$selected_platforms)
    data_clean %>%
      filter(platform %in% input$selected_platforms)
  })
  
  filtered_standardized <- reactive({
    req(input$selected_platforms)
    data_standardized %>%
      filter(platform %in% input$selected_platforms)
  })
  

  mean_data <- reactive({
    filtered_data() %>%
      group_by(gender, platform) %>%
      summarise(mean_value = mean(.data[[input$select_variable]], na.rm = TRUE), .groups = "drop")
  })
  
  output$graph1 <- renderPlotly({
    p <- ggplot(mean_data(), aes(x = gender, y = mean_value, fill = platform)) +
      geom_bar(stat = "identity", position = "stack") +
      labs(
        y = paste("Average Value by", input$select_variable),
        x = "Gender",
        fill = "Platform"
      ) +
      theme_minimal()
    
    ggplotly(p)
  })

  output$graph2 <- renderPlotly({
    req(filtered_data())
    ggplot(filtered_data(), aes(x = age, y = usage_mins)) +
      geom_boxplot(fill = "green") +
      labs(
        x = "Age Group",
        y = "Usage(minutes)"
      ) +
      theme_minimal()
  })
  
  output$graph3 <- renderPlotly({
    req(filtered_standardized())
    p <- ggplot(filtered_standardized(), aes(
      x = emotion,
      y = platform,
      fill = Ratio,
      text = hover_text
    )) +
      geom_tile() +
      scale_fill_viridis_c(option = "plasma") +
      labs(x = "Dominant Emotion", y = "Platform", fill = "Ratio") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    ggplotly(p, tooltip = "text")
  })
  
})