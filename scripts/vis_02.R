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
# LM for diet and change in weight

lsmodel1 <- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:starting_mass + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week, data = filter_cricket)


lsmodel1 %>% # summary, including conf,int 
  broom::tidy(conf.int = T) # 95% conf. int
#song_week, pronotum, diet:starting mass, song_week:pronotum, starting_mass:pronotum and starting_mass:song - are not signiifcant 

# performance check
pdf("check_lsmodel1.pdf")
performance::check_model(lsmodel1)
dev.off() # seeing the fit of the model 

#AIC 
drop1(lsmodel1, test = "F")
step(lsmodel1, direction = "both", method="AIC", trace = TRUE)
# removing diet:song_week, due to the highest AIC 

lsmodel2 <- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:starting_mass + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week, data = filter_cricket)

pdf("check_lsmodel2.pdf")
performance::check_model(lsmodel1)
dev.off() # seeing the fit of the model 


# removing the 15 instead 
lsmodel1 <- lm(change_in_weight~diet + starting_mass + song_week + pronotum +diet:song_week + diet:pronotum, data = filter_cricket)

pdf("check_lsmodel3.pdf")
performance::check_model(lsmodel1)
dev.off() # seeing the fit of the model 


drop1(lsmodel3, test = "F")
step(lsmodel3, direction = "both", method="AIC", trace = TRUE)

lsmodel3 %>% # summary, including conf,int 
  broom::tidy(conf.int = T) 

#dropping starting_mass as it has the lowest AIC
lsmodel4 <- lm(change_in_weight~diet+ song_week + pronotum +diet:song_week + diet:pronotum, data = filter_cricket)

lsmodel4 %>% # summary, including conf,int 
  broom::tidy(conf.int = T)

drop1(lsmodel4, test = "F")
step(lsmodel4, direction = "both", method="AIC", trace = TRUE)

pdf("check_lsmodel4.pdf")
performance::check_model(lsmodel4)
dev.off() # seeing the fit of the model 

# dropping diet:pronotum

lsmodel5 <- lm(change_in_weight~diet+ song_week + pronotum +diet:song_week,  data = filter_cricket)

pdf("check_lsmodel5.pdf")
performance::check_model(lsmodel5)
dev.off() # seeing the fit of the model 

drop1(lsmodel5, test = "F")
step(lsmodel5, direction = "both", method="AIC", trace = TRUE)

lsmodel6 <- lm(change_in_weight~diet+ song_week + pronotum +diet:song_week,  data = filter_cricket)

#_______________________________

