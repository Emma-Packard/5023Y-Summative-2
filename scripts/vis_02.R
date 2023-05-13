source("scripts/cleaning_01.R")

# 📊 Exploration Plots ----

GGally::ggpairs(filter_cricket)# everything plot

# how diet affects change in weight ----
ggplot(filter_cricket, 
       aes(x= diet, 
           y= change_in_weight,
           fill=song_week,
           colour=song_week))+
           geom_point()+
geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)
# higher diet percentage, increases the change in weight  


# how diet affects singing ----
ggplot(filter_cricket, 
       aes(x= diet, 
           y= song_week,
           fill=change_in_weight,
           colour=change_in_weight)) +
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)
# increase in diet percentage increases the amount of singing

# how diet affects pronotum size
ggplot(filter_cricket, 
       aes(x= diet, 
           y= pronotum,
           fill=change_in_weight,
           colour=change_in_weight)) +
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)
# diet does not affect starting mass 

#________________________________----

#change in weight and diet ----

# change/ song / diet 
filter_cricket %>% 
ggplot(aes(x=song_week,
           y=change_in_weight,
           colour = factor(diet)))+
geom_point()+
geom_smooth(method = "lm", se = FALSE, fullrange = TRUE) # adding a line of best fit
# as diet % increases so does the change in weight, and the amount of singing increases

# start/change/diet
filter_cricket %>% 
  ggplot(aes(x=starting_mass,
             y=change_in_weight,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)
# weight decreases in the lower diet percentages, the higher the crickets starting mass the more weight the cricket losses 

#diet/ change/ pronotum

filter_cricket %>% 
  ggplot(aes(x= pronotum,
             y=change_in_weight,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)

# increase in weight for the higher food percentages, the smaller the pronotum the bigger increase in weight

#______________________________----

#diet and amount of singing 

filter_cricket %>% 
  ggplot(aes(x= pronotum,
             y=song_week,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)

# amount of singing increase as the pronotum gets bigger, diet isnt affected

filter_cricket %>% 
  ggplot(aes(x= starting_mass,
             y=song_week,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)
# singing increases when the starting mass is higher - diet doesn't seem to affect this 

# starting mass/ change. diet

filter_cricket %>% 
  ggplot(aes(x= starting_mass,
             y= change_in_weight,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)

# the lower the diet percentage, and the higher the starting mass the bigger the change in weight is 
#____________________________----