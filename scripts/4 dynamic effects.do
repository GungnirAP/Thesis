cd "D:\GitHub\Thesis\"
* Clear Stata
clear
clear matrix
clear mata
* Get rid of --more--
set more off
* Larger matrix size
set matsize 800

import delimited using "data/dynamics/MOEX_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/MOEX_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RTSI_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RTSI_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/FXGDETF_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/FXGDETF_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RGBITR_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RGBITR_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RUGBITR1Y_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RUGBITR1Y_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RUGBITR3Y_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RUGBITR3Y_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RUGBITR5Y_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RUGBITR5Y_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RUGBITR10Y_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RUGBITR10Y_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RUCBITR_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RUCBITR_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti

import delimited using "data/dynamics/RUABITR_dem.csv", clear
eststo clear
forvalues i = 0(1)14 {
	eststo: reg spread toneev tonepr rate_shock_abs trans trust if h==`i', vce(robust)
}
esttab using "./materials/stata_tables/RUABITR_dem_res.csv", replace se star(* 0.10 ** 0.05 *** 0.01) nomti


// esttab using "./materials/stata_tables/moex_dem_res.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("MOEX Spread", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}"s rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

//////////////////////////////////////
////// test for autocorrelation //////
//////////////////////////////////////
//// nice thing:
//// predict spread_resid_`i', residuals
import delimited using "data/dynamics/MOEX_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RTSI_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/FXGDETF_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RGBITR_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RUGBITR1Y_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RUGBITR3Y_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RUGBITR5Y_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RUGBITR10Y_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RUABITR_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
import delimited using "data/dynamics/RUCBITR_dem.csv", clear
tsset id h
xtserial spread toneev tonepr rate_shock_abs trans trust
