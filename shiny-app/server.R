# server.R

library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(viridis)

shinyServer(function(input, output) {

  output$graph1 <- renderPlot({
    
  })
  
  output$graph2 <- renderPlot({
    ggplot(data_clean(), aes(x = age_group, y = usage_mins)) +
      geom_boxplot(fill = "green") +
      labs(
        title = "Usage Time by Age Group",
        x = "Age Group",
        y = "Usage (minutes)"
      ) +
      theme_minimal()
  })
  
  output$graph3 <- renderPlotly({
    req(data_standardized)
    
    p <- ggplot(data_standardized, aes(
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