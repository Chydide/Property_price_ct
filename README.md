
# Cape Town Property Analysis
This project analyzes property prices across different neighborhoods in Cape Town, highlighting variations in average property prices, the number of bedrooms, erf sizes, and property counts for various areas. The analysis helps to identify trends and provides insights into housing affordability, spatial characteristics, and socio-economic aspects of Cape Town's real estate market.

## Table of Contents
- Introduction
- Data Overview
- Project Objectives
- Methodology
- Installation
- Usage
- Results
- Technologies Used
- Contributing
- License
  
### Introduction
Cape Town's property market exhibits a significant range in property prices across different neighborhoods, influenced by factors such as location, amenities, and socio-economic conditions. This project aims to analyze these variations to provide a better understanding of the city's real estate dynamics.

### Data Overview
The dataset used includes information on:
- Average property price per area.
- Average number of bedrooms per property.
- Average erf size (in square meters).
- Number of properties analyzed per area.

The dataset covers multiple areas, including the Atlantic Seaboard, Cape Flats, City Bowl, Northern Suburbs, and more.

### Project Objectives
Understand property price variations across Cape Town neighborhoods.
Analyze the relationship between price, number of bedrooms, and erf size.
Identify which areas are more affordable versus which areas are more expensive.
### Methodology
- Data Collection:

The dataset used for this analysis contains property information for various neighborhoods in Cape Town which obtained through web scraping of the property 24 website. The data for this project was collected using web scraping techniques through the rvest library in R. The first step involved defining the target URLs for property listings and reading the HTML content using the read_html() function. Key elements, such as property titles, prices, and the number of bedrooms, were extracted by identifying appropriate CSS selectors or XPath expressions. The html_nodes() and html_text() functions were used to locate and extract the necessary data, ensuring that all relevant information was collected from the web pages.

- Data Cleaning and Preprocessing:
Following data extraction, significant efforts were made to clean and preprocess the collected information to make it suitable for analysis. This process included removing unwanted characters (such as currency symbols and commas) from property prices and bedroom counts, converting these values to numeric data types. Missing values were also identified and handled, either by replacing them with appropriate statistics (such as the median) or by removing incomplete entries to maintain the integrity of the dataset. Additional transformations were applied, such as calculating price per bedroom and categorizing properties into different price ranges, to provide more insightful features for the analysis.

Access the data scraping and pre-processing code : https://github.com/Chydide/Property_price_ct/blob/main/Data%20scraping.R

- Exploratory Data Analysis (EDA):

Visualizing differences in property prices, erf sizes, and average number of bedrooms across areas.

Creating summary reports for each neighborhood.

Access this report: https://chydide.github.io/Property_price_ct/


r
Copy code
rmarkdown::render("Vizualisation on property 24.Rmd")
Results
Atlantic Seaboard is the most expensive region, with an average property price of R18.8 million.
Cape Flats is among the most affordable areas, with an average price of R1.5 million.
Southern Suburbs and City Bowl feature mid-range property prices, suitable for families and young professionals.
Key findings are presented through summary tables and visualizations to give insights into affordability and spatial differences across Cape Town.
Technologies Used
R: Data scraping, visualization, and markdown reporting.
rvest: For data scraping information from the web
RMarkdown: To create a dynamic report for the findings.
ggplot2: To generate visualizations for analyzing property data.

Contributing
Contributions are welcome! If you have ideas for improving the analysis, feel free to fork the repository, create a branch, and submit a pull request. Please make sure that your contributions align with the project objectives.

License
This project is licensed under the MIT License. See the LICENSE file for more details.


