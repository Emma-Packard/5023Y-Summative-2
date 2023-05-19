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
scatter_starting <- 
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
 
# starting mass/ change. diet

filter_cricket %>% 
  ggplot(aes(x= starting_mass,
             y= change_in_weight))+
             #colour = factor(diet)))+
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)

# the lower the diet percentage, and the higher the starting mass the bigger the change in weight is 
# 
#____________________________----

#_____________________________
#dentsity plot test one

weight_starting_scatterplot <- 
  ggplot(filter_cricket, 
         aes(x= starting_mass, 
             y= change_in_weight)) +
  geom_point()

starting_mass_marginal<-# density plot that will be at the side of the graph
  filter_cricket%>%  
  ggplot()+
  geom_density(aes(x=starting_mass), fill="purple")+
  theme_void()


change_in_weight_marginal <- # density plot that is at the side of the plot
  filter_cricket %>% 
  ggplot()+
  geom_density(aes(x=change_in_weight), fill="green")+
  theme_void()+
  coord_flip()

layout <- "
AA#
BBC
BBC"


starting_mass_marginal+weight_starting_scatterplot+change_in_weight_marginal+ # order of plots is important
  plot_layout(design=layout)

#_________________

#no_0 <- filter_cricket %>% 
#  filter(song_week>0)# removed 0s for this plot as a test

weight_starting_scatterplot2 <- 
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

#____________________________----


ggplot(filter_cricket, 
       aes(x= song_week, 
           y= change_in_weight, 
           colour= factor(diet))) +
  theme_classic()+
  theme(legend.position = "none")+# removes the fig legend
  geom_point()+
  facet_wrap(~ diet)+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)