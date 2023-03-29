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

# 📊 Exploration Plots ----


filter_cricket %>% 
  ggplot(aes(x = "diet", y = "song_week"))+
  theme_minimal()+
  theme(legend.position = "none")


GGally::ggpairs(filter_cricket)# everything plot


# violin plot to show the how diet affects the change in weight 

graph_01 <- filter_cricket %>% 
  ggplot(aes(x = diet,
             y = change_in_weight,
            fill = diet, 
            colour = diet,
             group= diet))+
  geom_violin(alpha = 0.2)+
  geom_boxplot(width = 0.2,
               alpha = 0.6)+
  theme_classic()+
#  scale_fill_brewer(palette="Dark2")+
  #theme(legend.position = "none")+
  labs(
    x = "diet",
    y = "change in weight",
    title = "",
    subtitle = "")

graph_01 # makes a blue graph see how to make different colours if time 
# get the averges of the different change in weights see if sing if they sang more 
# see if the size of the protounm changes the amount they sing 
# if singing affects the change in wieght - do bigger ones sing more -> also if the bigger sing more do they lose less weight 

# scatter
  
graph_02 <- filter_cricket %>% 
  ggplot(aes(x = song_week,
             y = song_week,
             fill = song_week, 
             colour = song_week,
             group= song_week))+
  geom_violin(alpha = 0.2)+
  geom_boxplot(width = 0.2,
               alpha = 0.6)+
  theme_classic()+
  labs(
    x = "diet",
    y = "change in weight",
    title = "",
    subtitle = "")

 graph_02
# poss mean center it 




model_1 <- lm(change_in_weight~starting_mass+diet+pronotum+song_week,data = filter_cricket)
#poss take out diet or protoumn as they are highly corralted 

summary(model_1)

vif(model_1)# seeing the correlation and how they affect the SE - not highly correlated
# starting mass, is highly corralted with pronotum, from the vif (want less than 5)

performance::check_model(model_1)

ggplot()+
  geom_qq(aes(sample = rstandard(model_1)))+
  geom_abline(colour="purple")
# residuals are nomals dis

shapiro.test(rstandard(model_1))
# p value is signifant, so the residauls are not normals dis

plot(model_1)

png(filename = "img/check_model_1.1.png")
performance::check_model(model_1)
dev.off()




