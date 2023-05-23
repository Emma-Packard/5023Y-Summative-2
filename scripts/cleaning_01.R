# 📦 PACKAGES ----
library(tidyverse) # a range of helpful packages
library(janitor)# helps to format the data
library(kableExtra)#nice tables
library(scales)# scales p values
library(ggExtra)# lets you add marginal density plots or histograms to ggplot2
library(patchwork)# allows for plots to be knitted together
#_________________________________________----

#💾 IMPORTING DATA ----
 
cricket <- read.csv("data/cricket_song.csv")

head(cricket)# checking the data has loaded 

#_________________________________________----
#🔎 CHECKING THE DATA ----


# quickly checking the data frame for errors 
colnames(cricket) # checking new variable names/ seeing what questions i can ask with the data set
str(cricket)# displaying the structure of the data frame - all correct 
glimpse(cricket)# looking at the data/ checking that the data in the correct class


#_________________________________________----

#🧽 CLEANING DATA ---- 

# making all the variables into snake_case
cricket <- janitor::clean_names(cricket)# cleaning column names


# checking for NA's
cricket %>% 
  is.na() %>% 
  sum() # 36 NA's

# a summary of NA
summary_na <- cricket %>%
  summarise(across(everything(), ~sum(is.na(.x)))) # summary of each vector's na as a object

cricket%>% 
  summarise(min=min(song_week1, na.rm=TRUE),# seeing the min
            max=max(song_week1, na.rm=TRUE)) # seeing the max
## can't be a minus ---- fliture /



# filtering out NA's/ minus 

filter_cricket <- cricket %>%   #select the data the want to use later so I don't have all of the variables  
  filter(!is.na(pronotum)) %>%  # filtering out na
  filter(!is.na(mass0)) %>%   # filtering out na
  filter(song_week1>= 0)

# changing the variable names to something nice! ----
# 
filter_cricket <- rename(filter_cricket, "starting_mass"="mass0","change_in_weight"= "delta_smi", "song_week"="song_week1")

view(filter_cricket)
# checking to see of the na and negative removed from ^
filter_cricket %>%
  summarise(across(everything(), ~sum(is.na(.x))))  # summary of each vector's na as a object
  
filter_cricket %>% 
  summarise(min=min(song_week, na.rm=TRUE),# seeing the min
            max=max(song_week, na.rm=TRUE)) # seeing the max




