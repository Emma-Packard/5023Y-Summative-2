
# sourcing scripts 
source("scripts/cleaning_01.R")
source("scripts/vis_02.R")

#___________________________----

# included all of the interaction terms, as all seem to be important
# This Lm shows how the change in the crickets weight is affected by multiple variables, includeing there interaction terms

lsmodel1<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:starting_mass + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel1 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel9)# seeing the fit of the model,in a image form

drop1(lsmodel1, test = "F")# can look at the AIC, want the smallest AIC
# diet:starting AIC not extremely different

summary(lsmodel1)# a summary of everything
# diet:starting mass not significant >0.05

#_____________________________________________________-----

#lsmodel
#removing diet:starting_mass - due to a high p value also the starting mass should not be interacting with diet due to the starting mass already being in place at the start of the experiment

lsmodel2<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel2 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel2)# seeing the fit of the model

drop1(lsmodel2, test = "F")# can look at the AIC 

summary(lsmodel2)


#droped starting_mass:song_week

lsmodel3<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum,data = filter_cricket)



lsmodel3 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel3)# seeing the fit of the model

drop1(lsmodel3, test = "F")# can look at the AIC 

summary(lsmodel3)


# final model
# droped starting_mass:pronotum

lsmodel4<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum, data = filter_cricket)


lsmodel4 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

pdf("my_plots_new.pdf")
performance::check_model(lsmodel4)# seeing the fit of the model
dev.off()

drop1(lsmodel4, test = "F")# can look at the AIC 

summary(lsmodel4)

# look at lecture on what to do left this is the perfect model ;)
# 
# 
# 
View(filter_cricket)
