library(rvest)
library(tidyverse)

#data scraping 
df_list  <- list()

# Loop through numbers from 1 to 28
for (i in 1:776) {
  # Create the variable name
  webpage <- read_html(paste0("https://www.property24.com/houses-for-sale/western-cape/9/p", i,"?sp=pf%3d50000%26pt%3d300000000%26eszf%3d10%26eszt%3d8000%26bd%3d1%26so%3dPriceLow"))
  #title
  title <- html_nodes(webpage,'.p24_title')%>% 
    html_text() %>% 
    {if(length(.) == 0) NA else .}
  #price
  price_html = html_nodes(webpage, '.p24_price')
  price =  gsub('\r\n','',gsub(' ', '',html_text(price_html)))%>% 
    {if(length(.) == 0) NA else .}
  price <- price[grep("^R", price)]
  #address
  address <-  html_nodes(webpage,'.p24_address')%>% 
    html_text() %>% 
    {if(length(.) == 0) NA else .}
  
  #location
  location <- html_nodes(webpage, '.p24_location')%>% 
    html_text() %>% 
    {if(length(.) == 0) NA else .}
  #size
  size <-  html_nodes(webpage,'.p24_size span')%>% 
    html_text() %>% 
    {if(length(.) == 0) NA else .}
  #bathroom
  nodes <- html_nodes(webpage, '.p24_featureDetails')
  titles <- html_attr(nodes, "title")
  bathroom_nodes <- nodes[titles == "Bathrooms"]
  bathroom_nodes %>%
    html_text()
  bathroom <-  html_nodes(webpage,'.p24_featureDetails:nth-child(2) span')%>% 
    html_text() %>% 
    {if(length(.) == 0) NA else .}
  #bedroom
  bedroom <- html_nodes(webpage,'.p24_featureDetails:nth-child(1) span')%>% 
    html_text() %>% 
    {if(length(.) == 0) NA else .}
  #parking
  parking <- html_nodes(webpage,'.p24_featureDetails:nth-child(3) span')%>% 
    html_text() %>% 
    {if(length(.) == 0) NA else .}
  # Assign a value to the variable (you can modify this line to set different values if needed)
  # title_list[[i]] <- title
  # address_list[[i]] <- address
  # location_list[[i]] <- location
  # price_list[[i]] <- price
  # bedroom_list[[i]] <- bedroom
  # bathroom_list[[i]] <- bathroom
  # parking_list[[i]] <- parking
  # size_list[[i]] <- size
  
  # Try to add the vector as a new row
  tryCatch({
    # Create a data frame from the current vector
    # new_row <- as.data.frame(t(current_vector), stringsAsFactors = FALSE)
    
    # Ensure the new row has the correct number of columns
    if (length(price) != length(bedroom)) {
      stop("Vector length does not match the number of columns in the data frame.")
    }
    
    # Add the new row to the combined data frame
    df_list[[i]] <-tibble(location, price, bedroom, size)
    
  }, error = function(e) {
    # Print the error message and skip to the next iteration
    message("Skipping vector ", i, ": ", e$message)
  })
  
  
}

full_df <- bind_rows(df_list)

save(full_df, file = "C:/Users/01452743.WF/OneDrive - University of Cape Town/Personal projects/Property 24/full_df.RData")