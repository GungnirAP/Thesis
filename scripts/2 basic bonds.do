cd "D:\GitHub\Thesis\"
* Clear Stata
clear
clear matrix
clear mata
* Get rid of --more--
set more off
* Larger matrix size
set matsize 800

////// THE MAIN REGS //////

//// RGBITR ////

import delimited using "data/final_RGBITR_normalized.csv", clear

eststo clear
eststo: reg spread toneev, vce(robust)
eststo: reg spread tonepr, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RGBITR_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RGBITR", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

//// RUCBITR ////

import delimited using "data/final_RUCBITR_normalized.csv", clear

eststo clear
eststo: reg spread toneev, vce(robust)
eststo: reg spread tonepr, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RUCBITR_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RUCBITR", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

//// RUGBITR1Y ////

import delimited using "data/final_RUGBITR1Y_normalized.csv", clear

eststo clear
eststo: reg spread toneev, vce(robust)
eststo: reg spread tonepr, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RUGBITR1Y_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RUGBITR1Y", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

//// RUGBITR3Y ////

import delimited using "data/final_RUGBITR3Y_normalized.csv", clear

eststo clear
eststo: reg spread toneev, vce(robust)
eststo: reg spread tonepr, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RUGBITR3Y_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RUGBITR3Y", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

//// RUGBITR5Y ////

import delimited using "data/final_RUGBITR5Y_normalized.csv", clear

eststo clear
eststo: reg spread toneev, vce(robust)
eststo: reg spread tonepr, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RUGBITR5Y_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RUGBITR5Y", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

//// RUGBITR10Y ////

import delimited using "data/final_RUGBITR10Y_normalized.csv", clear

eststo clear
eststo: reg spread toneev, vce(robust)
eststo: reg spread tonepr, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RUGBITR10Y_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RUGBITR10Y", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

//// RUABITR ////

import delimited using "data/final_RUABITR_normalized.csv", clear

eststo clear
eststo: reg spread toneev, vce(robust)
eststo: reg spread tonepr, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RUABITR_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RUABITR", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")
