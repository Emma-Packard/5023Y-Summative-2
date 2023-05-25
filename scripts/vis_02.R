source("scripts/cleaning_01.R")
#_______________________________________----

# 📊 Exploration Plots ----

GGally::ggpairs(filter_cricket)# everything plot
#___________________________----

# basic scatter plot 
# change_in_weight/pronotum/sing ✔ ----

weight_pronotum_song_scatter <-  # naming it
ggplot(filter_cricket, # using the filter cricket data set
       aes(x= pronotum,
           y= change_in_weight,
           colour=song_week))+
  geom_point()+
  scale_color_gradient(low = "#AF7AC5", high = "#E74C3C", name ="Sexual signalling (s)")+ # manal colour change 
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE, colour="black")+# colour of the regression line
  theme_classic()+
  labs(x = "Pronotum size (mm)", # labs names
       y = "Weight change (g)")
 
# shows a positive correlation 
#__________________________----

#change in weight/song/diet ----
##facet_wrap/song/change/diet✔ ----
song_change_diet<- 
ggplot(filter_cricket, 
       aes(x= song_week, 
           y= change_in_weight, 
           colour= factor(diet))) + # separated for each diet percentage 
  theme_classic()+ # theme 
  theme(legend.position = "none")+# removes the fig legend
  geom_point()+
  facet_wrap(~ diet)+ # seprate plots for each diet percentage
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE, colour= "#36454F")+ # colour of the lm
  labs(x = "Sexaul signalling",
       y = "Weight change (g)")


#_________________________----
#start/change ✔ ----

start_scatter<- 
  ggplot(filter_cricket, 
         aes(x= starting_mass, 
             y= change_in_weight))+ 
  theme_classic()+ # theme 
  geom_point(colour="#ff77bc")+
  geom_smooth(method = "lm", se = TRUE, fullrange = TRUE, colour= "#36454F")+ #colour of line
  labs(x = "Starting mass (g)", # labs 
       y = "Weight change (g)")

scatter<- ggMarginal(start_scatter, type="histogram", colour="#ff48a5", fill = "#ff77bc") # adds the marginal histograms at the side of the scatter plot


#________________----

#change/pronotum/diet- not used----
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
       y = "Weight change (g)")


# increase in weight for the higher food percentages, the smaller the pronotum the bigger increase in weight

#______________________________----
# mega plot-song/changet/diet ✔ ----
# #dentsity plot and scatter plot


weight_starting_scatterplot1 <- # scatter plot also the main plot
  ggplot(filter_cricket, 
         aes(x= song_week, 
             y= change_in_weight, 
             colour= factor(diet))) +
  scale_color_discrete(name = "Diet Percentage")+# change legend title
  theme_classic()+ # theme
  theme(legend.position = "top")+# removes the fig legend
  geom_point()+
  geom_smooth(method = "lm", se = FALSE, fullrange = TRUE)+
  labs(x = "Sexaul signalling (s)",
       y = "Weight change (g)")


  change_marginal <- 
      filter_cricket %>% 
      ggplot(aes(
        x=change_in_weight,
        colour = factor(diet), # colour with the colour of the different diets
        fill= factor(diet), #fill with the colour of the different diets
        alpha = 0.1, # size
        bandwidth = 175))+ # size
      geom_density()+ # density plot
      theme_void()+ # just the density plot no axis 
      coord_flip()+ # flipping the cords
      theme(legend.position = "none")
        

weight_starting_scatterplot1+change_marginal # order of the plots

