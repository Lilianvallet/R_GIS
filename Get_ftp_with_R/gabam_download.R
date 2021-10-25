library(curl)

gabam_download <- function(year, cell, dest){
  for(y in year){
    for(c in cell){
      url <- paste0("ftp://124.16.184.141/GABAM/burned%20area/",
                    as.character(y),"/",c,".TIF") #ftp server 1
      dest2 <- paste0(dest,as.character(y),"_",c)
      h <- new_handle(url = url)
      multi_add(h, data=dest2)
    }
  }
  multi_run()
}




# Example: 4 cells for 10 years

example_year <- 2010:2020
example_cell <- c("N40E000", "N40E010", "N50E000", "N50E010")
example_dest <- "C:/Users/33651/Desktop/test_GABAM/"

system.time({gabam_download(example_year, example_cell, example_dest)})
#runtime = 18m33s 
