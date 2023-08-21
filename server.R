# Load the data 
data <- read.csv("data.csv")

# Server
server <- function(input, output) {
  filtered_data <- reactive({
    data %>%
      filter(if (input$month_selector == "All") TRUE else Month == input$month_selector) %>%
      filter(if (length(input$product_selector) == 0) TRUE else Product %in% input$product_selector)
  })
  
  output$data_table <- renderDataTable({
    filtered_data()
  })
  
  output$total_customers <- renderValueBox({
    valueBox(
      formatC(n_distinct(filtered_data()$CustomerID), format = "d"),
      paste("Customers"),
      icon = icon("users"),
      color = "blue",
      width = 4)  
  })
  
  output$total_products <- renderValueBox({
    valueBox(
      value = n_distinct(filtered_data()$Product),
      subtitle = "Products",
      icon = icon("barcode"),
      color = "green",
      width = 4)
    
  })
  
  output$total_categories <- renderValueBox({
    valueBox(
      value = n_distinct(filtered_data()$Category),
      subtitle = "Categories",
      icon = icon("th-large"),
      color = "blue",
      width = 4)
    
  })
  
  output$total_amount <- renderValueBox({
    total <- sum(filtered_data()$Price * filtered_data()$Quantity)
    valueBox(
      value = formatC(total, format = "d", big.mark = ','),
      subtitle = "Total Revenue",
      icon = icon("usd"),
      color = "orange",
      width = 4)
    
  })
  
  
  output$monthly_sales_plot <- renderPlotly({
    monthly_sales <- filtered_data() %>%
      group_by(Month) %>%
      summarise(TotalSales = sum(Price * Quantity)) %>%
      arrange(Month)  # Arrange the data by Month
    
    monthly_sales$Month <- factor(monthly_sales$Month, 
                                  levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")) 
    
    plot_ly(monthly_sales, 
            x = ~Month, 
            y = ~TotalSales, 
            type = "bar") %>%
      layout(
        #title = "Monthly Sales",
        xaxis = list(title = ""),
        yaxis = list(title = "Total Sales")
        
      )
    
  })
  
  output$category_plot <- renderPlotly({
    product_category_dist <- filtered_data() %>%
      group_by(Category, Product) %>%
      tally()
    plot_ly(data = product_category_dist, 
            x = ~Category, 
            y = ~n, 
            type = "bar", 
            color = ~Product,
            colors = "Accent") %>%
      layout(
        #title = "Product Distribution Across Categories",
        xaxis = list(title = ""),
        yaxis = list(title = "Count"),
        legend = list(orientation = "v", x = 1.1, y = 0.5),
        barmode = "stack")
    
    
  })
  
  output$gender_plot <- renderPlotly({
    gender_distribution <- filtered_data() %>%
      group_by(Gender) %>%
      tally()
    
    plot_ly(data = gender_distribution, 
            labels = ~Gender,
            values = ~n, 
            type = "pie",
            marker = list(colors = c("orange", "royalblue"))) %>%
      layout(
        #title = "Gender Distribution of Customers",
        showlegend = TRUE,
        legend = list(orientation = "v", x = 1.1, y = 0.5)
      )
    
  })
  
  output$gender_cat_plot <- renderPlotly({
    gender_cat <- filtered_data() %>%
      group_by(Gender, Category) %>%
      summarise(totalsales = sum(Total_Sales), .groups = "drop")
    
    
    plot_ly(gender_cat, 
            x = ~Gender, 
            y = ~totalsales, 
            color = ~Category, 
            colors = "PuBuGn", 
            type = "bar",
            marker = list(line = list(width = 2))) %>%
      layout(
        #title = "Category Distribution Among Gender",
        xaxis = list(title = ""),
        yaxis = list(title = "Total Sales"),
        barmode = "group",
        legend = list(orientation = "v", x = 1.1, y = 0.5)
      )
  }) 
  output$age_prod_plot <- renderPlotly({
    age_prod <- filtered_data() %>%
      group_by(Age, Category) %>%
      summarise(totalsales = sum(Total_Sales), .groups = "drop")
    
    plot_ly(age_prod,
            x = ~Age,
            y = ~totalsales,
            color = ~Category,
            colors = "PuBuGn",
            type = "bar",
            marker = list(line = list(width = 2))) %>%
      layout(
        title = "",
        xaxis = list(title = "Age"),
        yaxis = list(title = "Total Sales"),
        barmode = "stack",
        legend = list(orientation = "v", x = 1.1, y = 0.5)
        
      )
  })
  
}



