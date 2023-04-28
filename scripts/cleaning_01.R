# 📦 PACKAGES ----
library(tidyverse) # a range of helpful packages
library(janitor) # helps to format the data
library(car)
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

# check for duplication
#cricket %>% 
#  duplicated() %>% 
#  sum() # none can remove ----

# checking for NA's
cricket %>% 
  is.na() %>% 
  sum() # 36 NA's

# a summary of NA
summary_na <- cricket %>%
  summarise(across(everything(), ~sum(is.na(.x)))) # summary of each vector's na as a object

# SUMMARISE TO MAKE CALCULATIONS LATER?? ---
#cricket%>% 
#  summarise(min=min(diet, na.rm=TRUE), # seeing the min
#            max=max(diet, na.rm=TRUE)) # seeing the max


#cricket%>% 
#  summarise(min=min(pronotum, na.rm=TRUE),# seeing the min
 #           max=max(pronotum, na.rm=TRUE)) # seeing the max

#cricket%>% 
 # summarise(min=min(mass0, na.rm=TRUE),# seeing the min
 #           max=max(mass0, na.rm=TRUE)) # seeing the max
# mass at the start of the experiment 

#cricket%>% 
 # summarise(min=min(delta_smi, na.rm=TRUE),# seeing the min
 #           max=max(delta_smi, na.rm=TRUE)) # seeing the max
# - is reduction in weight 

cricket%>% 
  summarise(min=min(song_week1, na.rm=TRUE),# seeing the min
            max=max(song_week1, na.rm=TRUE)) # seeing the max
## can't be a minus ---- filture /

# filtering out NA's/ minus 

filter_cricket <- cricket %>%   #select the data the want to use later so I don't have all of the variables  
  filter(!is.na(pronotum)) %>%  # filtering out na
  filter(!is.na(delta_smi)) %>%   # filtering out na
  filter(song_week1>= 0)

# checking to see of the na and negative removed from ^
filter_cricket %>%
  summarise(across(everything(), ~sum(is.na(.x))))  # summary of each vector's na as a object
  
filter_cricket %>% 
  summarise(min=min(song_week1, na.rm=TRUE),# seeing the min
            max=max(song_week1, na.rm=TRUE)) # seeing the max


# change the variable names to something nice! ----

filter_cricket <- rename(filter_cricket, "starting_mass"="mass0", "change_in_weight" = "delta_smi", "song_week"="song_week1")

#_______________________________________----
# 📊 Exploration Plots ----

GGally::ggpairs(filter_cricket)# everything plot


ggplot(filter_cricket, 
       aes(x= pronotum, 
           y= change_in_weight)) +
  geom_point()
# shows a positive correlation 

# scatter plot ----

ggplot(filter_cricket, 
       aes(x= song_week, 
           y= change_in_weight,
           fill= starting_mass,
           colour= starting_mass)) +
  geom_point()
# shows a positive correlation


# mean centre
# remove the outliers 
# line of best fit
# make the masses the same, so you are actualing finding the masses are the same
# histogram

#_____________________________________----



