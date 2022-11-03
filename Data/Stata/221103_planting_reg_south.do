**********************************************
* This code is trying to regress planting size with regression
* Relevant plant data and county size data added
* New crop returns added
* Created by: Bingcai Liu
* Date: 11-03-2022
**********************************************

** Datasets:
** 220404: estimate planting using tree 5 <= STDAGE <= 25


***********************************
** Regressions in paper
** 2022-03-15
** Bingcai Liu
***********************************

**** Direct regressions
** no harvest, no price change
rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 2008 & year > 1977

** no harvest, with price change
rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ pctchnge_tms /*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 2008 & year > 1977

** with est_harvest and logging wage
rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ pctchnge_tms est_harvest adj_logging_wage/*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 2008 & year > 1977



**** export regression results to latex form

est clear

** no harvest, no price change
eststo: quietly rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 2008 & year > 1977


** no harvest, with price change
eststo: quietly rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ pctchnge_tms /*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 2008 & year > 1977


** with est_harvest and logging wage
eststo: quietly rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ pctchnge_tms est_harvest adj_logging_wage/*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 2008 & year > 1977


esttab using"table1.tex", replace ///
 cells("b(fmt(3) star label(Coef.)) se(par fmt(2) label(Std. err.))") ///
 nomtitle label star(* 0.10 ** 0.05 *** 0.01)

 
** no standard error in latex table
esttab using"table2.tex", replace ///
 cells("b(fmt(3) star label(Coef.))") ///
 nomtitle label star(* 0.10 ** 0.05 *** 0.01)
 
 
**** export robustness check results to latex form

est clear

** no harvest, no price change
eststo: quietly rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 1996 & year > 1982


** no harvest, with price change
eststo: quietly rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ pctchnge_tms /*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 1996 & year > 1982


** with est_harvest and logging wage
eststo: quietly rreg plantAcre time_stage#c.pnw_price_ton time_stage#c.tms_price pnw_price_ton tms_price/*
*/ pctchnge_tms est_harvest adj_logging_wage/*
*/ annual_ppt annual_tmean ppt_sq temp_sq oil_real_price annual_int_rate housing_units ag_area pasture_area landArea /*
*/ Revenue_CORN Revenue_SOYBEANS i.time_stage i.fips if year < 1996 & year > 1982


esttab using"table3_robust.tex", replace ///
 cells("b(fmt(3) star label(Coef.))") ///
 nomtitle label star(* 0.10 ** 0.05 *** 0.01)
