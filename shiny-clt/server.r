shinyServer(function(input, output) {
  
  random_sample <- reactive({
    
    if (input$distribution_button == "normal") {
      data <- rnorm(input$n)
    } else if (input$distribution_button == "log_normal") {
      data <- rlnorm(input$n)
    } else if (input$distribution_button == "exponential") {
      data <- rexp(input$n)
    } else if (input$distribution_button == "uniform") {
      data <- runif(input$n)
    }
    
    data
  })
  
  multiple_samples <- reactive({
    
    if (input$distribution_button == "normal") {
      data <- replicate(input$k, rnorm(input$n))
    } else if (input$distribution_button == "log_normal") {
      data <- replicate(input$k, rlnorm(input$n))
    } else if (input$distribution_button == "exponential") {
      data <- replicate(input$k, rexp(input$n))
    } else if (input$distribution_button == "uniform") {
      data <- replicate(input$k, runif(input$n))
    }
    
    data
  })
  
  output$population_distribution <- renderPlot({
    data <- random_sample()
    hist(data)
  })
  
  output$sampling_distribution <- renderPlot({
    data <- multiple_samples()
    
    sample_means <- colMeans(data)
    
    hist(sample_means, probability=TRUE)
    lines(density(sample_means))
    
  })
})