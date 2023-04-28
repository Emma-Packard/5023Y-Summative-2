source("scripts/cleaning_01.R")

# 📊 Exploration Plots ----

GGally::ggpairs(filter_cricket)# everything plot


ggplot(filter_cricket, 
       aes(x= diet, 
           y= change_in_weight,
           fill=song_week,
           colour=song_week))+
           geom_point()
# shows no corralation
# scatter plot ----
ggplot(filter_cricket, 
       aes(x= diet, 
           y= song_week,
           fill=change_in_weight,
           colour=change_in_weight)) +
  geom_point()
#no colation 


# mean centre
# remove the outliers 
# line of best fit
# make the masses the same, so you are actualing finding the masses are the same
# histogram





#_____________________________________----
