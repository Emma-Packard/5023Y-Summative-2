
# sourcing scripts 
source("scripts/vis_02.R")

#___________________________----

#included all of the interaction terms, as all seem to be important
# This Lm shows how the change in the crickets weight is affected by multiple variables, includeing there interaction terms

#lsmodel1 ----
lsmodel1<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:starting_mass + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel1 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel1)# seeing the fit of the model,in a image form

drop1(lsmodel1, test = "F")# can look at the AIC, want the smallest AIC
# diet:starting AIC not extremely different

summary(lsmodel1)# a summary of everything
# diet:starting mass not significant >0.05

#_____________________________________________________-----

#lsmodel2----
#removing diet:starting_mass - due to a high p value also the starting mass should not be interacting with diet due to the starting mass already being in place at the start of the experiment

lsmodel2<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum + starting_mass:song_week,data = filter_cricket)

lsmodel2 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel2)# seeing the fit of the model

drop1(lsmodel2, test = "F")# can look at the AIC 

summary(lsmodel2)

#____________________________________----
#droped starting_mass:song_week as not sig 
#lsmodel3----

lsmodel3<- lm(change_in_weight~diet + starting_mass + song_week + pronotum + diet:song_week + diet:pronotum + song_week:pronotum + starting_mass:pronotum,data = filter_cricket)



lsmodel3 %>% 
  broom::tidy(conf.int = F)#add 95% conf intervals

performance::check_model(lsmodel3)# seeing the fit of the model

drop1(lsmodel3, test = "F")# can look at the AIC 

summary(lsmodel3)

#__________________________________________----
# final model ----
# droped starting_mass:pronotum
# everything in this model is significant

nice_filter_cricket <- rename(filter_cricket, "Diet_Percentage" = "diet", "Sexaul_signalling" = "song_week", "Pronotum_size" ="pronotum", "Starting_mass" ="starting_mass","Weight_change" ="change_in_weight")# changing the names to someting nicer for the kable table


lsmodel4<- lm(Weight_change~Diet_Percentage + Starting_mass + Sexaul_signalling + Pronotum_size + Diet_Percentage:Sexaul_signalling + Diet_Percentage:Pronotum_size + Sexaul_signalling:Pronotum_size, data = nice_filter_cricket)

lsmodel4 %>% 
broom::tidy(conf.int = TRUE)# adds confidance intervals


pdf("my_plots_new.pdf")
performance::check_model(lsmodel4)# seeing the fit of the model
dev.off()#

drop1(lsmodel4, test = "F")# can look at the AIC 

summary(lsmodel4)#summary of the model
  
#_____________________----

#statical tests

anova(lsmodel4)

# Df = 1
# f = high amounts of variance in diet, song and pronotum 


summary_table1 <- 
lsmodel4 %>% 
broom::tidy(conf.int = TRUE) %>% 
mutate(p.value = scales::pvalue(p.value)) %>% # changes the pvalues <0.001
  rename("Term"="term",
         "Coefficient" = "estimate", # changing the names to be better
         "Standard Error" = "std.error",
         "t" = "statistic",
         "p value" = "p.value",
          "lower.CI" = "conf.low",
         "upper.CI" = "conf.high")%>%
  mutate(across(c(Coefficient: t), round,5)) %>% 
  kbl(caption = "test") %>% 
  row_spec(c(3,5,7), color = 'white', background = 'purple') %>% 
  row_spec(c(0), italic = TRUE, align = "c") %>% 
  kable_styling() %>% 
  labs(caption = "test")

  
