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

# how diet affects starting mass

ggplot(filter_cricket, 
       aes(x= diet, 
           y= starting_mass,
           fill=pronotum,
           colour=pronotum)) +
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)
# diet does not affect starting mass starting mass:pronotum size


# change/ song / diet 
filter_cricket %>% 
ggplot(aes(x=diet,
           y=change_in_weight,
           colour = factor(pronotum)))+
geom_point()+
geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+
scale_colour_brewer("purple")







filter_cricket %>% 
ggplot(aes(x = diet,
           y = pronotum))+
geom_point(colour=diet)+
geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)
#scale_color_manual(values = c())  
  
  
scale_color_brewer(palette="Set1")

      


