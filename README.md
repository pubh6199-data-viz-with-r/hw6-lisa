[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/2V1dzZDL)
# Final Project: Team Lisa's Exploration of Social Media Use

Authors: Riya Belani and Moyalo Ifebajo
Course: PUBH 6199 – Visualizing Data with R  
Date: 6/26/2025

## 🔍 Project Overview

This interactive dashboard explores the Social Media Usage and Emotional Well-Being Kaggle data set through three visualizations. The visualizations aim to explore different social media usages such as likes, posts, messages, and amount of time spent againt gender and age as well as how different platforms may elicit different emotions.

## 📊 Final Write-up

The final write-up, including code and interpretation of the visualizations, is available here:

👉 [**View the write-up website**](https://pubh6199-data-viz-with-r.github.io/hw6-YOUR-TEAM-NAME/)

## 📂 Repository Structure

```plaintext
.
├── _quarto.yml          # Quarto configuration file
├── .gitignore           # Files to ignore in git
├── data/                # Cleaned data files used in project
├── .Rproj               # RStudio project file
├── index.qmd            # Main Quarto file for final write-up
├── scratch/             # Scratch files for exploratory analysis         
├── shiny-app/           # Shiny app folder 
│   ├── global.R
│   ├── ui.R
|   ├── server.R  
|   ├── www/             # Static files for Shiny app (CSS, JS, images)
│   └── app-data/        # Data files for Shiny app
├── docs/                # Rendered site (auto-generated)
└── README.md            # This file
```

## 🛠 How to Run the Code

### To render the write-up:

1. Open the `.Rproj` file in RStudio.
2. Open `index.qmd`.
3. Click **Render**. The updated html will be saved in the `docs/` folder.

### To run the Shiny app (if applicable):

```r
shiny::runApp("shiny-app")
```
 `shiny-app/app-data/`.

## 🔗 Shiny App Link

👉 [https://yourusername.shinyapps.io/your-app-name](https://yourusername.shinyapps.io/your-app-name)

## 📦 Packages Used

- `tidyverse`
- `ggplot2`
- `quarto`
- `shiny`
- 'dplyr'
- 'plotly'
- 'viridis'
- 'bslib'
- 'shinyWidgets'
- 'stringr'

## ✅ To-Do or Known Issues

[Optional section for you to note improvements or bugs.]
