#imports
library(ggplot2)

#set working directory
setwd("/Users/shannonduffy/Library/CloudStorage/Box-Box/Shannon_Duffy/Writing/Code For Paper Publication/")

#inputs
#read in each watershed's recession points
ws1_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_WS 1.csv")
ws2_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_WS 2.csv")
ws3_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_WS 3.csv")
ws8_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_WS 8.csv")
ws9_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_WS 9.csv")
ws10_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_WS 10.csv")
mc_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_MC.csv")
lo_df<-read.csv("./Intermediate Outputs/recession_Q_vs_dQdt_points_LO.csv")

#create parallel regressions for WS 1 for pre- and post-fire
ws1_df$Fire=as.factor(ws1_df$Fire)
ws1_df$PostFire_numeric=as.numeric(ws1_df$Fire=='Post-fire')
ws1_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = ws1_df)
ws1_n<-nrow(ws1_df)
ws1_r2<-summary(ws1_parallel_model)$adj.r.squared
ws1_B2_F<-anova(ws1_parallel_model)[2,4]
ws1_B2_p<-anova(ws1_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
ws1_prefire<-subset(ws1_df,Fire=='Pre-fire')
ws1_prefire_model<-lm(log_dQdt~log_Q, data = ws1_prefire)
summary(ws1_prefire_model)
ws1_prefire_slope<-coef(ws1_prefire_model)[2]
ws1_prefire_intercept<-coef(ws1_prefire_model)[1]
print(ws1_prefire_intercept)
print(ws1_prefire_slope)
print(confint(ws1_prefire_model))
ws1_prefire_conf<-coef(ws1_prefire_model)[1]-confint(ws1_prefire_model)[1,1]
print(ws1_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
ws1_postfire<-subset(ws1_df,Fire=='Post-fire')
ws1_postfire_model<-lm(log_dQdt ~ 1 + offset(ws1_prefire_slope * log_Q), data = ws1_postfire)
summary(ws1_postfire_model)
ws1_postfire_intercept<-coef(ws1_postfire_model)[1]
print(ws1_postfire_intercept)
print(confint(ws1_postfire_model))
ws1_postfire_conf<-coef(ws1_postfire_model)[1]-confint(ws1_postfire_model)[1,1]
print(ws1_postfire_conf)

#create parallel regressions for WS 2 for pre- and post-fire
ws2_df$Fire=as.factor(ws2_df$Fire)
ws2_df$PostFire_numeric=as.numeric(ws2_df$Fire=='Post-fire')
ws2_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = ws2_df)
ws2_n<-nrow(ws2_df)
ws2_r2<-summary(ws2_parallel_model)$adj.r.squared
ws2_B2_F<-anova(ws2_parallel_model)[2,4]
ws2_B2_p<-anova(ws2_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
ws2_prefire<-subset(ws2_df,Fire=='Pre-fire')
ws2_prefire_model<-lm(log_dQdt~log_Q, data = ws2_prefire)
summary(ws2_prefire_model)
ws2_prefire_slope<-coef(ws2_prefire_model)[2]
print(ws2_prefire_slope)
ws2_prefire_intercept<-coef(ws2_prefire_model)[1]
print(confint(ws2_prefire_model))
ws2_prefire_conf<-coef(ws2_prefire_model)[1]-confint(ws2_prefire_model)[1,1]
print(ws2_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
ws2_postfire<-subset(ws2_df,Fire=='Post-fire')
ws2_postfire_model<-lm(log_dQdt ~ 1 + offset(ws2_prefire_slope * log_Q), data = ws2_postfire)
summary(ws2_postfire_model)
ws2_postfire_intercept<-coef(ws2_postfire_model)[1]
print(confint(ws2_postfire_model))
ws2_postfire_conf<-coef(ws2_postfire_model)[1]-confint(ws2_postfire_model)[1,1]
print(ws2_postfire_conf)

#create parallel regressions for WS 3 for pre- and post-fire
ws3_df$Fire=as.factor(ws3_df$Fire)
ws3_df$PostFire_numeric=as.numeric(ws3_df$Fire=='Post-fire')
ws3_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = ws3_df)
ws3_n<-nrow(ws3_df)
ws3_r2<-summary(ws3_parallel_model)$adj.r.squared
ws3_B2_F<-anova(ws3_parallel_model)[2,4]
ws3_B2_p<-anova(ws3_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
ws3_prefire<-subset(ws3_df,Fire=='Pre-fire')
ws3_prefire_model<-lm(log_dQdt~log_Q, data = ws3_prefire)
summary(ws3_prefire_model)
ws3_prefire_slope<-coef(ws3_prefire_model)[2]
print(ws3_prefire_slope)
ws3_prefire_intercept<-coef(ws3_prefire_model)[1]
print(confint(ws3_prefire_model))
ws3_prefire_conf<-coef(ws3_prefire_model)[1]-confint(ws3_prefire_model)[1,1]
print(ws3_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
ws3_postfire<-subset(ws3_df,Fire=='Post-fire')
ws3_postfire_model<-lm(log_dQdt ~ 1 + offset(ws3_prefire_slope * log_Q), data = ws3_postfire)
summary(ws3_postfire_model)
ws3_postfire_intercept<-coef(ws3_postfire_model)[1]
print(confint(ws3_postfire_model))
ws3_postfire_conf<-coef(ws3_postfire_model)[1]-confint(ws3_postfire_model)[1,1]
print(ws3_postfire_conf)

#create parallel regressions for WS 8 for pre- and post-fire
ws8_df$Fire=as.factor(ws8_df$Fire)
ws8_df$PostFire_numeric=as.numeric(ws8_df$Fire=='Post-fire')
ws8_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = ws8_df)
ws8_n<-nrow(ws8_df)
ws8_r2<-summary(ws8_parallel_model)$adj.r.squared
ws8_B2_F<-anova(ws8_parallel_model)[2,4]
ws8_B2_p<-anova(ws8_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
ws8_prefire<-subset(ws8_df,Fire=='Pre-fire')
ws8_prefire_model<-lm(log_dQdt~log_Q, data = ws8_prefire)
summary(ws8_prefire_model)
ws8_prefire_slope<-coef(ws8_prefire_model)[2]
print(ws8_prefire_slope)
ws8_prefire_intercept<-coef(ws8_prefire_model)[1]
print(confint(ws8_prefire_model))
ws8_prefire_conf<-coef(ws8_prefire_model)[1]-confint(ws8_prefire_model)[1,1]
print(ws8_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
ws8_postfire<-subset(ws8_df,Fire=='Post-fire')
ws8_postfire_model<-lm(log_dQdt ~ 1 + offset(ws8_prefire_slope * log_Q), data = ws8_postfire)
summary(ws8_postfire_model)
ws8_postfire_intercept<-coef(ws8_postfire_model)[1]
print(confint(ws8_postfire_model))
ws8_postfire_conf<-coef(ws8_postfire_model)[1]-confint(ws8_postfire_model)[1,1]
print(ws8_postfire_conf)

#create parallel regressions for WS 9 for pre- and post-fire
ws9_df$Fire=as.factor(ws9_df$Fire)
ws9_df$PostFire_numeric=as.numeric(ws9_df$Fire=='Post-fire')
ws9_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = ws9_df)
ws9_n<-nrow(ws9_df)
ws9_r2<-summary(ws9_parallel_model)$adj.r.squared
ws9_B2_F<-anova(ws9_parallel_model)[2,4]
ws9_B2_p<-anova(ws9_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
ws9_prefire<-subset(ws9_df,Fire=='Pre-fire')
ws9_prefire_model<-lm(log_dQdt~log_Q, data = ws9_prefire)
summary(ws9_prefire_model)
ws9_prefire_slope<-coef(ws9_prefire_model)[2]
print(ws9_prefire_slope)
ws9_prefire_intercept<-coef(ws9_prefire_model)[1]
print(confint(ws9_prefire_model))
ws9_prefire_conf<-coef(ws9_prefire_model)[1]-confint(ws9_prefire_model)[1,1]
print(ws9_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
ws9_postfire<-subset(ws9_df,Fire=='Post-fire')
ws9_postfire_model<-lm(log_dQdt ~ 1 + offset(ws9_prefire_slope * log_Q), data = ws9_postfire)
summary(ws9_postfire_model)
ws9_postfire_intercept<-coef(ws9_postfire_model)[1]
print(confint(ws9_postfire_model))
ws9_postfire_conf<-coef(ws9_postfire_model)[1]-confint(ws9_postfire_model)[1,1]
print(ws9_postfire_conf)

#create parallel regressions for WS 10 for pre- and post-fire
ws10_df$Fire=as.factor(ws10_df$Fire)
ws10_df$PostFire_numeric=as.numeric(ws10_df$Fire=='Post-fire')
ws10_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = ws10_df)
ws10_n<-nrow(ws10_df)
ws10_r2<-summary(ws10_parallel_model)$adj.r.squared
ws10_B2_F<-anova(ws10_parallel_model)[2,4]
ws10_B2_p<-anova(ws10_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
ws10_prefire<-subset(ws10_df,Fire=='Pre-fire')
ws10_prefire_model<-lm(log_dQdt~log_Q, data = ws10_prefire)
summary(ws10_prefire_model)
ws10_prefire_slope<-coef(ws10_prefire_model)[2]
print(ws10_prefire_slope)
ws10_prefire_intercept<-coef(ws10_prefire_model)[1]
print(confint(ws10_prefire_model))
ws10_prefire_conf<-coef(ws10_prefire_model)[1]-confint(ws10_prefire_model)[1,1]
print(ws10_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
ws10_postfire<-subset(ws10_df,Fire=='Post-fire')
ws10_postfire_model<-lm(log_dQdt ~ 1 + offset(ws9_prefire_slope * log_Q), data = ws10_postfire)
summary(ws10_postfire_model)
ws10_postfire_intercept<-coef(ws10_postfire_model)[1]
print(confint(ws10_postfire_model))
ws10_postfire_conf<-coef(ws10_postfire_model)[1]-confint(ws10_postfire_model)[1,1]
print(ws10_postfire_conf)

#create parallel regressions for MC for pre- and post-fire
mc_df$Fire=as.factor(mc_df$Fire)
mc_df$PostFire_numeric=as.numeric(mc_df$Fire=='Post-fire')
mc_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = mc_df)
mc_n<-nrow(mc_df)
mc_r2<-summary(mc_parallel_model)$adj.r.squared
mc_B2_F<-anova(mc_parallel_model)[2,4]
mc_B2_p<-anova(mc_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
mc_prefire<-subset(mc_df,Fire=='Pre-fire')
mc_prefire_model<-lm(log_dQdt~log_Q, data = mc_prefire)
summary(mc_prefire_model)
mc_prefire_slope<-coef(mc_prefire_model)[2]
print(mc_prefire_slope)
mc_prefire_intercept<-coef(mc_prefire_model)[1]
print(confint(mc_prefire_model))
mc_prefire_conf<-coef(mc_prefire_model)[1]-confint(mc_prefire_model)[1,1]
print(mc_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
mc_postfire<-subset(mc_df,Fire=='Post-fire')
mc_postfire_model<-lm(log_dQdt ~ 1 + offset(mc_prefire_slope * log_Q), data = mc_postfire)
summary(mc_postfire_model)
mc_postfire_intercept<-coef(mc_postfire_model)[1]
print(confint(mc_postfire_model))
mc_postfire_conf<-coef(mc_postfire_model)[1]-confint(mc_postfire_model)[1,1]
print(mc_postfire_conf)

#create parallel regressions for LO for pre- and post-fire
lo_df$Fire=as.factor(lo_df$Fire)
lo_df$PostFire_numeric=as.numeric(lo_df$Fire=='Post-fire')
lo_parallel_model<-lm(log_dQdt~log_Q+PostFire_numeric, data = lo_df)
lo_n<-nrow(lo_df)
lo_r2<-summary(lo_parallel_model)$adj.r.squared
lo_B2_F<-anova(lo_parallel_model)[2,4]
lo_B2_p<-anova(lo_parallel_model)[2,5]
#find the pre-fire slope and intercept with confidence interval
lo_prefire<-subset(lo_df,Fire=='Pre-fire')
lo_prefire_model<-lm(log_dQdt~log_Q, data = lo_prefire)
summary(lo_prefire_model)
lo_prefire_slope<-coef(lo_prefire_model)[2]
print(lo_prefire_slope)
lo_prefire_intercept<-coef(lo_prefire_model)[1]
print(confint(lo_prefire_model))
lo_prefire_conf<-coef(lo_prefire_model)[1]-confint(lo_prefire_model)[1,1]
print(lo_prefire_conf)
#find the post-fire intercept and associated confidence intervals, keeping the same slope as pre-fire
lo_postfire<-subset(lo_df,Fire=='Post-fire')
lo_postfire_model<-lm(log_dQdt ~ 1 + offset(lo_prefire_slope * log_Q), data = lo_postfire)
summary(lo_postfire_model)
lo_postfire_intercept<-coef(lo_postfire_model)[1]
print(confint(lo_postfire_model))
lo_postfire_conf<-coef(lo_postfire_model)[1]-confint(lo_postfire_model)[1,1]
print(lo_postfire_conf)

#create data frame of slope and pre- and post-fire intercept and confidence intervals for each watershed
intercept_table<- data.frame(
  WATERSHED = c("WS 1","WS 2","WS 3","WS 8","WS 9","WS 10","MC","LO"),
  Burn_Status = c("Burned","Burned","Unburned","Unburned","Burned","Unburned","Burned","Burned"),
  BFR_Slope = c(ws1_prefire_slope,ws2_prefire_slope,ws3_prefire_slope,ws8_prefire_slope,ws9_prefire_slope,ws10_prefire_slope,mc_prefire_slope,lo_prefire_slope),
  Prefire_Intercept=c(ws1_prefire_intercept,ws2_prefire_intercept,ws3_prefire_intercept,ws8_prefire_intercept,ws9_prefire_intercept,ws10_prefire_intercept,mc_prefire_intercept,lo_prefire_intercept),
  Prefire_Intercept_confidence=c(ws1_prefire_conf,ws2_prefire_conf,ws3_prefire_conf,ws8_prefire_conf,ws9_prefire_conf,ws10_prefire_conf,mc_prefire_conf,lo_prefire_conf),
  Postfire_Intercept=c(ws1_postfire_intercept,ws2_postfire_intercept,ws3_postfire_intercept,ws8_postfire_intercept,ws9_postfire_intercept,ws10_postfire_intercept,mc_postfire_intercept,lo_postfire_intercept),
  Postfire_Intercept_confidence=c(ws1_postfire_conf,ws2_postfire_conf,ws3_postfire_conf,ws8_postfire_conf,ws9_postfire_conf,ws10_postfire_conf,mc_postfire_conf,lo_postfire_conf)
)

intercept_table$pct_change<-100*(intercept_table$Postfire_Intercept-intercept_table$Prefire_Intercept)/abs(intercept_table$Prefire_Intercept)
intercept_table$WATERSHED<-factor(intercept_table$WATERSHED, levels=c("WS 1","WS 2","WS 3","WS 9","WS 10","MC","WS 8","LO"))
write.csv(intercept_table,"./Output Data/BFR_intercepts.csv",row.names = FALSE)

#create data frame of model statistics for each watershed
BFR_model_stats_table<- data.frame(
  WATERSHED = c("WS 1","WS 2","WS 3","WS 8","WS 9","WS 10","MC","LO"),
  Burn_Status = c("Burned","Burned","Unburned","Unburned","Burned","Unburned","Burned","Burned"),
  R2 = c(ws1_r2,ws2_r2,ws3_r2,ws8_r2,ws9_r2,ws10_r2,mc_r2,lo_r2),
  n = c(ws1_n,ws2_n,ws3_n,ws8_n,ws9_n,ws10_n,mc_n,lo_n),
  f = c(ws1_B2_F,ws2_B2_F,ws3_B2_F,ws8_B2_F,ws9_B2_F,ws10_B2_F,mc_B2_F,lo_B2_F),
  p = c(ws1_B2_p,ws2_B2_p,ws3_B2_p,ws8_B2_p,ws9_B2_p,ws10_B2_p,mc_B2_p,lo_B2_p)
)

write.csv(BFR_model_stats_table,"./Output Data/BFR_model_stats.csv",row.names = FALSE)

#create barplot of percent change in intercept by watershed
dev.new()
ggplot(data = intercept_table,aes(x=WATERSHED,y=pct_change,fill = Burn_Status, color=Burn_Status)) +
  geom_col()+ 
  scale_fill_manual(values = c("grey","white"))+
  scale_color_manual(values=c("black","black"))+
  xlab("")+
  ylab("% Change in Intercept")+
  theme_bw()+
  theme(legend.text=element_text(color="black",size=12),axis.text=element_text(color="black",size=12),text=element_text(size=12,color = "black"),legend.title=element_blank(),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),legend.position="top")+
  ylim(c(-75,25))+
  geom_hline(yintercept=0,color="black")
dev.off()

ggsave(
  filename = "./Output Figures/Intermediate Figures/BFR_intercept_barchart.png",
  width = 6.5,
  height = 2.5,
  units = "in",
  dpi = 300
)
