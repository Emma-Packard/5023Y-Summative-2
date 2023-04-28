#model_1 <- lm(change_in_weight~starting_mass+diet+pronotum+song_week,data = filter_cricket)
#poss take out diet or protoumn as they are highly corralted 

#summary(model_1)

#vif(model_1)# seeing the correlation and how they affect the SE - not highly correlated
# starting mass, is highly corralted with pronotum, from the vif (want less than 5)

#performance::check_model(model_1)

#ggplot()+
#  geom_qq(aes(sample = rstandard(model_1)))+
#  geom_abline(colour="purple")
# residuals are nomals dis

#shapiro.test(rstandard(model_1))
# p value is signifant, so the residauls are not normals dis

#plot(model_1)

#png(filename = "img/check_model_1.1.png")
#performance::check_model(model_1)
#dev.off()





# violin plot to show the how diet affects the change in weight 

graph_01 <- filter_cricket %>% 
  ggplot(aes(x = diet,
             y = change_in_weight,
             fill = diet, 
             colour = diet,
             group= diet))+
  geom_violin(alpha = 0.2)+
  geom_boxplot(width = 0.2,
               alpha = 0.6)+
  theme_classic()+
  labs(
    x = "diet",
    y = "change in weight",
    title = "",
    subtitle = "")

graph_01 # makes a blue graph see how to make different colours if time 
# get the averges of the different change in weights see if sing if they sang more 

graph_02 <- filter_cricket %>% 
  ggplot(aes(x= song_week, 
             y= change_in_weight,
             fill= starting_mass,
             colour=starting_mass))+
  geom_boxplot()+
  geom_jitter()
graph_02  

