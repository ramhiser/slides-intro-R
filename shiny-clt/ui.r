library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Central Limit Theorem"),
  
  sidebarPanel(
    uiOutput("Options"),
    radioButtons("distribution_button", "Distribution:",
                 list("Normal" = "normal",
                      "Log-normal" = "log_normal",
                      "Exponential" = "exponential",
                      "Uniform" = "uniform")),

    sliderInput("n", 
                "Number of observations in each sample from parent distribution:", 
                value = 500,
                min = 2, 
                max = 1000),

    sliderInput("k", 
                "Number of samples taken from parent distribution:", 
                value = 50,
                min = 2, 
                max = 1000)
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Population Distribution",
               plotOutput("population_distribution", width=800, height=600)
      ),
      tabPanel("Sampling Distribution",
               plotOutput("sampling_distribution", width=800, height=600)
      )
    )
  )
))