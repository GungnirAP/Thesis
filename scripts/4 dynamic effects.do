cd "D:\GitHub\Thesis\"
* Clear Stata
clear
clear matrix
clear mata
* Get rid of --more--
set more off
* Larger matrix size
set matsize 800

import delimited using "data/final01_normalized.csv", clear

eststo clear
eststo: reg moex_spread toneev, vce(robust)
eststo: reg moex_spread tonepr, vce(robust)
// eststo: reg moex_spread toneev tonepr, vce(robust)
eststo: reg moex_spread toneev tonepr rate_shock_abs, vce(robust)
// eststo: reg moex_spread toneev tonepr rate_shock_rel, vce(robust)
eststo: reg moex_spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg moex_spread toneev tonepr rate_shock_abs trans trust, vce(robust)
//тоже не пошло
// eststo: reg moex_spread c.trust##(c.toneev c.tonepr) rate_shock_abs trans
esttab using "./materials/stata_tables/table_MOEX_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("MOEX Spread", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")

import delimited using "data/final11_normalized.csv", clear
eststo clear
eststo: reg rts_spread toneev, vce(robust)
eststo: reg rts_spread tonepr, vce(robust)
eststo: reg rts_spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg rts_spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg rts_spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_RTS_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RTS Spread", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")



import delimited using "data/final21_normalized.csv", clear

eststo clear
eststo: reg gold_spread toneev, vce(robust)
eststo: reg gold_spread tonepr, vce(robust)
eststo: reg gold_spread toneev tonepr rate_shock_abs, vce(robust)
eststo: reg gold_spread toneev tonepr rate_shock_abs trans, vce(robust)
eststo: reg gold_spread toneev tonepr rate_shock_abs trans trust, vce(robust)

esttab using "./materials/stata_tables/table_Gold_normalized.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("FXGD ETF returns", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")




