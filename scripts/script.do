cd "D:\GitHub\Thesis\data"
cd "D:\GitHub\Thesis\data"
* Clear Stata
clear
clear matrix
clear mata
* Get rid of --more--
set more off
* Larger matrix size
set matsize 800
import delimited using "./final01.csv", clear
eststo clear 
reg close tone

// можно добавить робаст se
reg close tone if type==1
reg close tone rate_shock_abs if type==1
reg close tone rate_shock_rel if type==1
//добавить интеракшн
	
// 	esttab using "./table1.tex", replace order(hap_var hap_min_max pw)  coeflabels(hap_var "Happiness Var"  hap_min_max "Happiness Spread" pw "PFR prob")  noconstant  scalars("N_clust Subjects (Clusters)"  "r2 R-Squared"  "N Observations")  drop(q2_*)  star(* 0.10 ** 0.05 *** 0.01)  nodepvars nonotes se booktabs 