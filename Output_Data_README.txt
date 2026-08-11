File Prepared by: Shannon Duffy
Date: 7/28/2026

This README describes each csv and what codes need to be run to create it. The csvs contain all of the metrics and statistics reported in the paper.

**********************************************************************************************************
BACI_model_stats.csv
-this file reports the R2, n, F statistic, and p-value of the linear regressions relating pre-fire Q5 for each burned/unburned watershed pairing
-make this by running codes 1, 2, and 6
-code 1 will export a csv called "Daily_meanQ_allsites_1950_2025.csv" which has daily Q in mm/s far all watersheds from 1950-2025. this will be input into code 2 which will export the "5thPercentileFlows_nofall_2000_2025.csv" which has the 5th percentile flow for each watershed and every wateryear in our selected pre-fire and post-fire period (2000-2025) excluding October data. this will be input into code 6 which exports this csv

**********************************************************************************************************
BFR_intercepts.csv
-this file reports the pre-fire slope of the regression between log(Q) and log(dQ/dt) (which is held constant for the post-fire data), the pre-fire intercept and associated confidence interval, the post-fire intercept and associated confidence interval, and the percent change from the pre-fire to post-fire period for every watershed.
-make this by running codes 1-5 and 7
-code 1 will export a csv called "Daily_meanQ_allsites_1950_2025.csv" which has daily Q in mm/s far all watersheds from 1950-2025. this will be input into code 2 which will export the "5thPercentileFlows_nofall_2000_2025.csv" which has the 5th percentile flow for each watershed and every wateryear in our selected pre-fire and post-fire period (2000-2025) excluding October data. "Daily_meanQ_allsites_1950_2025.csv" will also be in put into code 3 which helps you manually pick a start date for the recession period for every watershed/wateryear pairing. The ones we used are included in the input data. Then code 4 takes "Daily_meanQ_allsites_1950_2025.csv", "5thPercentileFlows_nofall_2000_2025.csv", and "Recession_start_date.csv" and exports "Date_of_Q5.csv" which has the date when Q5 is hit for each wateryear & watershed and "Filtered_Recession_Period_Q.csv" which has the daily Q in mm/s from 2000-2025 for all watersheds but dates outside the recession period (before the recession start date or after the Q5 date) are set to NaN. "Filtered_Recession_Period_Q.csv" is input into code 5 which exports a file called "recession_Q_vs_dQdt_points_{watershed}.csv" for each watershed that has each pair of log(Q) and log(dQ/dt) with a column distinguishing pre-fire and post-fire points. these csvs are input into code 7 which exports this csv

**********************************************************************************************************
BFR_model_stats.csv
-this file reports the R2 and n for the model log(dQ/dt)=B0+B1*log(Q)+B2*Fire and the F statistic and p-value for B2 for every watershed
-make this by running codes 1-5 and 7
-code 1 will export a csv called "Daily_meanQ_allsites_1950_2025.csv" which has daily Q in mm/s far all watersheds from 1950-2025. this will be input into code 2 which will export the "5thPercentileFlows_nofall_2000_2025.csv" which has the 5th percentile flow for each watershed and every wateryear in our selected pre-fire and post-fire period (2000-2025) excluding October data. "Daily_meanQ_allsites_1950_2025.csv" will also be in put into code 3 which helps you manually pick a start date for the recession period for every watershed/wateryear pairing. The ones we used are included in the Input Data. The code 4 takes "Daily_meanQ_allsites_1950_2025.csv", "5thPercentileFlows_nofall_2000_2025.csv", and "Recession_start_date.csv" and exports "Date_of_Q5.csv" which has the date when Q5 is hit for each wateryear & watershed and "Filtered_Recession_Period_Q.csv" which has the daily Q in mm/s from 2000-2025 for all watersheds but dates outside the recession period (before the recession start date or after the Q5 date) are set to NaN. "Filtered_Recession_Period_Q.csv" is input into code 5 which exports a file called "recession_Q_vs_dQdt_points_{watershed}.csv" for each watershed that has each pair of log(Q) and log(dQ/dt) with a column distinguishing pre-fire and post-fire points. these csvs are input into code 7 which exports this csv

**********************************************************************************************************
"change_in_annual_ET.csv"
-this file has the percent differences between total annual ET for each postfire wateryear realtive to the the pre-fire mean for each watershed.
-make this by running code 13 in Google Earth Engine and code 14 in Python
-code 13 will export 3 csvs of monthly ET data- one for each fire boundary and one for the unburned area. These are fed into code 14 which exports this csv.

**********************************************************************************************************
"{watershed}_change_in_monthly_ET.csv"
-this file has the percent differences between the average monthly ET for each postfire wateryear realtive to the the pre-fire mean for the given watershed.
-make this by running code 13 in Google Earth Engine and code 14 in Python
-code 13 will export 3 csvs of monthly ET data- one for each fire boundary and one for the unburned area. These are fed into code 14 which exports this csv.

**********************************************************************************************************
"mean_Q5_stdev.csv"
-this file shows the prefire mean and standard deviation of Q5 for each watershed and how many standard deviations from the prefire mean the watershed was in each year from 2020-2025. In the columns "Outlier 2020", "Outlier 2021" and so forth, "Normal" means within 2 standard deviations of the prefire mean, "High" means more than 2 standard deviations above the prefire mean, and "Low" means more than 2 standard deviations below the prefire mean.
-make this by running codes 1 and 2
-code 1 will export a csv called "Daily_meanQ_allsites_1950_2025.csv" which has daily Q in mm/s far all watersheds from 1950-2025. this will be input into code 2 which will export this csv

**********************************************************************************************************
storage_BFR_slope_model_stats.csv
-this file reports the R2, n, F statistic, and p-value of the linear regressions relating the slope of the relationship between log(Q) and log(dQ/dt) to each storage predictor variable across the eight watersheds
-make this by running codes 1-5, 7, and 9-10
-code 1 will export a csv called "Daily_meanQ_allsites_1950_2025.csv" which has daily Q in mm/s far all watersheds from 1950-2025. this will be input into code 2 which will export the "5thPercentileFlows_nofall_2000_2025.csv" which has the 5th percentile flow for each watershed and every wateryear in our selected pre-fire and post-fire period (2000-2025) excluding October data. "Daily_meanQ_allsites_1950_2025.csv" will also be in put into code 3 which helps you manually pick a start date for the recession period for every watershed/wateryear pairing. The ones we used are included in the input data. Then code 4 takes "Daily_meanQ_allsites_1950_2025.csv", "5thPercentileFlows_nofall_2000_2025.csv", and "Recession_start_date.csv" and exports "Date_of_Q5.csv" which has the date when Q5 is hit for each wateryear & watershed and "Filtered_Recession_Period_Q.csv" which has the daily Q in mm/s from 2000-2025 for all watersheds but dates outside the recession period (before the recession start date or after the Q5 date) are set to NaN. "Filtered_Recession_Period_Q.csv" is input into code 5 which exports a file called "recession_Q_vs_dQdt_points_{watershed}.csv" for each watershed that has each pair of log(Q) and log(dQ/dt) with a column distinguishing pre-fire and post-fire points. these csvs are input into code 7 which exports "BFR_intercepts.csv" which has the slope of log(Q) and log(dQ/dt). code 9 takes "5thPercentileFlows_nofall_2000_2025.csv","BFR_intercepts.csv", and the "storage_literature.csv" from the Input Data and exports the "storage_lowflow_predictors.csv" which has the mean pre-fire Q5 and the value for each storage predictor for each watershed. this is input into code 10 which exports this csv

**********************************************************************************************************
storage_lowflows_model_stats.csv
-this file reports the R2, n, F statistic, and p-value of the linear regressions relating the average pre-fire Q5 to each storage predictor variable across the eight watersheds
-make this by running codes 1-5, 7, and 9-10
-code 1 will export a csv called "Daily_meanQ_allsites_1950_2025.csv" which has daily Q in mm/s far all watersheds from 1950-2025. this will be input into code 2 which will export the "5thPercentileFlows_nofall_2000_2025.csv" which has the 5th percentile flow for each watershed and every wateryear in our selected pre-fire and post-fire period (2000-2025) excluding October data. "Daily_meanQ_allsites_1950_2025.csv" will also be in put into code 3 which helps you manually pick a start date for the recession period for every watershed/wateryear pairing. The ones we used are included in the input data. Then code 4 takes "Daily_meanQ_allsites_1950_2025.csv", "5thPercentileFlows_nofall_2000_2025.csv", and "Recession_start_date.csv" and exports "Date_of_Q5.csv" which has the date when Q5 is hit for each wateryear & watershed and "Filtered_Recession_Period_Q.csv" which has the daily Q in mm/s from 2000-2025 for all watersheds but dates outside the recession period (before the recession start date or after the Q5 date) are set to NaN. "Filtered_Recession_Period_Q.csv" is input into code 5 which exports a file called "recession_Q_vs_dQdt_points_{watershed}.csv" for each watershed that has each pair of log(Q) and log(dQ/dt) with a column distinguishing pre-fire and post-fire points. these csvs are input into code 7 which exports "BFR_intercepts.csv" which has the slope of log(Q) and log(dQ/dt). code 9 takes "5thPercentileFlows_nofall_2000_2025.csv","BFR_intercepts.csv", and the "storage_literature.csv" from the Input Data and exports the "storage_lowflow_predictors.csv" which has the mean pre-fire Q5 and the value for each storage predictor for each watershed. this is input into code 10 which exports this csv



