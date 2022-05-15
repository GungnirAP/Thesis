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