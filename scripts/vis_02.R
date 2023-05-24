source("scripts/cleaning_01.R")
#_______________________________________----

# 📊 Exploration Plots ----

GGally::ggpairs(filter_cricket)# everything plot
#___________________________----

# basic scatter plot 
# change_in_weight/pronotum/sing ✔ ----

weight_pronotum_song_scatter <-  
ggplot(filter_cricket, 
       aes(x= pronotum, 
           y= change_in_weight,
           colour=song_week))+
  geom_point()+
  scale_color_gradient(low = "#AF7AC5", high = "#E74C3C", name ="Sexual signalling (s)")+ 
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE, colour="black")+
  theme_classic()+
  labs(x = "Pronotum size (mm)",
       y = "Weight change (g)",
       caption = "test")
 
# shows a positive correlation 
#__________________________----

#change in weight/song/diet ----

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
#start/change ✔ ----


start_scatter<- 
  ggplot(filter_cricket, 
         aes(x= starting_mass, 
             y= change_in_weight))+ 
  theme_classic()+ # theme 
  geom_point(colour="#ff77bc")+
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE, colour= "#36454F")+
  labs(x = "Starting mass (g)",
       y = "Weight change (g)",
       caption = "test")

scatter<- ggMarginal(start_scatter, type="histogram", colour="#ff48a5", fill = "#ff77bc")


#________________----
#start/change/diet_NOT----
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
pronotum_diet <- 
  filter_cricket %>% 
  ggplot(aes(x=pronotum,
             y=change_in_weight,
             colour = factor(diet)))+ # diet as 
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+ # adding a line of best fit
  theme_classic()+ # theme 
  labs(x = "Pronotum Size",
       y = "Weight change (g)",
       caption = "test")

##change/pronotum/diet/facet_wrap ✔ ----
facet_pronotum_diet <- 
  ggplot(filter_cricket, 
         aes(x= pronotum, 
             y= change_in_weight, 
             colour= factor(diet))) + # separated for each diet percentage 
  theme_classic()+ # theme 
  theme(legend.position = "none")+# removes the fig legend
  geom_point()+
  facet_wrap(~ diet)+
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE, colour= "#36454F")+
  labs(x = "Pronotum Size (mm)",
       y = "Weight change (g)",
       caption = "test")


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

# mega plot-song/changet/diet ✔ ----
# #dentsity plot and scatter plot


weight_starting_scatterplot1 <- # creating a name 
  ggplot(filter_cricket, 
         aes(x= song_week, 
             y= change_in_weight, 
             colour= factor(diet))) +
  scale_color_discrete(name = "Diet Percent")+# change legend title
  theme_classic()+
  theme(legend.position = "top")+# removes the fig legend
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+
  labs(x = "Sexaul signalling (Sec)",
       y = "Weight change (g)",
       caption = "test")


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
      theme(legend.position = "none")
        

weight_starting_scatterplot1+change_marginal # order of the plots



# change labs, including factor(diet)
# plot themes /

#_____________________----
