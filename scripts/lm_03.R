
# sourcing scripts 
source("scripts/cleaning_01.R")
source("scripts/vis_02.R")

#___________________________----


lsmodel6<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:starting_mass + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel6 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel6)# seeing the fit of the model

drop1(lsmodel6, test = "F")# can look at the AIC 
# these looked different form the others 
# diet:song_week f= 5.3102, df=526,1, p=0.02159
# diet:pronotum f = 4.9192, df=526,1, p=0.02699
summary(lsmodel6)



# removing diet:song_week, diet:starting_mass
lsmodel7<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel7 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel7)# seeing the fit of the model

drop1(lsmodel7, test = "F")# can look at the AIC 

summary(lsmodel7)
#diet:pronotum f=14.3365



#dropping diet:pronotum from the model

lsmodel8<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel8 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel8)# seeing the fit of the model

drop1(lsmodel8, test = "F")# can look at the AIC 

summary(lsmodel8)

# dropped the wrong ones - starting again -

lsmodel9<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:starting_mass + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel9 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel9)# seeing the fit of the model

drop1(lsmodel9, test = "F")# can look at the AIC 

summary(lsmodel9)

#removing diet and starting_mass - due to a high p value

lsmodel10<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel10 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel10)# seeing the fit of the model

drop1(lsmodel10, test = "F")# can look at the AIC 

summary(lsmodel10)


#droped starting_mass:song_week

lsmodel11<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum,data = filter_cricket)



lsmodel11 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel11)# seeing the fit of the model

drop1(lsmodel11, test = "F")# can look at the AIC 

summary(lsmodel11)


# droped starting_mass:pronotum

lsmodel12<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum, data = filter_cricket)


lsmodel12 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel12)# seeing the fit of the model

drop1(lsmodel12, test = "F")# can look at the AIC 

summary(lsmodel12)

