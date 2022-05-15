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
//
// //// MOEX ////
// // version with first shock - checked, not used
// // import delimited using "data/final00.csv", clear
//
// // version without first shock
// import delimited using "data/final01.csv", clear
//
// eststo clear
// eststo: reg moex_spread toneev
// eststo: reg moex_spread tonepr
// // eststo: reg moex_spread toneev tonepr
// eststo: reg moex_spread toneev tonepr rate_shock_abs
// // eststo: reg moex_spread toneev tonepr rate_shock_rel
// eststo: reg moex_spread toneev tonepr rate_shock_abs trans
// eststo: reg moex_spread toneev tonepr rate_shock_abs trans trust
// //тоже не пошло
// // eststo: reg moex_spread c.trust##(c.toneev c.tonepr) rate_shock_abs trans
// esttab using "./materials/stata_tables/table1.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("MOEX Spread", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")
//
// esttab using "./output/stata_tables/iv.tex", replace f  nonumbers  	mgroups("Charitable Giving" "WTP: Good" "WTP: Gamble" "Trust game", pattern(1 1 1 1 0)) mtitle("Donation" "WTP" "WTP" "Transfer" "Average return")  	coeflabels(hap "Happiness")  	star(* 0.10 ** 0.05 *** 0.01)  	
//
// // // version without first shock, nan -> 0 => interactions for toneev, trust
// // // не пошло - похоже проблема с интеракшнами
// // import delimited using "data/final02.csv", clear
// // gen toneev_dummy = 0
// // replace toneev_dummy = 1 if toneev < 0
// // gen trust_dummy = 0
// // replace trust_dummy = 1 if trust > 0
// //	
// // eststo clear
// // eststo: reg moex_spread toneev_dummy##c.toneev
// // eststo: reg moex_spread tonepr
// // // eststo: reg moex_spread toneev tonepr
// // eststo: reg moex_spread toneev_dummy##c.toneev tonepr rate_shock_abs
// // // eststo: reg moex_spread toneev tonepr rate_shock_rel
// // eststo: reg moex_spread toneev_dummy##c.toneev tonepr rate_shock_abs trans
// // eststo: reg moex_spread toneev_dummy##c.toneev tonepr rate_shock_abs trans trust_dummy##c.trust
// // esttab using "./materials/stata_tables/table2.doc", replace
//	
//	
// // 	esttab using "./table1.tex", replace order(hap_var hap_min_max pw)  coeflabels(hap_var "Happiness Var"  hap_min_max "Happiness Spread" pw "PFR prob")  noconstant  scalars("N_clust Subjects (Clusters)"  "r2 R-Squared"  "N Observations")  drop(q2_*)  star(* 0.10 ** 0.05 *** 0.01)  nodepvars nonotes se booktabs 
//
// //// rts ////
// import delimited using "data/final11.csv", clear
//
// eststo clear
// eststo: reg rts_spread toneev
// eststo: reg rts_spread tonepr
// eststo: reg rts_spread toneev tonepr rate_shock_abs
// eststo: reg rts_spread toneev tonepr rate_shock_abs trans
// eststo: reg rts_spread toneev tonepr rate_shock_abs trans trust
//
// esttab using "./materials/stata_tables/table11.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("RTS Spread", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")
//
// //// GOLD ////
// import delimited using "data/final21.csv", clear
//
// eststo clear
// eststo: reg gold_spread toneev
// eststo: reg gold_spread tonepr
// eststo: reg gold_spread toneev tonepr rate_shock_abs
// eststo: reg gold_spread toneev tonepr rate_shock_abs trans
// eststo: reg gold_spread toneev tonepr rate_shock_abs trans trust
//
// esttab using "./materials/stata_tables/table21.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) mgroups("Gold Spread", pattern(1 0 0 0 0)) nomti coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust")


//////////////////////////////////////
//// Normalization update (01.04.2022)
//// rates := rates * 100, tones = tones / std(tones)
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




