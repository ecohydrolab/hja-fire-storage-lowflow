#imports
library(stats)
library(ggplot2)
library(reshape2)

#set working directory
setwd("/Users/shannonduffy/Library/CloudStorage/Box-Box/Shannon_Duffy/Writing/Code For Paper Publication/")

#inputs
#read in low flows file
q5 <- read.csv("./Intermediate Outputs/5thPercentileFlows_nofall_2000_2025.csv")

#trim to recent prefire period
pre_holiday_q5<- subset(q5, WATERYEAR > 1999)
pre_holiday_q5<- subset(pre_holiday_q5, WATERYEAR < 2021)
pre_holiday_q5<-pre_holiday_q5[c("WATERYEAR","GSWS01","GSWS02","GSWS03","GSWS09","GSWS10")]
pre_lookout_q5<- subset(q5, WATERYEAR > 1999)
pre_lookout_q5<- subset(pre_lookout_q5, WATERYEAR < 2024)
pre_lookout_q5<-pre_lookout_q5[c("WATERYEAR","GSWSMC","GSLOOK","GSWS08")]
#trim post-fire period
post_holiday_q5<-subset(q5, WATERYEAR > 2020)
post_holiday_q5<-post_holiday_q5[c("WATERYEAR","GSWS01","GSWS02","GSWS03","GSWS09","GSWS10")]
post_lookout_q5<-subset(q5, WATERYEAR > 2023)
post_lookout_q5<-post_lookout_q5[c("WATERYEAR","GSWSMC","GSLOOK","GSWS08")]

#find mean of each watershed prefire
ws1_prefire_mean<-mean(pre_holiday_q5$GSWS01, na.rm = TRUE)
ws2_prefire_mean<-mean(pre_holiday_q5$GSWS02, na.rm = TRUE)
ws3_prefire_mean<-mean(pre_holiday_q5$GSWS03, na.rm = TRUE)
ws9_prefire_mean<-mean(pre_holiday_q5$GSWS09, na.rm = TRUE)
ws10_prefire_mean<-mean(pre_holiday_q5$GSWS10, na.rm = TRUE)
mc_prefire_mean<-mean(pre_lookout_q5$GSWSMC, na.rm = TRUE)
lo_prefire_mean<-mean(pre_lookout_q5$GSLOOK, na.rm = TRUE)
ws8_prefire_mean<-mean(pre_lookout_q5$GSWS08, na.rm = TRUE)
#find st dev of each watershed prefire
ws1_prefire_sd<-sd(pre_holiday_q5$GSWS01, na.rm = TRUE)
ws2_prefire_sd<-sd(pre_holiday_q5$GSWS02, na.rm = TRUE)
ws3_prefire_sd<-sd(pre_holiday_q5$GSWS03, na.rm = TRUE)
ws9_prefire_sd<-sd(pre_holiday_q5$GSWS09, na.rm = TRUE)
ws10_prefire_sd<-sd(pre_holiday_q5$GSWS10, na.rm = TRUE)
mc_prefire_sd<-sd(pre_lookout_q5$GSWSMC, na.rm = TRUE)
lo_prefire_sd<-sd(pre_lookout_q5$GSLOOK, na.rm = TRUE)
ws8_prefire_sd<-sd(pre_lookout_q5$GSWS08, na.rm = TRUE)
#find confidence interval of each watershed prefire
ws1_prefire_ci<-2.086*ws1_prefire_sd/((nrow(pre_holiday_q5[!is.na(pre_holiday_q5$GSWS01),]))^(1/2))
ws2_prefire_ci<-2.086*ws2_prefire_sd/((nrow(pre_holiday_q5[!is.na(pre_holiday_q5$GSWS02),]))^(1/2))
ws3_prefire_ci<-2.086*ws3_prefire_sd/((nrow(pre_holiday_q5[!is.na(pre_holiday_q5$GSWS03),]))^(1/2))
ws9_prefire_ci<-2.086*ws9_prefire_sd/((nrow(pre_holiday_q5[!is.na(pre_holiday_q5$GSWS09),]))^(1/2))
ws10_prefire_ci<-2.086*ws10_prefire_sd/((nrow(pre_holiday_q5[!is.na(pre_holiday_q5$GSWS10),]))^(1/2))
mc_prefire_ci<-2.069*mc_prefire_sd/((nrow(pre_lookout_q5[!is.na(pre_lookout_q5$GSWSMC),]))^(1/2))
lo_prefire_ci<-2.069*lo_prefire_sd/((nrow(pre_lookout_q5[!is.na(pre_lookout_q5$GSWSLO),]))^(1/2))
ws8_prefire_ci<-2.069*ws8_prefire_sd/((nrow(pre_lookout_q5[!is.na(pre_lookout_q5$GSWS08),]))^(1/2))
#find mean of each watershed postfire
ws1_postfire_mean<-mean(post_holiday_q5$GSWS01, na.rm = TRUE)
ws2_postfire_mean<-mean(post_holiday_q5$GSWS02, na.rm = TRUE)
ws3_postfire_mean<-mean(post_holiday_q5$GSWS03, na.rm = TRUE)
ws9_postfire_mean<-mean(post_holiday_q5$GSWS09, na.rm = TRUE)
ws10_postfire_mean<-mean(post_holiday_q5$GSWS10, na.rm = TRUE)
mc_postfire_mean<-mean(post_lookout_q5$GSWSMC, na.rm = TRUE)
lo_postfire_mean<-mean(post_lookout_q5$GSLOOK, na.rm = TRUE)
ws8_postfire_mean<-mean(post_lookout_q5$GSWS08, na.rm = TRUE)
#find st dev of each watershed postfire
ws1_postfire_sd<-sd(post_holiday_q5$GSWS01, na.rm = TRUE)
ws2_postfire_sd<-sd(post_holiday_q5$GSWS02, na.rm = TRUE)
ws3_postfire_sd<-sd(post_holiday_q5$GSWS03, na.rm = TRUE)
ws9_postfire_sd<-sd(post_holiday_q5$GSWS09, na.rm = TRUE)
ws10_postfire_sd<-sd(post_holiday_q5$GSWS10, na.rm = TRUE)
mc_postfire_sd<-sd(post_lookout_q5$GSWSMC, na.rm = TRUE)
lo_postfire_sd<-sd(post_lookout_q5$GSLOOK, na.rm = TRUE)
ws8_postfire_sd<-sd(post_lookout_q5$GSWS08, na.rm = TRUE)
#find percent change of each watershed
ws1_pct_change<-100*(ws1_postfire_mean-ws1_prefire_mean)/abs(ws1_prefire_mean)
ws2_pct_change<-100*(ws2_postfire_mean-ws2_prefire_mean)/abs(ws2_prefire_mean)
ws3_pct_change<-100*(ws3_postfire_mean-ws3_prefire_mean)/abs(ws3_prefire_mean)
ws9_pct_change<-100*(ws9_postfire_mean-ws9_prefire_mean)/abs(ws9_prefire_mean)
ws10_pct_change<-100*(ws10_postfire_mean-ws10_prefire_mean)/abs(ws10_prefire_mean)
mc_pct_change<-100*(mc_postfire_mean-mc_prefire_mean)/abs(mc_prefire_mean)
lo_pct_change<-100*(lo_postfire_mean-lo_prefire_mean)/abs(lo_prefire_mean)
ws8_pct_change<-100*(ws8_postfire_mean-ws8_prefire_mean)/abs(ws8_prefire_mean)
#combine into dataframe
means_df<-data.frame(
  Watershed=c("WS 1","WS 1","WS 2","WS 2","WS 3","WS 3","WS 9","WS 9","WS 10","WS 10","MC","MC","LO","LO","WS 8","WS 8"),
  Period=c("Pre-fire","Post-fire","Pre-fire","Post-fire","Pre-fire","Post-fire","Pre-fire","Post-fire","Pre-fire","Post-fire","Pre-fire","Post-fire","Pre-fire","Post-fire","Pre-fire","Post-fire"),
  Mean=c(ws1_prefire_mean,ws1_postfire_mean,ws2_prefire_mean,ws2_postfire_mean,ws3_prefire_mean,ws3_postfire_mean,ws9_prefire_mean,ws9_postfire_mean,ws10_prefire_mean,ws10_postfire_mean,mc_prefire_mean,mc_postfire_mean,lo_prefire_mean,lo_postfire_mean,ws8_prefire_mean,ws8_postfire_mean),
  Stdev=c(ws1_prefire_sd,ws1_postfire_sd,ws2_prefire_sd,ws2_postfire_sd,ws3_prefire_sd,ws3_postfire_sd,ws9_prefire_sd,ws9_postfire_sd,ws10_prefire_sd,ws10_postfire_sd,mc_prefire_sd,mc_postfire_sd,lo_prefire_sd,lo_postfire_sd,ws8_prefire_sd,ws8_postfire_sd),
  Pct_change=c(NA,ws1_pct_change,NA,ws2_pct_change,NA,ws3_pct_change,NA,ws9_pct_change,NA,ws10_pct_change,NA,mc_pct_change,NA,lo_pct_change,NA,ws8_pct_change),
  Burn_Status=c("Burned","Burned","Burned","Burned","Unburned","Unburned","Burned","Burned","Unburned","Unburned","Burned","Burned","Burned","Burned","Unburned","Unburned")
)

#multiply everything times 10^6
means_df_106<-means_df
means_df_106$Mean<-means_df_106$Mean*10^6
means_df_106$Stdev<-means_df_106$Stdev*10^6

#order watersheds
means_df_106$Watershed<-factor(means_df_106$Watershed, levels=c("WS 1","WS 2","WS 3","WS 9","WS 10","MC","WS 8","LO"))
#order periods
means_df_106$Period<-factor(means_df_106$Period, levels=c("Pre-fire","Post-fire"))
#order burn status
means_df_106$Burn_Status<-factor(means_df_106$Burn_Status, levels=c("Burned","Unburned"))

#make plot of pre and post fire q5 with error bars for stdev
dev.new(width=5.75, height=3, unit="in")
png(file="./Output Figures/Intermediate Figures/Mean_Q5_pre_post_fire_SD.png")
ggplot(data = means_df_106,aes(x=Watershed,y=Mean,fill = Period, color=Period)) +
  geom_bar(stat='identity',position='dodge')+
  geom_errorbar(aes(x=Watershed,ymin=Mean-Stdev, ymax = Mean+Stdev),width=0.3,position = position_dodge((0.9)))+
  scale_fill_manual(values = c("lightgray","black"))+
  scale_color_manual(values=c("darkgray","darkgray"))+
  xlab("")+
  ylab(expression(paste("Mean Q"[5], " (10"^"-6"," mm/s)")))+
  theme_bw()+
  theme(axis.text=element_text(color="black"),text=element_text(size=20,color = "black"),legend.title=element_blank(),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),legend.position="top")+
  scale_y_continuous(limits = c(0,7),expand = c(NA,0))+
  geom_hline(yintercept=0,color="black")
dev.off()

#make plot of percent change in each watershed
dev.new(width=5.75, height=3, unit="in")
png(file="./Output Figures/Intermediate Figures/Mean_Q5_pct_change.png")
ggplot(data = means_df_106,aes(x=Watershed,y=Pct_change,fill = Burn_Status, color=Burn_Status)) +
  geom_col()+
  scale_fill_manual(values = c("gray","white"))+
  scale_color_manual(values=c("black","black"))+
  xlab("")+
  ylab(expression(paste("Change in Mean Q"[5], " (%)")))+
  theme_bw()+
  theme(axis.text=element_text(color="black"),text=element_text(size=20,color = "black"),legend.title=element_blank(),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),legend.position="top")+
  geom_hline(yintercept=0,color="black")
dev.off()