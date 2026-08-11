File prepared by: Shannon Duffy
Date: 6/2/26

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