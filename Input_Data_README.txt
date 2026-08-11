File prepared by: Shannon Duffy
Date: 7/28/26

This is a list of the files in the "Input Data" folder.
Input Data
	-ET
		-OpenET_mean_2020_2025_byseverity_HFF.csv
		-OpenET_mean_2020_2025_byseverity_LF.csv
		-OpenET_mean_2020_2025_bywatershed.csv
		-OpenET_mean_2020_2025_unburned.csv
	-Streamflow
		-Q_all_sites_provisional_2015_2025.csv
		-Q_Lookout_USGS_2000_2025.csv
		-Q_all_sites_1950_2024.csv
	-Recession_start_date.csv
	-storage_literature.csv

This is a description of the contents of each file.
********************************************************************************************************
OpenET_mean_2020_2025_byseverity_HFF.csv
- Mean evapotranspiration rates in monthly intervals from 2020-2025 from OpenET within the burn boundary of the Holiday Farm Fire grouped by vegetation mortality classification.
- Obtained by running script 18 in Google Earth Engine.
-Columns:
	-gridcode: burn severity classification (0 = unburned, 1 = <25 %, 2 = 25-75%, 3 = >75% vegetation mortality)
	-month: year and month (ie. 20202_01 = January 2020)
	-date: month formatted as a date using the first day of the month (%mm/%dd%yyyy)
	-mean: mean total monthly ET in mm across the pixels within the burn severity group
	-stdDev: standard deviation across the pixels
	-standard_error: standard error across the pixels
	-count: number of pixels
********************************************************************************************************
OpenET_mean_2020_2025_byseverity_LF.csv
- Mean evapotranspiration rates in monthly intervals from 2020-2025 from OpenET within the burn boundary of the Lookout Fire grouped by vegetation mortality classification.
- Obtained by running script 18 in Google Earth Engine.
-Columns:
	-gridcode: burn severity classification (0 = unburned, 1 = <25 %, 2 = 25-75%, 3 = >75% vegetation mortality)
	-month: year and month (ie. 20202_01 = January 2020)
	-date: month formatted as a date using the first day of the month (%mm/%dd%yyyy)
	-mean: mean total monthly ET in mm across the pixels within the burn severity group
	-stdDev: standard deviation across the pixels
	-standard_error: standard error across the pixels
	-count: number of pixels
********************************************************************************************************
OpenET_mean_2020_2025_bywatershed.csv
- Mean evapotranspiration rates in monthly intervals from 2020-2025 from OpenET within the boundary of each gauged watershed.
- Obtained by running script 18 in Google Earth Engine.
-Columns:
	-Wshed_Name: name of the watershed (the numbered watersheds are referred to as just their number ie. "WS 1" is just "1")
	-month: year and month (ie. 20202_01 = January 2020)
	-date: month formatted as a date using the first day of the month (%mm/%dd%yyyy)
	-mean: mean total monthly ET in mm across the pixels within the burn severity group
	-stdDev: standard deviation across the pixels
	-standard_error: standard error across the pixels
	-count: number of pixels

********************************************************************************************************
-OpenET_mean_2020_2025_unburned.csv
- Mean evapotranspiration rates in monthly intervals from 2020-2025 from OpenET across all pixels which were not burned in either the Lookout Fire or the Holiday Farm Fire
- Obtained by running script 18 in Google Earth Engine.
-Columns:
	-gridcode: left blank
	-month: year and month (ie. 20202_01 = January 2020)
	-date: month formatted as a date using the first day of the month (%mm/%dd%yyyy)
	-mean: mean total monthly ET in mm across the pixels within the burn severity group
	-stdDev: standard deviation across the pixels
	-standard_error: standard error across the pixels
	-count: number of pixels

********************************************************************************************************
Q_all_sites_provisional_2015_2025.csv
- provisional discharge data for all gaged watersheds from 2015-2025 in 5-min intervals
-downloaded from provisional data portal --> DISCHARGE --> discharge_5min_merged
-https://andrewsforest.oregonstate.edu/sites/default/files/lter/data/weather/portal/DISCHARGE/data/index.html
-Columns:
	-DataSetName
	-Site
	-Date: Date and time in MM/DD/YYYY hh:mm
	-{watershed acronym}_DISCHARGE_0_0_01: instantaneous discharge from given watershed in cfs
	-Flag_{watershed acronym}_DISCHARGE_0_0_01: error code (want blanks)
*********************************************************************************************************
Q_Lookout_USGS_2000_2025.csv
-whole record of daily mean discharge data for Lookout Creek from the USGS (Use the published HJA data for this site, but use this data for dates beyond the published HJA data)
-downloaded from USGS water data for the nation: https://waterdata.usgs.gov/monitoring-location/USGS-14161500/#dataTypeId=daily-00060-0&period=periodOfRecord&showFieldMeasurements=false
-Columns:
	-x: lattitude in decimal degrees
	-y: longitude in decimal degrees
	-id
	-time_series_id
	-monitoring_location_id
	-parameter_code
	-statistic_id
	-time: date in MM/DD/YYYY
	-value: mean daily discharge in cfs
	-unit_of_measure
	-approval_status: Provisional or Approved status
	-qualifier: QA/QC code (as long as status is "Approved", then this doesn't matter)
	-last_modified
*********************************************************************************************************
Q_all_sites_1950_2024.csv
-published daily discharge data for all gaged watersheds of the HJA for whole period of record (1950-2024)
-donwloaded from dataset HF004 (don't query)
-Columns:
	-STCODE
	-FORMAT
	-SITECODE
	-WATERYEAR
	-DATE: date in MM/DD/YYYY format
	-MEAN_Q: mean daily discharge in cfs
	-MAX_Q: maximum daily discharge in cfs
	-MIN_Q: minimum daily discharge in cfs
	-MEAN_Q_AREA: mean daily unit discharge (MEAN_Q / drainage area)
	-TOTAL_Q_AREA: total discharge in inches of water (over the watershed area) over the whole day
	-ESTCODE: error code (you want A or E)

********************************************************************************************************
Recession_start_date.csv
-identified start date of the summer recession period for each watershed and wateryear from 2000-2025. These are the dates we identified.
-Columns
	-WATERYEAR
	-each watershed name
-The start date has to be manually identified. you can visualize the data using codes 1 and 3. In code 3 you can hover over the hydrograph for the watershed and wateryear and find the final qualifying peak at the start of the summer recession period.

********************************************************************************************************
storage_literature.csv
-data from the literature used as metrics of storage
-Columns
	-Watershed: abbreviation of watershed name
	-DR_MCGUIRE: mean damping ratio from McGuire et al. 2005: https://doi.org/10.1029/2004WR003657
	-DR_SEGURA: mean damping ratio Ortega et al., 2025: https://doi.org/10.1002/hyp.70241
	-YOUNG_DEPOSITS: % of drainage area underlain by young landslide deposits (< 1,000 years old)
	-MODERATE_DEPOSITS: % of drainage area underlain by moderate landslide deposits (1,000-10,000 years old)
	-OLD_DEPOSITS: % of drainage area underlain by old landslide deposits (> 10,000 years old)
	-TOTAL_DEPOSITS: % of drainage area underlain by all landslide deposits
	-LAVA_1: % of drainage area underlain by younger ridge-capping lava flows
	-LAVA_2: % of drainage area underlain by older lava flows
	-FDC_SLOPE: slope of the flow duration curve

-Origins of each dataset:
	-damping ratios obtained from "C:\Users\duffshan\Box\damping-rations_2025-07-07_with_differences.xlsx"
		-***NEED TO FIND LOCATION ON T DRIVE***
	-landslides, geology, slope, and drainage area obtained from HJA storage table: "T:\Segura_Lab\1_Research_Projectcs\HJA\Catchment_characteristics_2026-04-30.xlsx"
	-FDC obtained from Bush et al., In Prep

