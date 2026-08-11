#read in storage table
storage = read.csv("/Volumes/nobackup2/Segura_Lab/4_Students_Post_docts_Folders/2024_Shannon_Duffy/Ch1_LowFlows/Intermediate_Outputs/storage_lowflow_predictors.csv")

#add column combining the two lava groups
storage$LAVA_1_LAVA_2<-storage$LAVA_1+storage$LAVA_2
#add column taking mean of two damping ratio studies
storage$DR_MEAN <- rowMeans(storage[, c("DR_MCGUIRE", "DR_SEGURA")], na.rm = TRUE)
#add column for BFR slope
storage$BFR_slope<-c(1.06,1.32,1.39,1.13,1.11,1.13,1.55,1.51)
#create subset of data without WS 8 for the geology models
storage_noWS8<-subset(storage, WATERSHED !="WS 8")
#create subset of data without LO for the drainage area model
storage_noLO<-subset(storage, WATERSHED !="LO")

#create models for each storage metric predicting mean pre-fire Q5
#FDC slope
model_fdc_prefireQ5<-lm(Mean_Q5~mean.FDC.slope, data = storage)
model_fdc_prefireQ5_r2<-summary(model_fdc_prefireQ5)$adj.r.squared
model_fdc_prefireQ5_n<-summary(model_fdc_prefireQ5)$fstatistic[2]+summary(model_fdc_prefireQ5)$fstatistic[3]+1
model_fdc_prefireQ5_F<-summary(model_fdc_prefireQ5)$fstatistic[1]
model_fdc_prefireQ5_p<-pf(summary(model_fdc_prefireQ5)$fstatistic[1],summary(model_fdc_prefireQ5)$fstatistic[2],summary(model_fdc_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#pyroclastics
#with all data
model_pyro_prefireQ5_all<-lm(Mean_Q5~PYRO, data = storage)
model_pyro_prefireQ5_all_r2<-summary(model_pyro_prefireQ5_all)$adj.r.squared
model_pyro_prefireQ5_all_n<-summary(model_pyro_prefireQ5_all)$fstatistic[2]+summary(model_pyro_prefireQ5_all)$fstatistic[3]+1
model_pyro_prefireQ5_all_F<-summary(model_pyro_prefireQ5_all)$fstatistic[1]
model_pyro_prefireQ5_all_p<-pf(summary(model_pyro_prefireQ5_all)$fstatistic[1],summary(model_pyro_prefireQ5_all)$fstatistic[2],summary(model_pyro_prefireQ5_all)$fstatistic[3],lower.tail = FALSE)
#without WS 8
model_pyro_prefireQ5_noWS8<-lm(Mean_Q5~PYRO, data = storage_noWS8)
model_pyro_prefireQ5_noWS8_r2<-summary(model_pyro_prefireQ5_noWS8)$adj.r.squared
model_pyro_prefireQ5_noWS8_n<-summary(model_pyro_prefireQ5_noWS8)$fstatistic[2]+summary(model_pyro_prefireQ5_noWS8)$fstatistic[3]+1
model_pyro_prefireQ5_noWS8_F<-summary(model_pyro_prefireQ5_noWS8)$fstatistic[1]
model_pyro_prefireQ5_noWS8_p<-pf(summary(model_pyro_prefireQ5_noWS8)$fstatistic[1],summary(model_pyro_prefireQ5_noWS8)$fstatistic[2],summary(model_pyro_prefireQ5_noWS8)$fstatistic[3],lower.tail = FALSE)
#find outlier
leverage_pyro<-hatvalues(model_pyro_prefireQ5_all)
cook_pyro<-cooks.distance(model_pyro_prefireQ5_all)
residuals_pyro<-rstandard(model_pyro_prefireQ5_all)

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

#mean slope
model_meanslope_prefireQ5<-lm(Mean_Q5~MEAN_SLOPE, data = storage)
model_meanslope_prefireQ5_r2<-summary(model_meanslope_prefireQ5)$adj.r.squared
model_meanslope_prefireQ5_n<-summary(model_meanslope_prefireQ5)$fstatistic[2]+summary(model_meanslope_prefireQ5)$fstatistic[3]+1
model_meanslope_prefireQ5_F<-summary(model_meanslope_prefireQ5)$fstatistic[1]
model_meanslope_prefireQ5_p<-pf(summary(model_meanslope_prefireQ5)$fstatistic[1],summary(model_meanslope_prefireQ5)$fstatistic[2],summary(model_meanslope_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#stdev of slope
model_stdslope_prefireQ5<-lm(Mean_Q5~SLOPE_STDEV, data = storage)
model_stdslope_prefireQ5_r2<-summary(model_stdslope_prefireQ5)$adj.r.squared
model_stdslope_prefireQ5_n<-summary(model_stdslope_prefireQ5)$fstatistic[2]+summary(model_stdslope_prefireQ5)$fstatistic[3]+1
model_stdslope_prefireQ5_F<-summary(model_stdslope_prefireQ5)$fstatistic[1]
model_stdslope_prefireQ5_p<-pf(summary(model_stdslope_prefireQ5)$fstatistic[1],summary(model_stdslope_prefireQ5)$fstatistic[2],summary(model_stdslope_prefireQ5)$fstatistic[3],lower.tail = FALSE)

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

#topographic roughness index
model_tri_prefireQ5<-lm(Mean_Q5~MEAN_ROUGHNESS, data = storage)
summary(model_tri_prefireQ5)
model_tri_prefireQ5_r2<-summary(model_tri_prefireQ5)$adj.r.squared
model_tri_prefireQ5_n<-summary(model_tri_prefireQ5)$fstatistic[2]+summary(model_tri_prefireQ5)$fstatistic[3]+1
model_tri_prefireQ5_F<-summary(model_tri_prefireQ5)$fstatistic[1]
model_tri_prefireQ5_p<-pf(summary(model_tri_prefireQ5)$fstatistic[1],summary(model_tri_prefireQ5)$fstatistic[2],summary(model_tri_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#segura damping ratio
model_drsegura_prefireQ5<-lm(Mean_Q5~DR_SEGURA, data = storage)
summary(model_drsegura_prefireQ5)
model_drsegura_prefireQ5_r2<-summary(model_drsegura_prefireQ5)$adj.r.squared
model_drsegura_prefireQ5_n<-summary(model_drsegura_prefireQ5)$fstatistic[2]+summary(model_drsegura_prefireQ5)$fstatistic[3]+1
model_drsegura_prefireQ5_F<-summary(model_drsegura_prefireQ5)$fstatistic[1]
model_drsegura_prefireQ5_p<-pf(summary(model_drsegura_prefireQ5)$fstatistic[1],summary(model_drsegura_prefireQ5)$fstatistic[2],summary(model_drsegura_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#mcguire damping ratio
model_drmcguire_prefireQ5<-lm(Mean_Q5~DR_MCGUIRE, data = storage)
summary(model_drmcguire_prefireQ5)
model_drmcguire_prefireQ5_r2<-summary(model_drmcguire_prefireQ5)$adj.r.squared
model_drmcguire_prefireQ5_n<-summary(model_drmcguire_prefireQ5)$fstatistic[2]+summary(model_drmcguire_prefireQ5)$fstatistic[3]+1
model_drmcguire_prefireQ5_F<-summary(model_drmcguire_prefireQ5)$fstatistic[1]
model_drmcguire_prefireQ5_p<-pf(summary(model_drmcguire_prefireQ5)$fstatistic[1],summary(model_drmcguire_prefireQ5)$fstatistic[2],summary(model_drmcguire_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#mean damping ratio
model_drmean_prefireQ5<-lm(Mean_Q5~DR_MEAN, data = storage)
summary(model_drmean_prefireQ5)
model_drmean_prefireQ5_r2<-summary(model_drmean_prefireQ5)$adj.r.squared
model_drmean_prefireQ5_n<-summary(model_drmean_prefireQ5)$fstatistic[2]+summary(model_drmean_prefireQ5)$fstatistic[3]+1
model_drmean_prefireQ5_F<-summary(model_drmean_prefireQ5)$fstatistic[1]
model_drmean_prefireQ5_p<-pf(summary(model_drmean_prefireQ5)$fstatistic[1],summary(model_drmean_prefireQ5)$fstatistic[2],summary(model_drmean_prefireQ5)$fstatistic[3],lower.tail = FALSE)

#drainage area
#with all data
model_drainage_area_prefireQ5_all<-lm(Mean_Q5~DRAINAGE_AREA, data = storage)
summary(model_drainage_area_prefireQ5_all)
model_drainage_area_prefireQ5_all_r2<-summary(model_drainage_area_prefireQ5_all)$adj.r.squared
model_drainage_area_prefireQ5_all_n<-summary(model_drainage_area_prefireQ5_all)$fstatistic[2]+summary(model_drainage_area_prefireQ5_all)$fstatistic[3]+1
model_drainage_area_prefireQ5_all_F<-summary(model_drainage_area_prefireQ5_all)$fstatistic[1]
model_drainage_area_prefireQ5_all_p<-pf(summary(model_drainage_area_prefireQ5_all)$fstatistic[1],summary(model_drainage_area_prefireQ5_all)$fstatistic[2],summary(model_drainage_area_prefireQ5_all)$fstatistic[3],lower.tail = FALSE)
#without LO
model_drainage_area_prefireQ5_noLO<-lm(Mean_Q5~DRAINAGE_AREA, data = storage_noLO)
summary(model_drainage_area_prefireQ5_noLO)
model_drainage_area_prefireQ5_noLO_r2<-summary(model_drainage_area_prefireQ5_noLO)$adj.r.squared
model_drainage_area_prefireQ5_noLO_n<-summary(model_drainage_area_prefireQ5_noLO)$fstatistic[2]+summary(model_drainage_area_prefireQ5_noLO)$fstatistic[3]+1
model_drainage_area_prefireQ5_noLO_F<-summary(model_drainage_area_prefireQ5_noLO)$fstatistic[1]
model_drainage_area_prefireQ5_noLO_p<-pf(summary(model_drainage_area_prefireQ5_noLO)$fstatistic[1],summary(model_drainage_area_prefireQ5_noLO)$fstatistic[2],summary(model_drainage_area_prefireQ5_noLO)$fstatistic[3],lower.tail = FALSE)
#find outlier
leverage_da<-hatvalues(model_drainage_area_prefireQ5_all)
print(leverage_da)
cook_da<-cooks.distance(model_drainage_area_prefireQ5_all)
print(cook_da)
residuals_da<-rstandard(model_drainage_area_prefireQ5_all)
print(residuals_da)

#make summary statistics table
storage_lowflows_model_stats_table<- data.frame(
  Predictor = c("FDC Slope","Pyro (all watersheds)","Pyro (no WS 8)","Lava (all watersheds)","Lava (no WS 8)","Mean Slope","St. Dev. of Slope","Young Landslide Deposits","Moderate Landslide Deposits","Old Landslide Deposits","Total Landslide Deposits","TRI","Segura Damping Ratio","McGuire Damping Ratio","Mean Damping Ratio","Drainage Area (all watersheds)","Drainage Area (no LO)"),
  R2 = c(model_fdc_prefireQ5_r2,model_pyro_prefireQ5_all_r2,model_pyro_prefireQ5_noWS8_r2,model_lava_prefireQ5_all_r2,model_lava_prefireQ5_noWS8_r2,model_meanslope_prefireQ5_r2,model_stdslope_prefireQ5_r2,model_youngdeposits_prefireQ5_r2,model_moderate_deposits_prefireQ5_r2,model_old_deposits_prefireQ5_r2,model_total_deposits_prefireQ5_r2,model_tri_prefireQ5_r2,model_drsegura_prefireQ5_r2,model_drmcguire_prefireQ5_r2,model_drmean_prefireQ5_r2,model_drainage_area_prefireQ5_all_r2,model_drainage_area_prefireQ5_noLO_r2),
  n = c(model_fdc_prefireQ5_n,model_pyro_prefireQ5_all_n,model_pyro_prefireQ5_noWS8_n,model_lava_prefireQ5_all_n,model_lava_prefireQ5_noWS8_n,model_meanslope_prefireQ5_n,model_stdslope_prefireQ5_n,model_youngdeposits_prefireQ5_n,model_moderate_deposits_prefireQ5_n,model_old_deposits_prefireQ5_n,model_total_deposits_prefireQ5_n,model_tri_prefireQ5_n,model_drsegura_prefireQ5_n,model_drmcguire_prefireQ5_n,model_drmean_prefireQ5_n,model_drainage_area_prefireQ5_all_n,model_drainage_area_prefireQ5_noLO_n),
  f = c(model_fdc_prefireQ5_F,model_pyro_prefireQ5_all_F,model_pyro_prefireQ5_noWS8_F,model_lava_prefireQ5_all_F,model_lava_prefireQ5_noWS8_F,model_meanslope_prefireQ5_F,model_stdslope_prefireQ5_F,model_youngdeposits_prefireQ5_F,model_moderate_deposits_prefireQ5_F,model_old_deposits_prefireQ5_F,model_total_deposits_prefireQ5_F,model_tri_prefireQ5_F,model_drsegura_prefireQ5_F,model_drmcguire_prefireQ5_F,model_drmean_prefireQ5_F,model_drainage_area_prefireQ5_all_F,model_drainage_area_prefireQ5_noLO_F),
  p = c(model_fdc_prefireQ5_p,model_pyro_prefireQ5_all_p,model_pyro_prefireQ5_noWS8_p,model_lava_prefireQ5_all_p,model_lava_prefireQ5_noWS8_p,model_meanslope_prefireQ5_p,model_stdslope_prefireQ5_p,model_youngdeposits_prefireQ5_p,model_moderate_deposits_prefireQ5_p,model_old_deposits_prefireQ5_p,model_total_deposits_prefireQ5_p,model_tri_prefireQ5_p,model_drsegura_prefireQ5_p,model_drmcguire_prefireQ5_p,model_drmean_prefireQ5_p,model_drainage_area_prefireQ5_all_p,model_drainage_area_prefireQ5_noLO_p)
)
write.csv(storage_lowflows_model_stats_table,"/Volumes/nobackup2/Segura_Lab/4_Students_Post_docts_Folders/2024_Shannon_Duffy/Ch1_LowFlows/Output Data/storage_lowflows_model_stats.csv",row.names = FALSE)






#create models for each storage metric predicting BFR slope (defined by pre-fire)
#FDC slope
model_fdc_BFR_slope<-lm(BFR_slope~mean.FDC.slope, data = storage)
model_fdc_BFR_slope_r2<-summary(model_fdc_BFR_slope)$adj.r.squared
model_fdc_BFR_slope_n<-summary(model_fdc_BFR_slope)$fstatistic[2]+summary(model_fdc_BFR_slope)$fstatistic[3]+1
model_fdc_BFR_slope_F<-summary(model_fdc_BFR_slope)$fstatistic[1]
model_fdc_BFR_slope_p<-pf(summary(model_fdc_BFR_slope)$fstatistic[1],summary(model_fdc_BFR_slope)$fstatistic[2],summary(model_fdc_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#pyroclastics
#with all data
model_pyro_BFR_slope_all<-lm(BFR_slope~PYRO, data = storage)
model_pyro_BFR_slope_all_r2<-summary(model_pyro_BFR_slope_all)$adj.r.squared
model_pyro_BFR_slope_all_n<-summary(model_pyro_BFR_slope_all)$fstatistic[2]+summary(model_pyro_BFR_slope_all)$fstatistic[3]+1
model_pyro_BFR_slope_all_F<-summary(model_pyro_BFR_slope_all)$fstatistic[1]
model_pyro_BFR_slope_all_p<-pf(summary(model_pyro_BFR_slope_all)$fstatistic[1],summary(model_pyro_BFR_slope_all)$fstatistic[2],summary(model_pyro_BFR_slope_all)$fstatistic[3],lower.tail = FALSE)
#without WS 8
model_pyro_BFR_slope_noWS8<-lm(BFR_slope~PYRO, data = storage_noWS8)
model_pyro_BFR_slope_noWS8_r2<-summary(model_pyro_BFR_slope_noWS8)$adj.r.squared
model_pyro_BFR_slope_noWS8_n<-summary(model_pyro_BFR_slope_noWS8)$fstatistic[2]+summary(model_pyro_BFR_slope_noWS8)$fstatistic[3]+1
model_pyro_BFR_slope_noWS8_F<-summary(model_pyro_BFR_slope_noWS8)$fstatistic[1]
model_pyro_BFR_slope_noWS8_p<-pf(summary(model_pyro_BFR_slope_noWS8)$fstatistic[1],summary(model_pyro_BFR_slope_noWS8)$fstatistic[2],summary(model_pyro_BFR_slope_noWS8)$fstatistic[3],lower.tail = FALSE)
#find outlier
leverage_pyro_BFR_slope<-hatvalues(model_pyro_BFR_slope_all)
print(leverage_pyro_BFR_slope)
cook_pyro_BFR_slope<-cooks.distance(model_pyro_BFR_slope_all)
print(cook_pyro_BFR_slope)
residuals_pyro_BFR_slope<-rstandard(model_pyro_BFR_slope_all)
print(residuals_pyro_BFR_slope)

#lava
#with all data
model_lava_BFR_slope_all<-lm(BFR_slope~LAVA_1_LAVA_2, data = storage)
model_lava_BFR_slope_all_r2<-summary(model_lava_BFR_slope_all)$adj.r.squared
model_lava_BFR_slope_all_n<-summary(model_lava_BFR_slope_all)$fstatistic[2]+summary(model_lava_BFR_slope_all)$fstatistic[3]+1
model_lava_BFR_slope_all_F<-summary(model_lava_BFR_slope_all)$fstatistic[1]
model_lava_BFR_slope_all_p<-pf(summary(model_lava_BFR_slope_all)$fstatistic[1],summary(model_lava_BFR_slope_all)$fstatistic[2],summary(model_lava_BFR_slope_all)$fstatistic[3],lower.tail = FALSE)
#without WS 8
model_lava_BFR_slope_noWS8<-lm(BFR_slope~LAVA_1_LAVA_2, data = storage_noWS8)
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

#mean slope
model_meanslope_BFR_slope<-lm(BFR_slope~MEAN_SLOPE, data = storage)
model_meanslope_BFR_slope_r2<-summary(model_meanslope_BFR_slope)$adj.r.squared
model_meanslope_BFR_slope_n<-summary(model_meanslope_BFR_slope)$fstatistic[2]+summary(model_meanslope_BFR_slope)$fstatistic[3]+1
model_meanslope_BFR_slope_F<-summary(model_meanslope_BFR_slope)$fstatistic[1]
model_meanslope_BFR_slope_p<-pf(summary(model_meanslope_BFR_slope)$fstatistic[1],summary(model_meanslope_BFR_slope)$fstatistic[2],summary(model_meanslope_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#stdev of slope
model_stdslope_BFR_slope<-lm(BFR_slope~SLOPE_STDEV, data = storage)
model_stdslope_BFR_slope_r2<-summary(model_stdslope_BFR_slope)$adj.r.squared
model_stdslope_BFR_slope_n<-summary(model_stdslope_BFR_slope)$fstatistic[2]+summary(model_stdslope_BFR_slope)$fstatistic[3]+1
model_stdslope_BFR_slope_F<-summary(model_stdslope_BFR_slope)$fstatistic[1]
model_stdslope_BFR_slope_p<-pf(summary(model_stdslope_BFR_slope)$fstatistic[1],summary(model_stdslope_BFR_slope)$fstatistic[2],summary(model_stdslope_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#young landslide deposits
model_youngdeposits_BFR_slope<-lm(BFR_slope~YOUNG_DEPOSITS, data = storage)
model_youngdeposits_BFR_slope_r2<-summary(model_youngdeposits_BFR_slope)$adj.r.squared
model_youngdeposits_BFR_slope_n<-summary(model_youngdeposits_BFR_slope)$fstatistic[2]+summary(model_youngdeposits_BFR_slope)$fstatistic[3]+1
model_youngdeposits_BFR_slope_F<-summary(model_youngdeposits_BFR_slope)$fstatistic[1]
model_youngdeposits_BFR_slope_p<-pf(summary(model_youngdeposits_BFR_slope)$fstatistic[1],summary(model_youngdeposits_BFR_slope)$fstatistic[2],summary(model_youngdeposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#moderate landslide deposits
model_moderate_deposits_BFR_slope<-lm(BFR_slope~MODERATE_DEPOSITS, data = storage)
model_moderate_deposits_BFR_slope_r2<-summary(model_moderate_deposits_BFR_slope)$adj.r.squared
model_moderate_deposits_BFR_slope_n<-summary(model_moderate_deposits_BFR_slope)$fstatistic[2]+summary(model_moderate_deposits_BFR_slope)$fstatistic[3]+1
model_moderate_deposits_BFR_slope_F<-summary(model_moderate_deposits_BFR_slope)$fstatistic[1]
model_moderate_deposits_BFR_slope_p<-pf(summary(model_moderate_deposits_BFR_slope)$fstatistic[1],summary(model_moderate_deposits_BFR_slope)$fstatistic[2],summary(model_moderate_deposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#old landslide deposits
model_old_deposits_BFR_slope<-lm(BFR_slope~OLD_DEPOSITS, data = storage)
model_old_deposits_BFR_slope_r2<-summary(model_old_deposits_BFR_slope)$adj.r.squared
model_old_deposits_BFR_slope_n<-summary(model_old_deposits_BFR_slope)$fstatistic[2]+summary(model_old_deposits_BFR_slope)$fstatistic[3]+1
model_old_deposits_BFR_slope_F<-summary(model_old_deposits_BFR_slope)$fstatistic[1]
model_old_deposits_BFR_slope_p<-pf(summary(model_old_deposits_BFR_slope)$fstatistic[1],summary(model_old_deposits_BFR_slope)$fstatistic[2],summary(model_old_deposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#total landslide deposits
model_total_deposits_BFR_slope<-lm(BFR_slope~TOTAL_DEPOSITS, data = storage)
model_total_deposits_BFR_slope_r2<-summary(model_total_deposits_BFR_slope)$adj.r.squared
model_total_deposits_BFR_slope_n<-summary(model_total_deposits_BFR_slope)$fstatistic[2]+summary(model_total_deposits_BFR_slope)$fstatistic[3]+1
model_total_deposits_BFR_slope_F<-summary(model_total_deposits_BFR_slope)$fstatistic[1]
model_total_deposits_BFR_slope_p<-pf(summary(model_total_deposits_BFR_slope)$fstatistic[1],summary(model_total_deposits_BFR_slope)$fstatistic[2],summary(model_total_deposits_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#topographic roughness index
model_tri_BFR_slope<-lm(BFR_slope~MEAN_ROUGHNESS, data = storage)
summary(model_tri_BFR_slope)
model_tri_BFR_slope_r2<-summary(model_tri_BFR_slope)$adj.r.squared
model_tri_BFR_slope_n<-summary(model_tri_BFR_slope)$fstatistic[2]+summary(model_tri_BFR_slope)$fstatistic[3]+1
model_tri_BFR_slope_F<-summary(model_tri_BFR_slope)$fstatistic[1]
model_tri_BFR_slope_p<-pf(summary(model_tri_BFR_slope)$fstatistic[1],summary(model_tri_BFR_slope)$fstatistic[2],summary(model_tri_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#segura damping ratio
model_drsegura_BFR_slope<-lm(BFR_slope~DR_SEGURA, data = storage)
summary(model_drsegura_BFR_slope)
model_drsegura_BFR_slope_r2<-summary(model_drsegura_BFR_slope)$adj.r.squared
model_drsegura_BFR_slope_n<-summary(model_drsegura_BFR_slope)$fstatistic[2]+summary(model_drsegura_BFR_slope)$fstatistic[3]+1
model_drsegura_BFR_slope_F<-summary(model_drsegura_BFR_slope)$fstatistic[1]
model_drsegura_BFR_slope_p<-pf(summary(model_drsegura_BFR_slope)$fstatistic[1],summary(model_drsegura_BFR_slope)$fstatistic[2],summary(model_drsegura_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#mcguire damping ratio
model_drmcguire_BFR_slope<-lm(BFR_slope~DR_MCGUIRE, data = storage)
summary(model_drmcguire_BFR_slope)
model_drmcguire_BFR_slope_r2<-summary(model_drmcguire_BFR_slope)$adj.r.squared
model_drmcguire_BFR_slope_n<-summary(model_drmcguire_BFR_slope)$fstatistic[2]+summary(model_drmcguire_BFR_slope)$fstatistic[3]+1
model_drmcguire_BFR_slope_F<-summary(model_drmcguire_BFR_slope)$fstatistic[1]
model_drmcguire_BFR_slope_p<-pf(summary(model_drmcguire_BFR_slope)$fstatistic[1],summary(model_drmcguire_BFR_slope)$fstatistic[2],summary(model_drmcguire_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#mean damping ratio
model_drmean_BFR_slope<-lm(BFR_slope~DR_MEAN, data = storage)
summary(model_drmean_BFR_slope)
model_drmean_BFR_slope_r2<-summary(model_drmean_BFR_slope)$adj.r.squared
model_drmean_BFR_slope_n<-summary(model_drmean_BFR_slope)$fstatistic[2]+summary(model_drmean_BFR_slope)$fstatistic[3]+1
model_drmean_BFR_slope_F<-summary(model_drmean_BFR_slope)$fstatistic[1]
model_drmean_BFR_slope_p<-pf(summary(model_drmean_BFR_slope)$fstatistic[1],summary(model_drmean_BFR_slope)$fstatistic[2],summary(model_drmean_BFR_slope)$fstatistic[3],lower.tail = FALSE)

#drainage area
#with all data
model_drainage_area_BFR_slope_all<-lm(BFR_slope~DRAINAGE_AREA, data = storage)
summary(model_drainage_area_BFR_slope_all)
model_drainage_area_BFR_slope_all_r2<-summary(model_drainage_area_BFR_slope_all)$adj.r.squared
model_drainage_area_BFR_slope_all_n<-summary(model_drainage_area_BFR_slope_all)$fstatistic[2]+summary(model_drainage_area_BFR_slope_all)$fstatistic[3]+1
model_drainage_area_BFR_slope_all_F<-summary(model_drainage_area_BFR_slope_all)$fstatistic[1]
model_drainage_area_BFR_slope_all_p<-pf(summary(model_drainage_area_BFR_slope_all)$fstatistic[1],summary(model_drainage_area_BFR_slope_all)$fstatistic[2],summary(model_drainage_area_BFR_slope_all)$fstatistic[3],lower.tail = FALSE)
#without LO
model_drainage_area_BFR_slope_noLO<-lm(BFR_slope~DRAINAGE_AREA, data = storage_noLO)
summary(model_drainage_area_BFR_slope_noLO)
model_drainage_area_BFR_slope_noLO_r2<-summary(model_drainage_area_BFR_slope_noLO)$adj.r.squared
model_drainage_area_BFR_slope_noLO_n<-summary(model_drainage_area_BFR_slope_noLO)$fstatistic[2]+summary(model_drainage_area_BFR_slope_noLO)$fstatistic[3]+1
model_drainage_area_BFR_slope_noLO_F<-summary(model_drainage_area_BFR_slope_noLO)$fstatistic[1]
model_drainage_area_BFR_slope_noLO_p<-pf(summary(model_drainage_area_BFR_slope_noLO)$fstatistic[1],summary(model_drainage_area_BFR_slope_noLO)$fstatistic[2],summary(model_drainage_area_BFR_slope_noLO)$fstatistic[3],lower.tail = FALSE)
#find outlier
leverage_da_BFR_slope<-hatvalues(model_drainage_area_BFR_slope_all)
print(leverage_da_BFR_slope)
cook_da_BFR_slope<-cooks.distance(model_drainage_area_BFR_slope_all)
print(cook_da_BFR_slope)
residuals_da_BFR_slope<-rstandard(model_drainage_area_BFR_slope_all)
print(residuals_da_BFR_slope)

#make summary statistics table
storage_BFR_slope_model_stats_table<- data.frame(
  Predictor = c("FDC Slope","Pyro (all watersheds)","Pyro (no WS 8)","Lava (all watersheds)","Lava (no WS 8)","Mean Slope","St. Dev. of Slope","Young Landslide Deposits","Moderate Landslide Deposits","Old Landslide Deposits","Total Landslide Deposits","TRI","Segura Damping Ratio","McGuire Damping Ratio","Mean Damping Ratio","Drainage Area (all watersheds)","Drainage Area (no LO)"),
  R2 = c(model_fdc_BFR_slope_r2,model_pyro_BFR_slope_all_r2,model_pyro_BFR_slope_noWS8_r2,model_lava_BFR_slope_all_r2,model_lava_BFR_slope_noWS8_r2,model_meanslope_BFR_slope_r2,model_stdslope_BFR_slope_r2,model_youngdeposits_BFR_slope_r2,model_moderate_deposits_BFR_slope_r2,model_old_deposits_BFR_slope_r2,model_total_deposits_BFR_slope_r2,model_tri_BFR_slope_r2,model_drsegura_BFR_slope_r2,model_drmcguire_BFR_slope_r2,model_drmean_BFR_slope_r2,model_drainage_area_BFR_slope_all_r2,model_drainage_area_BFR_slope_noLO_r2),
  n = c(model_fdc_BFR_slope_n,model_pyro_BFR_slope_all_n,model_pyro_BFR_slope_noWS8_n,model_lava_BFR_slope_all_n,model_lava_BFR_slope_noWS8_n,model_meanslope_BFR_slope_n,model_stdslope_BFR_slope_n,model_youngdeposits_BFR_slope_n,model_moderate_deposits_BFR_slope_n,model_old_deposits_BFR_slope_n,model_total_deposits_BFR_slope_n,model_tri_BFR_slope_n,model_drsegura_BFR_slope_n,model_drmcguire_BFR_slope_n,model_drmean_BFR_slope_n,model_drainage_area_BFR_slope_all_n,model_drainage_area_BFR_slope_noLO_n),
  f = c(model_fdc_BFR_slope_F,model_pyro_BFR_slope_all_F,model_pyro_BFR_slope_noWS8_F,model_lava_BFR_slope_all_F,model_lava_BFR_slope_noWS8_F,model_meanslope_BFR_slope_F,model_stdslope_BFR_slope_F,model_youngdeposits_BFR_slope_F,model_moderate_deposits_BFR_slope_F,model_old_deposits_BFR_slope_F,model_total_deposits_BFR_slope_F,model_tri_BFR_slope_F,model_drsegura_BFR_slope_F,model_drmcguire_BFR_slope_F,model_drmean_BFR_slope_F,model_drainage_area_BFR_slope_all_F,model_drainage_area_BFR_slope_noLO_F),
  p = c(model_fdc_BFR_slope_p,model_pyro_BFR_slope_all_p,model_pyro_BFR_slope_noWS8_p,model_lava_BFR_slope_all_p,model_lava_BFR_slope_noWS8_p,model_meanslope_BFR_slope_p,model_stdslope_BFR_slope_p,model_youngdeposits_BFR_slope_p,model_moderate_deposits_BFR_slope_p,model_old_deposits_BFR_slope_p,model_total_deposits_BFR_slope_p,model_tri_BFR_slope_p,model_drsegura_BFR_slope_p,model_drmcguire_BFR_slope_p,model_drmean_BFR_slope_p,model_drainage_area_BFR_slope_all_p,model_drainage_area_BFR_slope_noLO_p)
)
write.csv(storage_BFR_slope_model_stats_table,"/Volumes/nobackup2/Segura_Lab/4_Students_Post_docts_Folders/2024_Shannon_Duffy/Ch1_LowFlows/Output Data/storage_BFR_slope_model_stats.csv",row.names = FALSE)
