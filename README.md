# Business Problem: Analyzing Sales Data for a Retail Company
#### Dashboard:
https://victoriaabdul.shinyapps.io/productsalesdashboard/

#### Introduction:
This project addressed a problem faced by a retail company that deals with various products across different categories. They needed to have a web-based interactive dashboard for their stakeholders so that they could monitor monthly sales on-the-go. The company's dataset contains information about customer demographics, product details, sales transactions, and more. The objective is to gain insights into the company's sales performance, customer base, and product popularity. The analysis will be performed using R programming and relevant data visualization techniques.
#### Dataset Creation:
A dataset was generated using R, representing sales data for the year 2022. It includes information such as customer IDs, names, ages, genders, purchase dates, product names, categories, prices, and quantities. The dataset consists of 500 rows, and random generation was used for creating various attributes. However, there were some inconsistencies in product-category mappings, which were addressed by updating the 'Category' column using a predefined mapping.
#### Data Wrangling:
The dataset was subjected to exploratory analysis to understand its structure. This involved examining the first few rows, generating a summary, and inspecting the data types of each column. Additionally, missing values were checked, and the presence of outliers was assessed using a boxplot for the 'Price' column. Two new columns, 'Total_Sales' (Price * Quantity) and 'Month', were added to facilitate further analysis. The 'Month' column values were verified and replaced with corresponding month abbreviations if valid.
#### Data Analysis:
Key metrics for the entire year were calculated. These metrics include total sales amount, total number of customers, total number of products, and total number of categories. The calculated metrics were printed to provide a snapshot of the company's performance in terms of sales and customer engagement.
#### Data Visualization:
Data visualization techniques were employed to present insights visually.

##### Monthly Sales Trend: 
A line plot was created to illustrate the trend in monthly sales. The data was grouped by month, and the total sales for each month were calculated. The resulting line plot shows the fluctuation in sales over the course of the year.

##### Product Distribution Across Categories: 
A bar plot was generated to display the distribution of products across different categories. The data was grouped by category and product, and the count of products in each category was tallied. The bar plot showcases the variety of products in each category.

##### Gender Distribution: 
A pie chart was used to visualize the gender distribution of customers. The data was grouped by gender, and the count of customers for each gender was tallied. The pie chart provides an easy-to-understand representation of the gender distribution.

##### Category Distribution Among Gender: 
A stacked bar plot was created to demonstrate the popularity of different product categories among genders. The data was grouped by gender and category, and the total sales in each category for each gender were summarized. The stacked bar plot highlights the preference for specific categories among different genders.

# Shiny Dashboard Implementation for Sales Analysis

Shiny Dashboard was implemented to address the business problem of analyzing sales data for a retail company. The Shiny Dashboard allows for interactive exploration and visualization of the sales dataset. It provides insights into monthly sales trends, product distribution, customer demographics, and more.

#### Dashboard Components:
User Interface (UI):
The Shiny Dashboard's user interface (UI) comprises various interactive components that users can interact with to explore the sales data. These components include a month selector dropdown and a checkbox group for selecting products. Users can use these controls to filter and customize their view of the data.

#### Server:
The server part of the Shiny Dashboard is responsible for processing user inputs, filtering the data accordingly, and generating visualizations based on the filtered data.

#### Filtered Data:
The server part of the Shiny Dashboard code contains a reactive function called filtered_data(). This function filters the original data based on user inputs from the UI, including the selected month and product choices. This ensures that the visualizations respond dynamically to user interactions.

#### Summary Section:
The Shiny Dashboard also includes a summary section that displays key metrics related to the filtered data. This section showcases the total number of customers, total number of products, total number of categories, and total revenue for the selected data subset.

#### Visualizations:
The Shiny Dashboard includes several interactive visualizations to provide insights into the sales data:
Monthly Sales Plot: Displays the total sales for each month in a bar chart. Users can observe the fluctuations in sales over the course of the year. The data is grouped by month, and the x-axis is customized to display month abbreviations.
Product Distribution Across Categories: Illustrates the distribution of products across different categories using a grouped bar chart. Users can see how various products are distributed within each category.
Gender Distribution of Customers: Presents the gender distribution of customers in a pie chart. Users can visually understand the proportion of customers based on gender.
Category Sales per Gender: Demonstrates the sales distribution of categories among different genders using a grouped bar chart. Users can identify which categories are more popular among specific genders.
Category Sales per Age: Visualizes the sales distribution of categories among different age groups in a stacked bar chart. Users can observe how category preferences vary across different age groups.

#### Conclusion:
The analysis of the sales data and subsequent data visualization provided valuable insights into the company's performance and customer behavior. The generated visualizations assist decision-makers in understanding trends, identifying popular products, and recognizing customer demographics. These insights can inform business strategies, marketing campaigns, and inventory management, ultimately contributing to the company's growth and success. 
The implementation of the Shiny Dashboard enhances the analysis of the sales dataset by allowing users to interactively explore and visualize the data. The dynamic filtering and visualization capabilities enable users to gain insights into various aspects of the company's sales performance, customer demographics, and product distribution. This tool empowers decision-makers to make informed decisions, devise effective strategies, and optimize business operations based on the extracted insights. The Shiny Dashboard's user-friendly interface and interactive visualizations contribute to a more comprehensive and intuitive analysis of the sales data.














