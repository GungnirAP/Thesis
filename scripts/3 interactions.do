cd "D:\GitHub\Thesis\"
* Clear Stata
clear
clear matrix
clear mata
* Get rid of --more--
set more off
* Larger matrix size
set matsize 800

// eststo: reg moex_spread c.trust##(c.toneev c.tonepr) rate_shock_abs trans

////// THE MAIN REGS //////
// complete spec.

eststo clear
import delimited using "data/final01_normalized.csv", clear
rename moex_spread MOEX
eststo: reg MOEX toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final11_normalized.csv", clear
rename rts_spread RTSI
eststo: reg RTSI toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final21_normalized.csv", clear
rename gold_spread FXGD_ETF
eststo: reg FXGD_ETF toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final_RUCBITR_normalized.csv", clear
rename spread RUCBITR
eststo: reg RUCBITR toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final_RUABITR_normalized.csv", clear
rename spread RUABITR
eststo: reg RUABITR toneev tonepr rate_shock_abs trans trust, vce(robust)
esttab using "./materials/stata_tables/basic_results_summary.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust" c.rate_shock_abs#c.tonepr "Rate Change\#\#Tone Sentiment_{2}" c.rate_shock_abs#c.toneev "Rate Change\#\#Tone Sentiment_{1}") dep nonotes nonum

eststo clear
import delimited using "data/final_RGBITR_normalized.csv", clear
rename spread RGBITR
eststo: reg RGBITR toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final_RUGBITR1Y_normalized.csv", clear
rename spread RUGBITR1Y
eststo: reg RUGBITR1Y toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final_RUGBITR3Y_normalized.csv", clear
rename spread RUGBITR3Y
eststo: reg RUGBITR3Y toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final_RUGBITR5Y_normalized.csv", clear
rename spread RUGBITR5Y
eststo: reg RUGBITR5Y toneev tonepr rate_shock_abs trans trust, vce(robust)
import delimited using "data/final_RUGBITR10Y_normalized.csv", clear
rename spread RUGBITR10Y
eststo: reg RUGBITR10Y toneev tonepr rate_shock_abs trans trust, vce(robust)
esttab using "./materials/stata_tables/basic_results_summary.tex", append noconstant se star(* 0.10 ** 0.05 *** 0.01) coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust" c.rate_shock_abs#c.tonepr "Rate Change\#\#Tone Sentiment_{2}" c.rate_shock_abs#c.toneev "Rate Change\#\#Tone Sentiment_{1}") dep nonum




// interaction with rate change
eststo clear
import delimited using "data/final01_normalized.csv", clear
rename moex_spread MOEX
eststo: reg MOEX c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final11_normalized.csv", clear
rename rts_spread RTSI
eststo: reg RTSI c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final21_normalized.csv", clear
rename gold_spread FXGD_ETF
eststo: reg FXGD_ETF c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final_RUCBITR_normalized.csv", clear
rename spread RUCBITR
eststo: reg RUCBITR c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final_RUABITR_normalized.csv", clear
rename spread RUABITR
eststo: reg RUABITR c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
esttab using "./materials/stata_tables/interaction_rate_results.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust" c.rate_shock_abs#c.tonepr "Rate Change##Tone Sentiment_{2}" c.rate_shock_abs#c.toneev "Rate Change##Tone Sentiment_{1}") dep nonotes nonum

eststo clear
import delimited using "data/final_RGBITR_normalized.csv", clear
rename spread RGBITR
eststo: reg RGBITR c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final_RUGBITR1Y_normalized.csv", clear
rename spread RUGBITR1Y
eststo: reg RUGBITR1Y c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final_RUGBITR3Y_normalized.csv", clear
rename spread RUGBITR3Y
eststo: reg RUGBITR3Y c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final_RUGBITR5Y_normalized.csv", clear
rename spread RUGBITR5Y
eststo: reg RUGBITR5Y c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
import delimited using "data/final_RUGBITR10Y_normalized.csv", clear
rename spread RUGBITR10Y
eststo: reg RUGBITR10Y c.rate_shock_abs##(c.toneev c.tonepr) trans trust, vce(robust)
esttab using "./materials/stata_tables/interaction_rate_results.tex", append noconstant se star(* 0.10 ** 0.05 *** 0.01) coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust" c.rate_shock_abs#c.tonepr "Rate Change##Tone Sentiment_{2}" c.rate_shock_abs#c.toneev "Rate Change##Tone Sentiment_{1}") dep nonum


// // interaction with trust & trans
// //  не дало никакого эффекта, видимо, из-за коррелированности с tone
// eststo clear
// import delimited using "data/final01_normalized.csv", clear
// rename moex_spread MOEX
// eststo: reg MOEX toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final11_normalized.csv", clear
// rename rts_spread RTSI
// eststo: reg RTSI toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final21_normalized.csv", clear
// rename gold_spread FXGD_ETF
// eststo: reg FXGD_ETF toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final_RUCBITR_normalized.csv", clear
// rename spread RUCBITR
// eststo: reg RUCBITR toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final_RUABITR_normalized.csv", clear
// rename spread RUABITR
// eststo: reg RUABITR toneev tonepr rate_shock_abs trans trust, vce(robust)
// esttab using "./materials/stata_tables/basic_results_summary.tex", replace noconstant se star(* 0.10 ** 0.05 *** 0.01) coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust" c.rate_shock_abs#c.tonepr "Rate Change\#\#Tone Sentiment_{2}" c.rate_shock_abs#c.toneev "Rate Change\#\#Tone Sentiment_{1}") dep nonotes nonum
//
// eststo clear
// import delimited using "data/final_RGBITR_normalized.csv", clear
// rename spread RGBITR
// eststo: reg RGBITR toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final_RUGBITR1Y_normalized.csv", clear
// rename spread RUGBITR1Y
// eststo: reg RUGBITR1Y toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final_RUGBITR3Y_normalized.csv", clear
// rename spread RUGBITR3Y
// eststo: reg RUGBITR3Y toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final_RUGBITR5Y_normalized.csv", clear
// rename spread RUGBITR5Y
// eststo: reg RUGBITR5Y toneev tonepr rate_shock_abs trans trust, vce(robust)
// import delimited using "data/final_RUGBITR10Y_normalized.csv", clear
// rename spread RUGBITR10Y
// eststo: reg RUGBITR10Y toneev tonepr rate_shock_abs trans trust, vce(robust)
// esttab using "./materials/stata_tables/basic_results_summary.tex", append noconstant se star(* 0.10 ** 0.05 *** 0.01) coeflabels(toneev "Tone Sentiment_{1}" tonepr "Tone Sentiment_{2}" rate_shock_abs "Rate Change" trans "Transparency" trust "Trust" c.rate_shock_abs#c.tonepr "Rate Change\#\#Tone Sentiment_{2}" c.rate_shock_abs#c.toneev "Rate Change\#\#Tone Sentiment_{1}") dep nonum
//
