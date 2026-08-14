#set working directory
setwd("/Users/shannonduffy/Library/CloudStorage/Box-Box/Shannon_Duffy/Writing/Code For Paper Publication/")

#inputs
#read in storage table
storage = read.csv("./Intermediate Outputs/storage_lowflow_predictors.csv")

#add column combining the two lava groups
storage$LAVA_1_LAVA_2<-storage$LAVA_1+storage$LAVA_2
#add column taking mean of two damping ratio studies
storage$DR_MEAN <- rowMeans(storage[, c("DR_MCGUIRE", "DR_SEGURA")], na.rm = TRUE)
#create subset of data without WS 8 for the geology models
storage_noWS8<-subset(storage, WATERSHED !="WS 8")
#create subset of data without LO for the drainage area model
storage_noLO<-subset(storage, WATERSHED !="LO")

#create models for each storage metric predicting mean pre-fire Q5
#FDC slope
model_fdc_prefireQ5<-lm(Mean_Q5~FDC_SLOPE, data = storage)
model_fdc_prefireQ5_r2<-summary(model_fdc_prefireQ5)$adj.r.squared
model_fdc_prefireQ5_n<-summary(model_fdc_prefireQ5)$fstatistic[2]+summary(model_fdc_prefireQ5)$fstatistic[3]+1
model_fdc_prefireQ5_F<-summary(model_fdc_prefireQ5)$fstatistic[1]
model_fdc_prefireQ5_p<-pf(summary(model_fdc_prefireQ5)$fstatistic[1],summary(model_fdc_prefireQ5)$fstatistic[2],summary(model_fdc_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#lava
#with all data
model_lava_prefireQ5_all<-lm(Mean_Q5~LAVA_1_LAVA_2, data = storage)
model_lava_prefireQ5_all_r2<-summary(model_lava_prefireQ5_all)$adj.r.squared
model_lava_prefireQ5_all_n<-summary(model_lava_prefireQ5_all)$fstatistic[2]+summary(model_lava_prefireQ5_all)$fstatistic[3]+1
model_lava_prefireQ5_all_F<-summary(model_lava_prefireQ5_all)$fstatistic[1]
model_lava_prefireQ5_all_p<-pf(summary(model_lava_prefireQ5_all)$fstatistic[1],summary(model_lava_prefireQ5_all)$fstatistic[2],summary(model_lava_prefireQ5_all)$fstatistic[3],lower.tail = FALSE)
#without WS 8
model_lava_prefireQ5_noWS8<-lm(Mean_Q5~LAVA_1_LAVA_2, data = storage_noWS8)
model_lava_prefireQ5_noWS8_r2<-summary(model_lava_prefireQ5_noWS8)$adj.r.squared
model_lava_prefireQ5_noWS8_n<-summary(model_lava_prefireQ5_noWS8)$fstatistic[2]+summary(model_lava_prefireQ5_noWS8)$fstatistic[3]+1
model_lava_prefireQ5_noWS8_F<-summary(model_lava_prefireQ5_noWS8)$fstatistic[1]
model_lava_prefireQ5_noWS8_p<-pf(summary(model_lava_prefireQ5_noWS8)$fstatistic[1],summary(model_lava_prefireQ5_noWS8)$fstatistic[2],summary(model_lava_prefireQ5_noWS8)$fstatistic[3],lower.tail = FALSE)
#find outlier
leverage_lava<-hatvalues(model_lava_prefireQ5_all)
cook_lava<-cooks.distance(model_lava_prefireQ5_all)
residuals_lava<-rstandard(model_lava_prefireQ5_all)

#young landslide deposits
model_youngdeposits_prefireQ5<-lm(Mean_Q5~YOUNG_DEPOSITS, data = storage)
model_youngdeposits_prefireQ5_r2<-summary(model_youngdeposits_prefireQ5)$adj.r.squared
model_youngdeposits_prefireQ5_n<-summary(model_youngdeposits_prefireQ5)$fstatistic[2]+summary(model_youngdeposits_prefireQ5)$fstatistic[3]+1
model_youngdeposits_prefireQ5_F<-summary(model_youngdeposits_prefireQ5)$fstatistic[1]
model_youngdeposits_prefireQ5_p<-pf(summary(model_youngdeposits_prefireQ5)$fstatistic[1],summary(model_youngdeposits_prefireQ5)$fstatistic[2],summary(model_youngdeposits_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#moderate landslide deposits
model_moderate_deposits_prefireQ5<-lm(Mean_Q5~MODERATE_DEPOSITS, data = storage)
model_moderate_deposits_prefireQ5_r2<-summary(model_moderate_deposits_prefireQ5)$adj.r.squared
model_moderate_deposits_prefireQ5_n<-summary(model_moderate_deposits_prefireQ5)$fstatistic[2]+summary(model_moderate_deposits_prefireQ5)$fstatistic[3]+1
model_moderate_deposits_prefireQ5_F<-summary(model_moderate_deposits_prefireQ5)$fstatistic[1]
model_moderate_deposits_prefireQ5_p<-pf(summary(model_moderate_deposits_prefireQ5)$fstatistic[1],summary(model_moderate_deposits_prefireQ5)$fstatistic[2],summary(model_moderate_deposits_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#old landslide deposits
model_old_deposits_prefireQ5<-lm(Mean_Q5~OLD_DEPOSITS, data = storage)
model_old_deposits_prefireQ5_r2<-summary(model_old_deposits_prefireQ5)$adj.r.squared
model_old_deposits_prefireQ5_n<-summary(model_old_deposits_prefireQ5)$fstatistic[2]+summary(model_old_deposits_prefireQ5)$fstatistic[3]+1
model_old_deposits_prefireQ5_F<-summary(model_old_deposits_prefireQ5)$fstatistic[1]
model_old_deposits_prefireQ5_p<-pf(summary(model_old_deposits_prefireQ5)$fstatistic[1],summary(model_old_deposits_prefireQ5)$fstatistic[2],summary(model_old_deposits_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#total landslide deposits
model_total_deposits_prefireQ5<-lm(Mean_Q5~TOTAL_DEPOSITS, data = storage)
model_total_deposits_prefireQ5_r2<-summary(model_total_deposits_prefireQ5)$adj.r.squared
model_total_deposits_prefireQ5_n<-summary(model_total_deposits_prefireQ5)$fstatistic[2]+summary(model_total_deposits_prefireQ5)$fstatistic[3]+1
model_total_deposits_prefireQ5_F<-summary(model_total_deposits_prefireQ5)$fstatistic[1]
model_total_deposits_prefireQ5_p<-pf(summary(model_total_deposits_prefireQ5)$fstatistic[1],summary(model_total_deposits_prefireQ5)$fstatistic[2],summary(model_total_deposits_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#mean damping ratio
model_drmean_prefireQ5<-lm(Mean_Q5~DR_MEAN, data = storage)
summary(model_drmean_prefireQ5)
model_drmean_prefireQ5_r2<-summary(model_drmean_prefireQ5)$adj.r.squared
model_drmean_prefireQ5_n<-summary(model_drmean_prefireQ5)$fstatistic[2]+summary(model_drmean_prefireQ5)$fstatistic[3]+1
model_drmean_prefireQ5_F<-summary(model_drmean_prefireQ5)$fstatistic[1]
model_drmean_prefireQ5_p<-pf(summary(model_drmean_prefireQ5)$fstatistic[1],summary(model_drmean_prefireQ5)$fstatistic[2],summary(model_drmean_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#make summary statistics table
storage_lowflows_model_stats_table<- data.frame(
  Predictor = c("FDC Slope","Lava (all watersheds)","Lava (no WS 8)","Young Landslide Deposits","Moderate Landslide Deposits","Old Landslide Deposits","Total Landslide Deposits","Mean Damping Ratio"),
  R2 = c(model_fdc_prefireQ5_r2,model_lava_prefireQ5_all_r2,model_lava_prefireQ5_noWS8_r2,model_youngdeposits_prefireQ5_r2,model_moderate_deposits_prefireQ5_r2,model_old_deposits_prefireQ5_r2,model_total_deposits_prefireQ5_r2,model_drmean_prefireQ5_r2),
  n = c(model_fdc_prefireQ5_n,model_lava_prefireQ5_all_n,model_lava_prefireQ5_noWS8_n,model_youngdeposits_prefireQ5_n,model_moderate_deposits_prefireQ5_n,model_old_deposits_prefireQ5_n,model_total_deposits_prefireQ5_n,model_drmean_prefireQ5_n),
  f = c(model_fdc_prefireQ5_F,model_lava_prefireQ5_all_F,model_lava_prefireQ5_noWS8_F,model_youngdeposits_prefireQ5_F,model_moderate_deposits_prefireQ5_F,model_old_deposits_prefireQ5_F,model_total_deposits_prefireQ5_F,model_drmean_prefireQ5_F),
  p = c(model_fdc_prefireQ5_p,model_lava_prefireQ5_all_p,model_lava_prefireQ5_noWS8_p,model_youngdeposits_prefireQ5_p,model_moderate_deposits_prefireQ5_p,model_old_deposits_prefireQ5_p,model_total_deposits_prefireQ5_p,model_drmean_prefireQ5_p)
)
write.csv(storage_lowflows_model_stats_table,"./Output Data/storage_lowflows_model_stats.csv",row.names = FALSE)



#create models for each storage metric predicting BFR slope (defined by pre-fire)
#FDC slope
model_fdc_BFR_slope<-lm(BFR_Slope~FDC_SLOPE, data = storage)
model_fdc_BFR_slope_r2<-summary(model_fdc_BFR_slope)$adj.r.squared
model_fdc_BFR_slope_n<-summary(model_fdc_BFR_slope)$fstatistic[2]+summary(model_fdc_BFR_slope)$fstatistic[3]+1
model_fdc_BFR_slope_F<-summary(model_fdc_BFR_slope)$fstatistic[1]
model_fdc_BFR_slope_p<-pf(summary(model_fdc_BFR_slope)$fstatistic[1],summary(model_fdc_BFR_slope)$fstatistic[2],summary(model_fdc_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#lava
#with all data
model_lava_BFR_slope_all<-lm(BFR_Slope~LAVA_1_LAVA_2, data = storage)
model_lava_BFR_slope_all_r2<-summary(model_lava_BFR_slope_all)$adj.r.squared
model_lava_BFR_slope_all_n<-summary(model_lava_BFR_slope_all)$fstatistic[2]+summary(model_lava_BFR_slope_all)$fstatistic[3]+1
model_lava_BFR_slope_all_F<-summary(model_lava_BFR_slope_all)$fstatistic[1]
model_lava_BFR_slope_all_p<-pf(summary(model_lava_BFR_slope_all)$fstatistic[1],summary(model_lava_BFR_slope_all)$fstatistic[2],summary(model_lava_BFR_slope_all)$fstatistic[3],lower.tail = FALSE)
#without WS 8
model_lava_BFR_slope_noWS8<-lm(BFR_Slope~LAVA_1_LAVA_2, data = storage_noWS8)
model_lava_BFR_slope_noWS8_r2<-summary(model_lava_BFR_slope_noWS8)$adj.r.squared
model_lava_BFR_slope_noWS8_n<-summary(model_lava_BFR_slope_noWS8)$fstatistic[2]+summary(model_lava_BFR_slope_noWS8)$fstatistic[3]+1
model_lava_BFR_slope_noWS8_F<-summary(model_lava_BFR_slope_noWS8)$fstatistic[1]
model_lava_BFR_slope_noWS8_p<-pf(summary(model_lava_BFR_slope_noWS8)$fstatistic[1],summary(model_lava_BFR_slope_noWS8)$fstatistic[2],summary(model_lava_BFR_slope_noWS8)$fstatistic[3],lower.tail = FALSE)
#find outlier
leverage_lava_BFR_slope<-hatvalues(model_lava_BFR_slope_all)
print(leverage_lava_BFR_slope)
cook_lava_BFR_slope<-cooks.distance(model_lava_BFR_slope_all)
print(cook_lava_BFR_slope)
residuals_lava_BFR_slope<-rstandard(model_lava_BFR_slope_all)
print(residuals_lava_BFR_slope)

#young landslide deposits
model_youngdeposits_BFR_slope<-lm(BFR_Slope~YOUNG_DEPOSITS, data = storage)
model_youngdeposits_BFR_slope_r2<-summary(model_youngdeposits_BFR_slope)$adj.r.squared
model_youngdeposits_BFR_slope_n<-summary(model_youngdeposits_BFR_slope)$fstatistic[2]+summary(model_youngdeposits_BFR_slope)$fstatistic[3]+1
model_youngdeposits_BFR_slope_F<-summary(model_youngdeposits_BFR_slope)$fstatistic[1]
model_youngdeposits_BFR_slope_p<-pf(summary(model_youngdeposits_BFR_slope)$fstatistic[1],summary(model_youngdeposits_BFR_slope)$fstatistic[2],summary(model_youngdeposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#moderate landslide deposits
model_moderate_deposits_BFR_slope<-lm(BFR_Slope~MODERATE_DEPOSITS, data = storage)
model_moderate_deposits_BFR_slope_r2<-summary(model_moderate_deposits_BFR_slope)$adj.r.squared
model_moderate_deposits_BFR_slope_n<-summary(model_moderate_deposits_BFR_slope)$fstatistic[2]+summary(model_moderate_deposits_BFR_slope)$fstatistic[3]+1
model_moderate_deposits_BFR_slope_F<-summary(model_moderate_deposits_BFR_slope)$fstatistic[1]
model_moderate_deposits_BFR_slope_p<-pf(summary(model_moderate_deposits_BFR_slope)$fstatistic[1],summary(model_moderate_deposits_BFR_slope)$fstatistic[2],summary(model_moderate_deposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#old landslide deposits
model_old_deposits_BFR_slope<-lm(BFR_Slope~OLD_DEPOSITS, data = storage)
model_old_deposits_BFR_slope_r2<-summary(model_old_deposits_BFR_slope)$adj.r.squared
model_old_deposits_BFR_slope_n<-summary(model_old_deposits_BFR_slope)$fstatistic[2]+summary(model_old_deposits_BFR_slope)$fstatistic[3]+1
model_old_deposits_BFR_slope_F<-summary(model_old_deposits_BFR_slope)$fstatistic[1]
model_old_deposits_BFR_slope_p<-pf(summary(model_old_deposits_BFR_slope)$fstatistic[1],summary(model_old_deposits_BFR_slope)$fstatistic[2],summary(model_old_deposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#total landslide deposits
model_total_deposits_BFR_slope<-lm(BFR_Slope~TOTAL_DEPOSITS, data = storage)
model_total_deposits_BFR_slope_r2<-summary(model_total_deposits_BFR_slope)$adj.r.squared
model_total_deposits_BFR_slope_n<-summary(model_total_deposits_BFR_slope)$fstatistic[2]+summary(model_total_deposits_BFR_slope)$fstatistic[3]+1
model_total_deposits_BFR_slope_F<-summary(model_total_deposits_BFR_slope)$fstatistic[1]
model_total_deposits_BFR_slope_p<-pf(summary(model_total_deposits_BFR_slope)$fstatistic[1],summary(model_total_deposits_BFR_slope)$fstatistic[2],summary(model_total_deposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#mean damping ratio
model_drmean_BFR_slope<-lm(BFR_Slope~DR_MEAN, data = storage)
summary(model_drmean_BFR_slope)
model_drmean_BFR_slope_r2<-summary(model_drmean_BFR_slope)$adj.r.squared
model_drmean_BFR_slope_n<-summary(model_drmean_BFR_slope)$fstatistic[2]+summary(model_drmean_BFR_slope)$fstatistic[3]+1
model_drmean_BFR_slope_F<-summary(model_drmean_BFR_slope)$fstatistic[1]
model_drmean_BFR_slope_p<-pf(summary(model_drmean_BFR_slope)$fstatistic[1],summary(model_drmean_BFR_slope)$fstatistic[2],summary(model_drmean_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#make summary statistics table
storage_BFR_slope_model_stats_table<- data.frame(
  Predictor = c("FDC Slope","Lava (all watersheds)","Lava (no WS 8)","Young Landslide Deposits","Moderate Landslide Deposits","Old Landslide Deposits","Total Landslide Deposits","Mean Damping Ratio"),
  R2 = c(model_fdc_BFR_slope_r2,model_lava_BFR_slope_all_r2,model_lava_BFR_slope_noWS8_r2,model_youngdeposits_BFR_slope_r2,model_moderate_deposits_BFR_slope_r2,model_old_deposits_BFR_slope_r2,model_total_deposits_BFR_slope_r2,model_drmean_BFR_slope_r2),
  n = c(model_fdc_BFR_slope_n,model_lava_BFR_slope_all_n,model_lava_BFR_slope_noWS8_n,model_youngdeposits_BFR_slope_n,model_moderate_deposits_BFR_slope_n,model_old_deposits_BFR_slope_n,model_total_deposits_BFR_slope_n,model_drmean_BFR_slope_n),
  f = c(model_fdc_BFR_slope_F,model_lava_BFR_slope_all_F,model_lava_BFR_slope_noWS8_F,model_youngdeposits_BFR_slope_F,model_moderate_deposits_BFR_slope_F,model_old_deposits_BFR_slope_F,model_total_deposits_BFR_slope_F,model_drmean_BFR_slope_F),
  p = c(model_fdc_BFR_slope_p,model_lava_BFR_slope_all_p,model_lava_BFR_slope_noWS8_p,model_youngdeposits_BFR_slope_p,model_moderate_deposits_BFR_slope_p,model_old_deposits_BFR_slope_p,model_total_deposits_BFR_slope_p,model_drmean_BFR_slope_p)
)
write.csv(storage_BFR_slope_model_stats_table,"./Output Data/storage_BFR_slope_model_stats.csv",row.names = FALSE)
