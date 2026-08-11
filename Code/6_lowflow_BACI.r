#inputs
totalrecord<-read.csv("/Volumes/nobackup2/Segura_Lab/4_Students_Post_docts_Folders/2024_Shannon_Duffy/Ch1_LowFlows/Output Data/5thPercentileFlows_nofall_2000_2025.csv")
#trim record to before and after each fire
preHoliday<-subset(totalrecord,WATERYEAR>1999)
preHoliday<-subset(preHoliday,WATERYEAR<2021)
preLookout<-subset(totalrecord,WATERYEAR>1999)
preLookout<-subset(preLookout,WATERYEAR<2024)
postHoliday<-subset(totalrecord,WATERYEAR>2020)
postHoliday<-subset(postHoliday,WATERYEAR<2026)
postLookout<-subset(totalrecord,WATERYEAR>2023)
postLookout<-subset(postLookout,WATERYEAR<2026)

#make pre-fire regression between each unburned and burned watershed pairing and print out model summary
#WS 1 and WS 3
regws3ws1<-lm(GSWS01~GSWS03, data = preHoliday)
summary(regws3ws1)
regws3ws1_r2<-summary(regws3ws1)$adj.r.squared
regws3ws1_F<-summary(regws3ws1)$fstatistic[1]
regws3ws1_p<-pf(summary(regws3ws1)$fstatistic[1],summary(regws3ws1)$fstatistic[2],summary(regws3ws1)$fstatistic[3],lower.tail = FALSE)
#WS 2 and WS 3
regws3ws2<-lm(GSWS02~GSWS03, data = preHoliday)
summary(regws3ws2)
regws3ws2_r2<-summary(regws3ws2)$adj.r.squared
regws3ws2_F<-summary(regws3ws2)$fstatistic[1]
regws3ws2_p<-pf(summary(regws3ws2)$fstatistic[1],summary(regws3ws2)$fstatistic[2],summary(regws3ws2)$fstatistic[3],lower.tail = FALSE)
#WS 9 and WS 10
regws10ws9<-lm(GSWS09~GSWS10, data = preHoliday)
summary(regws10ws9)
regws10ws9_r2<-summary(regws10ws9)$adj.r.squared
regws10ws9_F<-summary(regws10ws9)$fstatistic[1]
regws10ws9_p<-pf(summary(regws10ws9)$fstatistic[1],summary(regws10ws9)$fstatistic[2],summary(regws10ws9)$fstatistic[3],lower.tail = FALSE)
#MC and WS 8
regws8mack<-lm(GSWSMC~GSWS08, data = preLookout)
summary(regws8mack)
regws8mack_r2<-summary(regws8mack)$adj.r.squared
regws8mack_F<-summary(regws8mack)$fstatistic[1]
regws8mack_p<-pf(summary(regws8mack)$fstatistic[1],summary(regws8mack)$fstatistic[2],summary(regws8mack)$fstatistic[3],lower.tail = FALSE)

#make summary statistics table
BACI_model_stats_table<- data.frame(
  Unburned_Watershed = c("WS 3","WS 3","WS 10","WS 8"),
  Burned_Watershed = c("WS 1","WS 2","WS 9","MC"),
  R2 = c(regws3ws1_r2,regws3ws2_r2,regws10ws9_r2,regws8mack_r2),
  n = c(21,21,21,24),
  f = c(regws3ws1_F,regws3ws2_F,regws10ws9_F,regws8mack_F),
  p = c(regws3ws1_p,regws3ws2_p,regws10ws9_p,regws8mack_p)
)
write.csv(BACI_model_stats_table,"/Volumes/nobackup2/Segura_Lab/4_Students_Post_docts_Folders/2024_Shannon_Duffy/Ch1_LowFlows/Output Data/BACI_model_stats.csv",row.names = FALSE)

#create BACI regression figure with all four watersheds
dev.new(width=7, height=7, unit="in")
png(file="/Volumes/nobackup2/Segura_Lab/4_Students_Post_docts_Folders/2024_Shannon_Duffy/Ch1_LowFlows/Output Figures/lowflow_BACI_plot.png")
par(mar=c(9,6,1,1),bg="white")
newx1limit <- seq(min(preHoliday$GSWS03), max(preHoliday$GSWS03), by=0.01*10^(-6))
pred_intervallimit <- predict(regws3ws1, newdata=data.frame(GSWS03=newx1limit), interval="prediction",level = 0.95)
plot(newx1limit, pred_intervallimit[,2], col="black", type="l",lty=2,ylim = c(0,6*10^(-6)), xlim=c(0,3.25*10^(-6)),xaxt = "n", yaxt = "n",,cex.lab = 1.75,xlab = expression(paste("Unburned Watershed Q"[5], " (10"^"-6"," mm/s)")),ylab=expression(paste("Burned Watershed Q"[5], " (10"^"-6"," mm/s)")))
custom_ticks_x <- seq(0, 3.25e-6, by = 0.5e-6)
custom_ticks_y <- seq(0, 6e-6, by = 1e-6)
axis(2, at = custom_ticks_y, labels = custom_ticks_y * 1e6)
axis(1, at = custom_ticks_x, labels = custom_ticks_x * 1e6)
lines(newx1limit, pred_intervallimit[,1], col="#0000A8", lty=1)
lines(newx1limit, pred_intervallimit[,2], col="#0000A8", lty=2)
lines(newx1limit, pred_intervallimit[,3], col="#0000A8", lty=2)
newx2limit <- seq(min(preHoliday$GSWS03), max(preHoliday$GSWS03), by=0.01*10^(-6))
pred_interval2limit <- predict(regws3ws2, newdata=data.frame(GSWS03=newx2limit), interval="prediction",level = 0.95)
lines(newx2limit, pred_interval2limit[,1], col="#A80000", lty=1)
lines(newx2limit, pred_interval2limit[,2], col="#A80000", lty=2)
lines(newx2limit, pred_interval2limit[,3], col="#A80000", lty=2)
newx3limit <- seq(min(preHoliday$GSWS10), max(preHoliday$GSWS10), by=0.01*10^(-6))
pred_interval3limit <- predict(regws10ws9, newdata=data.frame(GSWS10=newx3limit), interval="prediction",level = 0.95)
lines(newx3limit, pred_interval3limit[,1], col="#FFB700", lty=1)
lines(newx3limit, pred_interval3limit[,2], col="#FFB700", lty=2)
lines(newx3limit, pred_interval3limit[,3], col="#FFB700", lty=2)
newx4limit <- seq(min(preLookout$GSWS08), max(preLookout$GSWS08), by=0.01*10^(-6))
pred_interval4limit <- predict(regws8mack, newdata=data.frame(GSWS08=newx4limit), interval="prediction",level = 0.95)
lines(newx4limit, pred_interval4limit[,1], col="#71C1FF", lty=1)
lines(newx4limit, pred_interval4limit[,2], col="#71C1FF", lty=2)
lines(newx4limit, pred_interval4limit[,3], col="#71C1FF", lty=2)
points(preHoliday$GSWS03,preHoliday$GSWS01, pch= 1,col="#0000a8")
points(preHoliday$GSWS03,preHoliday$GSWS02, pch= 1,col="#a80000")
points(preHoliday$GSWS10,preHoliday$GSWS09, pch= 1,col="#FFB700")
points(preLookout$GSWS08,preLookout$GSWSMC,pch= 1,col="#71C1FF")
points(postLookout$GSWS08,postLookout$GSWSMC, pch= 17,col="#71C1FF")
text(postLookout$GSWS08,postLookout$GSWSMC, labels = postLookout$WATERYEAR, pos=2, col="#71C1FF")
points(postHoliday$GSWS03,postHoliday$GSWS01, pch= 17,col="#0000a8")
text(postHoliday$GSWS03,postHoliday$GSWS01, labels = postHoliday$WATERYEAR, pos=2, col="#0000A8")
points(postHoliday$GSWS03,postHoliday$GSWS02, pch= 17,col="#A80000")
text(postHoliday$GSWS03,postHoliday$GSWS02, labels = postHoliday$WATERYEAR, pos=2, col="#A80000")
points(postHoliday$GSWS10,postHoliday$GSWS09, pch= 17,col="#FFB700")
text(postHoliday$GSWS10,postHoliday$GSWS09, labels = postHoliday$WATERYEAR, pos=2, col="#FFB700")
legend(2e-6,6.25e-6,legend=c("WS 3 vs WS 1", "WS 3 vs WS 2", "WS 10 vs WS 9","WS 8 vs MC"),col=c("#0000A8","#A80000","#FFB700","#71C1FF"),lty=c(1,1,1,1),lwd=3, bty="n", cex = 0.9)
legend(2.175e-6,5.35e-6,legend=c("Pre-fire","Post-fire"), pch = c(1,17),bty="n", cex = 0.9)
legend(2e-6,4.95e-6,legend=c("Regression Line","95% Prediction Interval"), lty=c(1,2),bty="n", cex = 0.9)
dev.off()

#find what Q5 was in each unburned watershed in each post-fire water year
WS32021<-postHoliday[postHoliday[,'WATERYEAR']==2021,'GSWS03']
WS32022<-postHoliday[postHoliday[,'WATERYEAR']==2022,'GSWS03']
WS32023<-postHoliday[postHoliday[,'WATERYEAR']==2023,'GSWS03']
WS32024<-postHoliday[postHoliday[,'WATERYEAR']==2024,'GSWS03']
WS32025<-postHoliday[postHoliday[,'WATERYEAR']==2025,'GSWS03']
WS102021<-postHoliday[postHoliday[,'WATERYEAR']==2021,'GSWS10']
WS102022<-postHoliday[postHoliday[,'WATERYEAR']==2022,'GSWS10']
WS102023<-postHoliday[postHoliday[,'WATERYEAR']==2023,'GSWS10']
WS102024<-postHoliday[postHoliday[,'WATERYEAR']==2024,'GSWS10']
WS102025<-postHoliday[postHoliday[,'WATERYEAR']==2025,'GSWS10']
WS82024<-postLookout[postLookout[,'WATERYEAR']==2024,'GSWS08']
WS82025<-postLookout[postLookout[,'WATERYEAR']==2025,'GSWS08']

#find 95% prediction range of what the burned watershed Q5 is predicted to be for each post-fire water year given the Q5 in the unburned watershed
WS1pred2021<-predict(regws3ws1,newdata=data.frame(GSWS03=WS32021),interval="prediction", level=0.95)
WS1pred2022<-predict(regws3ws1,newdata=data.frame(GSWS03=WS32022),interval="prediction", level=0.95)
WS1pred2023<-predict(regws3ws1,newdata=data.frame(GSWS03=WS32023),interval="prediction", level=0.95)
WS1pred2024<-predict(regws3ws1,newdata=data.frame(GSWS03=WS32024),interval="prediction", level=0.95)
WS1pred2025<-predict(regws3ws1,newdata=data.frame(GSWS03=WS32025),interval="prediction", level=0.95)
WS2pred2021<-predict(regws3ws2,newdata=data.frame(GSWS03=WS32021),interval="prediction", level=0.95)
WS2pred2022<-predict(regws3ws2,newdata=data.frame(GSWS03=WS32022),interval="prediction", level=0.95)
WS2pred2023<-predict(regws3ws2,newdata=data.frame(GSWS03=WS32023),interval="prediction", level=0.95)
WS2pred2024<-predict(regws3ws2,newdata=data.frame(GSWS03=WS32024),interval="prediction", level=0.95)
WS2pred2025<-predict(regws3ws2,newdata=data.frame(GSWS03=WS32025),interval="prediction", level=0.95)
WS9pred2021<-predict(regws10ws9,newdata=data.frame(GSWS10=WS102021),interval="prediction", level=0.95)
WS9pred2022<-predict(regws10ws9,newdata=data.frame(GSWS10=WS102022),interval="prediction", level=0.95)
WS9pred2023<-predict(regws10ws9,newdata=data.frame(GSWS10=WS102023),interval="prediction", level=0.95)
WS9pred2024<-predict(regws10ws9,newdata=data.frame(GSWS10=WS102024),interval="prediction", level=0.95)
WS9pred2025<-predict(regws10ws9,newdata=data.frame(GSWS10=WS102025),interval="prediction", level=0.95)
MCpred2024<-predict(regws8mack,newdata=data.frame(GSWS08=WS82024),interval="prediction", level=0.95)
MCpred2025<-predict(regws8mack,newdata=data.frame(GSWS08=WS82025),interval="prediction", level=0.95)

#find the observed Q5 value in each burned watershed in each post-fire water year
WS12021<-postHoliday[postHoliday[,'WATERYEAR']==2021,'GSWS01']
WS12022<-postHoliday[postHoliday[,'WATERYEAR']==2022,'GSWS01']
WS12023<-postHoliday[postHoliday[,'WATERYEAR']==2023,'GSWS01']
WS12024<-postHoliday[postHoliday[,'WATERYEAR']==2024,'GSWS01']
WS12025<-postHoliday[postHoliday[,'WATERYEAR']==2025,'GSWS01']
WS22021<-postHoliday[postHoliday[,'WATERYEAR']==2021,'GSWS02']
WS22022<-postHoliday[postHoliday[,'WATERYEAR']==2022,'GSWS02']
WS22023<-postHoliday[postHoliday[,'WATERYEAR']==2023,'GSWS02']
WS22024<-postHoliday[postHoliday[,'WATERYEAR']==2024,'GSWS02']
WS22025<-postHoliday[postHoliday[,'WATERYEAR']==2025,'GSWS02']
WS92021<-postHoliday[postHoliday[,'WATERYEAR']==2021,'GSWS09']
WS92022<-postHoliday[postHoliday[,'WATERYEAR']==2022,'GSWS09']
WS92023<-postHoliday[postHoliday[,'WATERYEAR']==2023,'GSWS09']
WS92024<-postHoliday[postHoliday[,'WATERYEAR']==2024,'GSWS09']
WS92025<-postHoliday[postHoliday[,'WATERYEAR']==2025,'GSWS09']
MC2024<-postLookout[postLookout[,'WATERYEAR']==2024,'GSWSMC']
MC2025<-postLookout[postLookout[,'WATERYEAR']==2025,'GSWSMC']

# calculate % difference of observed and mean predicted Q5 in each burned watershed
pctdiff_WS12021<-100*(WS12021-WS1pred2021[1])/WS1pred2021[1]
pctdiff_WS12022<-100*(WS12022-WS1pred2022[1])/WS1pred2022[1]
pctdiff_WS12023<-100*(WS12023-WS1pred2023[1])/WS1pred2023[1]
pctdiff_WS12024<-100*(WS12024-WS1pred2024[1])/WS1pred2024[1]
pctdiff_WS12025<-100*(WS12025-WS1pred2025[1])/WS1pred2025[1]
pctdiff_WS22021<-100*(WS22021-WS2pred2021[1])/WS2pred2021[1]
pctdiff_WS22022<-100*(WS22022-WS2pred2022[1])/WS2pred2022[1]
pctdiff_WS22023<-100*(WS22023-WS2pred2023[1])/WS2pred2023[1]
pctdiff_WS22024<-100*(WS22024-WS2pred2024[1])/WS2pred2024[1]
pctdiff_WS22025<-100*(WS22025-WS2pred2025[1])/WS2pred2025[1]
pctdiff_WS92021<-100*(WS92021-WS9pred2021[1])/WS9pred2021[1]
pctdiff_WS92022<-100*(WS92022-WS9pred2022[1])/WS9pred2022[1]
pctdiff_WS92023<-100*(WS92023-WS9pred2023[1])/WS9pred2023[1]
pctdiff_WS92024<-100*(WS92024-WS9pred2024[1])/WS9pred2024[1]
pctdiff_WS92025<-100*(WS92025-WS9pred2025[1])/WS9pred2025[1]
pctdiff_MC2024<-100*(MC2024-MCpred2024[1])/MCpred2024[1]
pctdiff_MC2025<-100*(MC2025-MCpred2025[1])/MCpred2025[1]

#print the values
print(pctdiff_WS12021)
print(pctdiff_WS12022)
print(pctdiff_WS12023)
print(pctdiff_WS12024)
print(pctdiff_WS12025)
print(pctdiff_WS22021)
print(pctdiff_WS22022)
print(pctdiff_WS22023)
print(pctdiff_WS22024)
print(pctdiff_WS22025)
print(pctdiff_WS92021)
print(pctdiff_WS92022)
print(pctdiff_WS92023)
print(pctdiff_WS92024)
print(pctdiff_WS92025)
print(pctdiff_MC2024)
print(pctdiff_MC2025)
print(mean(c(pctdiff_WS12022,pctdiff_WS12023,pctdiff_WS12024,pctdiff_WS12025)))
print(mean(c(pctdiff_WS22022,pctdiff_WS22023,pctdiff_WS22024,pctdiff_WS22025)))
print(mean(c(pctdiff_WS92022,pctdiff_WS92024,pctdiff_WS92025)))
print(mean(c(pctdiff_MC2024,pctdiff_MC2025)))

#make a new figure with a barplot for the pct difference for each watershed and each post-fire water year
dev.new(width=4, height=4, unit="in")
png(file="/Volumes/nobackup2/Segura_Lab/4_Students_Post_docts_Folders/2024_Shannon_Duffy/Ch1_LowFlows/Output Figures/lowflow_pctdiff_barplot_unlabeled.png")
par(mar=c(1,5,1,0), bg="white")
barplot(c(pctdiff_WS12021,pctdiff_WS12022,pctdiff_WS12023,pctdiff_WS12024,pctdiff_WS12025,NA,pctdiff_WS22021,pctdiff_WS22022,pctdiff_WS22023,pctdiff_WS22024,pctdiff_WS22025,NA,pctdiff_WS92021,pctdiff_WS92022,pctdiff_WS92023,pctdiff_WS92024,pctdiff_WS92025,NA,pctdiff_MC2024,pctdiff_MC2025), 
        col=c("black","gray20","gray40","gray60","gray80","gray80","black","gray20","gray40","gray60","gray80","gray80","black","gray20","gray40","gray60","gray80","gray80","gray60","gray80"),yaxt = "n",ylim=c(-100,300),ylab = expression(paste("Observed - Predicted Q"[5], " (%)")),cex.lab = 1.75, cex.axis = 1.25)
axis(2, at = c(-50,0,50,100,150,200,250,300))
abline(h=0, col="black", lty=1, lwd=1)
legend("topleft",legend=c("2021", "2022", "2023","2024","2025","Excluded"),fill=c("black","gray20","gray40","gray60","gray80","white"),cex=1.25)
dev.off()

#calculate ratio of observed to upper predicted
# calculate % difference of observed and mean predicted Q5 in each burned watershed
opir_WS12021<-WS12021/WS1pred2021[3]
opir_WS12022<-WS12022/WS1pred2022[3]
opir_WS12023<-WS12023/WS1pred2023[3]
opir_WS12024<-WS12024/WS1pred2024[3]
opir_WS12025<-WS12025/WS1pred2025[3]
opir_WS22021<-WS22021/WS2pred2021[3]
opir_WS22022<-WS22022/WS2pred2022[3]
opir_WS22023<-WS22023/WS2pred2023[3]
opir_WS22024<-WS22024/WS2pred2024[3]
opir_WS22025<-WS22025/WS2pred2025[3]
opir_WS92021<-WS92021/WS9pred2021[3]
opir_WS92022<-WS92022/WS9pred2022[3]
opir_WS92023<-WS92023/WS9pred2023[3]
opir_WS92024<-WS92024/WS9pred2024[3]
opir_WS92025<-WS92025/WS9pred2025[3]
opir_MC2024<-MC2024/MCpred2024[3]
opir_MC2025<-MC2025/MCpred2025[3]

#print the values
print(opir_WS12021)
print(opir_WS12022)
print(opir_WS12023)
print(opir_WS12024)
print(opir_WS12025)
print(opir_WS22021)
print(opir_WS22022)
print(opir_WS22023)
print(opir_WS22024)
print(opir_WS22025)
print(opir_WS92021)
print(opir_WS92022)
print(opir_WS92023)
print(opir_WS92024)
print(opir_WS92025)
print(opir_MC2024)
print(opir_MC2025)
print(mean(c(opir_WS12022,opir_WS12023,opir_WS12024,opir_WS12025)))
print(mean(c(opir_WS22022,opir_WS22023,opir_WS22024,opir_WS22025)))
print(mean(c(opir_WS92022,opir_WS92024,opir_WS92025)))
print(mean(c(opir_MC2024,opir_MC2025)))