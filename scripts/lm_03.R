
# sourcing scripts 
source("scripts/cleaning_01.R")
source("scripts/vis_02.R")

#___________________________----


lsmodel6<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:starting_mass + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel6 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel6)# seeing the fit of the model

drop1(lsmodel6, test = "F")# can look at the AIC 

summary(lsmodel6)



# removing diet:song_week, diet:starting_mass
lsmodel7<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel7 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel7)# seeing the fit of the model

drop1(lsmodel7, test = "F")# can look at the AIC 

summary(lsmodel7)

