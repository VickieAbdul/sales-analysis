library(shiny)
library(shinydashboard)
library(dplyr)
library(plotly)

# Load the data 
data <- read.csv("data.csv")



# UI
ui <- dashboardPage(
  dashboardHeader(title = "Sales Dashboard"),
  dashboardSidebar(
    selectInput("month_selector", label = "Select Month:",
                choices = c("All", c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")), selected = "All"),
    hr(),
    checkboxGroupInput("product_selector", label = "Select Products:",
                       choices = unique(data$Product), selected = unique(data$Product))
  ),
  dashboardBody(
    fluidRow(
      column(12,
             box(
               title = "Summary",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               valueBoxOutput("total_customers", width = 3),
               valueBoxOutput("total_products", width = 3),
               valueBoxOutput("total_categories", width = 3),
               valueBoxOutput("total_amount", width = 3)
             )
      )
    ),
    fluidRow(
      column(6,
             box(
               title = "Monthly Sales",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               plotlyOutput("monthly_sales_plot")
             )
      ),
      column(6,
             box(
               title = "Product Distribution Across Categories",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               plotlyOutput("category_plot")
             )
      )
    ),
    fluidRow(
      column(4,
             box(
               title = "Gender Distribution of Customers",
               width = NULL,  
               solidHeader = TRUE,
               status = "primary",
               plotlyOutput("gender_plot")
             )
      ),
      column(4,
             box(
               title = "Category Sales per Gender",
               width = NULL,
               solidHeader = TRUE,
               status = "primary",
               plotlyOutput("gender_cat_plot")
             )
      ),
      column(4,
             box(
               title = "Category Sales per Age",
               width = NULL,
               solidHeader = TRUE,
               status = "primary",
               plotlyOutput("age_prod_plot")
             )
      )
    )
  )
)