cd "D:\GitHub\Thesis\"
* Clear Stata
clear
clear matrix
clear mata
* Get rid of --more--
set more off
* Larger matrix size
set matsize 800

////// TESTS //////
import delimited using "data/final01.csv", clear
eststo clear
eststo: reg toneev tonepr, vce(robust)
eststo: reg toneev tonepr tonepr2, vce(robust)
eststo: reg toneev tonepr tonepr2 tonepr3, vce(robust)
esttab using "./materials/stata_tables/tone_test_robust.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) nomti nonotes



// // cross_regressions between regressors
// eststo clear
// eststo: reg toneev toneev, vce(robust)
// eststo: reg toneev tonepr, vce(robust)
// eststo: reg toneev rate_shock_abs, vce(robust)
// eststo: reg toneev trans, vce(robust)
// eststo: reg toneev trust, vce(robust)
// esttab using "./materials/stata_tables/1regressors_cross_corr.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) nomti nonotes
//
// eststo clear
// eststo: reg tonepr toneev if toneev < 0, vce(robust)
// eststo: reg tonepr tonepr if toneev < 0, vce(robust)
// eststo: reg tonepr rate_shock_abs if toneev < 0, vce(robust)
// eststo: reg tonepr trans if toneev < 0, vce(robust)
// eststo: reg tonepr trust if toneev < 0, vce(robust)
// esttab using "./materials/stata_tables/2regressors_cross_corr.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) nomti nonotes
//
// eststo clear
// eststo: reg rate_shock_abs toneev if toneev < 0, vce(robust)
// eststo: reg rate_shock_abs tonepr if toneev < 0, vce(robust)
// eststo: reg rate_shock_abs rate_shock_abs if toneev < 0, vce(robust)
// eststo: reg rate_shock_abs trans if toneev < 0, vce(robust)
// eststo: reg rate_shock_abs trust if toneev < 0, vce(robust)
// esttab using "./materials/stata_tables/3regressors_cross_corr.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) nomti nonotes
//
// eststo clear
// eststo: reg trans toneev if toneev < 0, vce(robust)
// eststo: reg trans tonepr if toneev < 0, vce(robust)
// eststo: reg trans rate_shock_abs if toneev < 0, vce(robust)
// eststo: reg trans trans if toneev < 0, vce(robust)
// eststo: reg trans trust if toneev < 0, vce(robust)
// esttab using "./materials/stata_tables/4regressors_cross_corr.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) nomti nonotes
//
// eststo clear
// eststo: reg trust toneev if toneev < 0, vce(robust)
// eststo: reg trust tonepr if toneev < 0, vce(robust)
// eststo: reg trust rate_shock_abs if toneev < 0, vce(robust)
// eststo: reg trust trans if toneev < 0, vce(robust)
// eststo: reg trust trust if toneev < 0, vce(robust)
// esttab using "./materials/stata_tables/5regressors_cross_corr.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) nomti nonotes