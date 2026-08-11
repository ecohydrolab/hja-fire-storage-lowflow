File Prepared by: Shannon Duffy
Date: 7/28/2026

This README describes each figure included in the paper and the supplemental information and which scripts to run to create it. Most figures are exported from the scripts to the "Intermediate Figures" folder and then are edited in the "editing_figures.pptx" to make the polished versions included in the paper. These edits include adding signifcance stars and combining and labeling multipanel figures.

Output Data
	-Final Figures
		-Fig1_BurnMap_and_ET.png
		-Fig2_WS9_vs_Mack_hydrographs.png
		-Fig3_lowflow_BACI_plot.png
		-Fig4_lowflow_pctdiff_barplot_labeled.png
		-Fig5_BFR_2_panel.png
		-FigS2_meanQ5_pre_post_fire_and_pct_change_multipanel.png
		-FigS3_FDC_curves_WS123.png
	-Intermediate Figures
		-BFR_grid.png
		-BFR_intercept_barchart.png
		-editing figures.pptx
		-ET_timeseries_burn_severity.png
		-lowflow_pctdiff_barplot_unlabeled.png
		-Mean_Q5_pct_change.png
		-Mean_Q5_pre_post_fire_SD.png

************************************************************************************************************
Fig1_BurnMap_and_ET.png
-This is a 2-panel figure with the map of the HJA watersheds with the vegetation mortality on top and a timeseries of ET within each fire boundary relative to an unburned area on the bottom.
-make this by combining "ET_timeseries_burn_severity.png" and adding A and B boxes in the "editing figures.pptx"

************************************************************************************************************
Fig2_WS9_vs_Mack_hydrographs.png
- this is a 2-panel figure with the hydrograph for the whole wateryear for 2018 in blue and 2025 in red for WS 9 and Mack Creek.
-make this by combining "WS9_2018_2025.png" and "Mack_2018_2025.png" and adding A and B boxes in the "editing figures.pptx"

************************************************************************************************************
Fig3_lowflow_BACI_plot.png
-this shows the prefire regressions and 95% prediction interval between Q5 in burned and unburned watershed pairs and the post-fire data. all 4 watershed pairings are on the plot in different colors. This corresponds to Figure 6 in the thesis
-make this by running codes 1, 2, and 6

************************************************************************************************************
Fig4_lowflow_pctdiff_barplot_labeled.png
-this shows the difference between the observed and predicted Q5 for each burned watershed in each post-fire wateryear with each wateryear color coded and stars indicating years that needed to be excluded because they were outside the range used to fit the regression.
- make this by taking the "lowflow_pctdiff_barplot_unlabeled.png" and adding the exclusion stars, watershed labels, dashed lines separating watersheds, and basal area mortality and storage categories in the "editing figures.pptx"

************************************************************************************************************
Fig5_BFR_2_panel.png
-this is a two panel figure with the parallel pre- and post-fire baseflow recession regressions relating log(Q) to log(dQ/dt) for all 8 watersheds in a grid with the watershed names in red if burned and black if unburned. The bottom panel has a barchart showing the change in intercept for each watershed with burned watersheds in gray and unburned watersheds in white with stars over the bars indicating whether the p-value of the B2 term in the model log(dQ/dt)=B0+B1*log(Q)+B2*Fire was significant.
- Combine "BFR_grid.png" with "BFR_intercept_barchart.png", add significance stars, and add A and B boxes in the "editing figures.pptx"

************************************************************************************************************
FigS2_meanQ5_pre_post_fire_and_pct_change_multipanel.png
-this is a two panel figure with the mean pre-fire Q5 in gray and post-fire Q5 in black with standard deviation error bars for each watershed and the percent percent change between the pre-fire and post-fire period with burned watersheds in gray and unburned watersheds in white using the prefire period beginning in 2000.
-Combine "Mean_Q5_pre_post_fire_SD.png" and "Mean_Q5_pct_change.png" and add the A and B boxes in the "editing figures.pptx"

************************************************************************************************************
FigS3_FDC_curves_WS123.png
-this shows the pre-logging (1953-1961) and pre-fire (2000-2020) FDCs for WS 1, 2, and 3. this corresponds with Appendix Figure D1 in the thesis
-make this by running codes 1, 2, and 8

************************************************************************************************************
"BFR_grid.png"
- This shows the parallel pre- and post-fire baseflow recession regressions relating log(Q) to log(dQ/dt) for all 8 watersheds in a grid with the watershed names in red if burned and black if unburned.
- make this by running codes 1-5
- you need to manually select the start date that is input into code 4. you can visualize the data to help you pick the start date using code 3 but the dates used for the thesis are included in the input data

************************************************************************************************************
"BFR_intercept_barchart.png"
- This shows the percent change in the baseflow recession regression intercept from the pre-fire to post-fire period with burned watersheds in gray and unburned watersheds in white.
- make this by running codes 1-5 and 7
- you need to manually select the start date that is input into code 4. you can visualize the data to help you pick the start date using code 3 but the dates used for the thesis are included in the input data
-code 7 will export the "BFR_intercept_barchart.png"

*************************************************************************************************************
"ET_timeseries_burn_severity.png"
-This shows the timeseries of evapotranspiration from 2020-2025 in the boundary of the Holiday Farm Fire on the top panel and the boundary of the Lookout Fire on the bottom panel in reference to the unburned areas in a black line. Separate lines are drawn for each severity with standard error.
-make this by running code 13 in Google Earth Engine and 14 in Python.
-code 13 will export 3 csvs of monthly ET data- one for each fire boundary and one for the unburned area. These are fed into code 14 which exports this plot.

*************************************************************************************************************
"lowflow_pctdiff_barplot_unlabeled.png"
-this shows the difference between the observed and predicted Q5 for each burned watershed in each post-fire wateryear with each wateryear color coded.
-make this by running codes 1, 2, and 6
- code 6 will export "lowflow_pctdiff_barplot_unlabeled.png"

*************************************************************************************************************
"Mack_2018_2025.png"
-this shows the hydrographs for wateryears 2018 and 2025 in Mack Creek
-make this by running codes 1-4 and 12.
- you need to manually select the start date that is input into code 4. you can visualize the data to help you pick the start date using code 3 but the dates used for the thesis are included in the input data

*************************************************************************************************************
"Mean_Q5_pct_change.png" and "Mean_Q5_pre_post_fire_SD.png"
-this is a two panel figure with the mean pre-fire Q5 in gray and post-fire Q5 in black with standard deviation error bars for each watershed and the percent percent change between the pre-fire and post-fire period with burned watersheds in gray and unburned watersheds in white using the prefire period beginning in 2000.
-make this by running codes 1, 2, and 11.

*************************************************************************************************************
"WS9_2018_2025.png"
-this shows the hydrographs for wateryears 2018 and 2025 in WS9
-make this by running codes 1-4 and 12.
- you need to manually select the start date that is input into code 4. you can visualize the data to help you pick the start date using code 3 but the dates used for the thesis are included in the input data
