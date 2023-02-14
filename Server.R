library(DT)
library(kableExtra)
library(summarytools)
library(plotly)
attach(salaries_data)
function(input, output, session){
  
  #Structure
  output$structure = renderPrint({
    salaries_data %>% 
      str()
  })
  
  #Summary
  output$summary = renderPrint({
    salaries_data %>% 
      summary()
  })
  
  #DataTable
  output$dataT = renderDataTable(
    salaries_data)
  
  #Histogram
  output$histplot = renderPlotly({
    p1 = salaries_data %>% 
      plot_ly() %>% 
      add_histogram(x=~salary_in_usd) %>% 
      layout(xaxis = list(title = paste("Salaries In USD")))
    
    plot2 = salaries_data %>%
      plot_ly() %>%
      add_boxplot(x=~salary_in_usd) %>% 
      layout(yaxis = list(showticklabels = F))
    
    # stacking the plots on top of each other
    subplot(plot2, p1, nrows = 2, shareX = TRUE) %>%
      hide_legend() %>% 
      layout(title = "Distribution chart - Histogram and Boxplot",
             yaxis = list(title="Frequency"))
  })
  
  #Donut Chart
  output$donutplot = renderPlotly({
    p2 = salaries_data %>% 
      group_by(company_size) %>% 
      summarize(count=n()) %>% 
      plot_ly(labels = ~company_size, values = ~count) %>% 
      add_pie(hole=0.6) %>% 
      layout(title = "Donut charts using Plotly",  showlegend = T,
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  #Pie chart
  output$pie = renderPlotly({
    p3 = salaries_data %>% 
      group_by(remote_ratio) %>% 
      summarize(count=n()) %>% 
      plot_ly(labels = ~remote_ratio, values = ~count, type='pie') %>% 
      layout(title = "Pie Chart- Remote work Ratio",  showlegend = T,
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
 #Barplot1
  output$barplot1 = renderPlotly({
    p4 = salaries_data %>% 
      group_by(salaries_data$experience_level) %>% 
      plot_ly(x = salaries_data$experience_level, y = mean(salaries_data$salary_in_usd), type="bar") %>% 
      layout(title = "Bar plot - Experience Level and Average Salaries")
  })
  
  #Barplot2
  output$barplot2 = renderPlotly({
    p5 = salaries_data %>% 
      group_by(salaries_data$employment_type) %>% 
      plot_ly(x = salaries_data$employment_type, y = mean(salaries_data$salary_in_usd), type="bar") %>% 
      layout(title = "Bar plot - Employement Type and Average Salaries")
  })
  
  #Donut Chart 2
  output$donutplot2 = renderPlotly({
    p2 = salaries_data %>% 
      group_by(company_size) %>% 
      summarize(count=n()) %>% 
      plot_ly(labels = ~company_size, values = ~count) %>% 
      add_pie(hole=0.6) %>% 
      layout(title = "Donut charts using Plotly",  showlegend = T,
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  #Pie chart2
  output$pie2 = renderPlotly({
    p3 = salaries_data %>% 
      group_by(remote_ratio) %>% 
      summarize(count=n()) %>% 
      plot_ly(labels = ~remote_ratio, values = ~count, type='pie') %>% 
      layout(title = "Pie Chart- Remote Work Ratio",  showlegend = T,
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  #Barplot3
  output$barplot3 = renderPlotly({
    p4 = salaries_data %>% 
      group_by(salaries_data$experience_level) %>% 
      plot_ly(x = salaries_data$experience_level, y = mean(salaries_data$salary_in_usd), type="bar") %>% 
      layout(title = "Bar plot - Experience Level and Average Salaries")
  })
  
  #Barplot4
  output$barplot4 = renderPlotly({
    p5 = salaries_data %>% 
      group_by(salaries_data$employment_type) %>% 
      plot_ly(x = salaries_data$employment_type, y = mean(salaries_data$salary_in_usd), type="bar") %>% 
      layout(title = "Bar plot - Employement Type and Average Salaries")
  })
  
  #Histogram2
  output$histplot2 = renderPlotly({
    p1 = salaries_data %>% 
      plot_ly() %>% 
      add_histogram(x=~salary_in_usd) %>% 
      layout(xaxis = list(title = paste("Salaries In USD")))
    
    plot2 = salaries_data %>%
      plot_ly() %>%
      add_boxplot(x=~salary_in_usd) %>% 
      layout(yaxis = list(showticklabels = F))
    
    # stacking the plots on top of each other
    subplot(plot2, p1, nrows = 2, shareX = TRUE) %>%
      hide_legend() %>% 
      layout(title = "Distribution chart - Histogram and Boxplot",
             yaxis = list(title="Frequency"))
  })
  
  
}


    
