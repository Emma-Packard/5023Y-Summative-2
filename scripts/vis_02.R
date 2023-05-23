source("scripts/cleaning_01.R")
#_______________________________________----

# 📊 Exploration Plots ----

GGally::ggpairs(filter_cricket)# everything plot
glimpse(filter_cricket)
#___________________________----

# basic scatter plot 
# change_in_weight/pronotum----

ggplot(filter_cricket, 
       aes(x= pronotum, 
           y= change_in_weight)) +
  geom_point()+
  labs(x = "Pronotum size (mm)",
       y = "Weight change (g)",
       caption = "test")
   
# shows a positive correlation 
#__________________________----

#change in weight and diet ----

##change/ song / diet/facet ----
filter_cricket %>% 
ggplot(aes(x=song_week,
           y=change_in_weight,
           colour = factor(diet)))+ # diet as 
geom_point()+
geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+ # adding a line of best fit
labs(x = "Sexaul signalling",
       y = "Weight change (g)",
       caption = "test")
# as diet % increases so does the change in weight, and the amount of singing increases

##facet_wrap/song/change/diet✔ ----
song_change_diet<- 
ggplot(filter_cricket, 
       aes(x= song_week, 
           y= change_in_weight, 
           colour= factor(diet))) + # separated for each diet percentage 
  theme_classic()+ # theme 
  theme(legend.position = "none")+# removes the fig legend
  geom_point()+
  facet_wrap(~ diet)+
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE, colour= "#36454F")+
  labs(x = "Sexaul signalling",
       y = "Weight change (g)",
       caption = "test")




#_________________________----

#start/change/diet----
##start/change/diet/scatter ----
scatter_starting <- 
filter_cricket %>% 
  ggplot(aes(x=starting_mass,
             y=change_in_weight,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+
  labs(x = "Starting Mass (g)",
       y = "Weight change (g)",
       caption = "test")
# weight decreases in the lower diet percentages, the higher the crickets starting mass the more weight the cricket losses 

##start/change/diet/facet ----
facet_starting <- 
ggplot(filter_cricket, 
       aes(x= starting_mass, 
           y= change_in_weight, 
           colour= factor(diet))) + # separated for each diet percentage 
  theme_classic()+ # theme 
  theme(legend.position = "none")+# removes the fig legend
  geom_point()+
  facet_wrap(~ diet)+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+
  labs(x = "Starting Mass (g)",
       y = "Weight change (g)",
       caption = "test")
#_________________________----
#change/pronotum/diet----
##change/pronotum/diet/facet ----

filter_cricket %>% 
  ggplot(aes(x= pronotum,
             y=change_in_weight,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+
  

# increase in weight for the higher food percentages, the smaller the pronotum the bigger increase in weight

#______________________________----

# starting mass/change/diet ----
##starting mass/change/diet/facet ----

filter_cricket %>% 
  ggplot(aes(x= starting_mass,
             y= change_in_weight,
             colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)

# the lower the diet percentage, and the higher the starting mass the bigger the change in weight is 

#_________________ ----

# mega plot-song/changet/diet ----
# #dentsity plot and scatter plot

weight_starting_scatterplot2 <- # creating a name 
  ggplot(filter_cricket, 
         aes(x= song_week, 
             y= change_in_weight, 
             colour= factor(diet))) +
  theme_classic()+
  theme(legend.position = "none")+# removes the fig legend
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)


change_marginal <- 
  filter_cricket %>% 
  ggplot(aes(
    x=change_in_weight,
    colour = factor(diet), 
    fill= factor(diet), 
    alpha = 0.1,
    bandwidth = 175))+
  geom_density()+
  theme_void()+
  coord_flip()+
  scale_alpha(guide = 'none') # removes the alpha legend  


song_marginal <- 
  filter_cricket %>% 
  ggplot(aes(
    x=song_week,
    colour = factor(diet), 
    fill= factor(diet), 
    alpha = 0.1,
    bandwidth = 175))+
  geom_density()+
  theme_void()+
  theme(legend.position = "none")# removes the fig legend



layout <- "
AA#
BBC
BBC"


song_marginal+weight_starting_scatterplot2+change_marginal+ # order of plots is important
  plot_layout(design=layout)

# change labs, including factor(diet)
# plot themes /

