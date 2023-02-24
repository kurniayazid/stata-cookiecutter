/*
Name: Generate new dataset from random distribution 
Date Created: 02/23/2023
Date Last Modified: 02/23/2023
Created by: EKY
Modified By: EKY
Last modified by: EKY
Uses data:
Creates data: 
Description:
*/

***************************************************************************
** SYSTEM SETUP ***********************************************************
***************************************************************************

cls
clear
set more off
* set memory // not applicable for version > 12.0


version 16.1


* Set directory [to replicate, CHANGE THIS DIRECTORY]
cd /Users/egayazid/QMSS/SPRING23/coding_test/stata-cookiecutter

* Check directory
pwd

* Set seed
set seed 02232023

***************************************************************************
** CREATE DATASET *********************************************************
***************************************************************************

* Panel dataset
	
	* Set observations
	set obs 10000

	* Generate id
	egen id = seq(), f(1) t(100)
	
	* Generate yr
	gen yr = int((_n-1)/100) +1
	replace yr = 1900 + yr
	
	* Generate gang
	egen gang = seq(), f(1) t(4) b(4)
	
	* Generate depvar by gamma distributions
	gen depvar = (rgamma(30,90)+50)/100

	* Generate indepvar and covariates
	gen indep = rbeta(20,75)
	gen cov1 = rbinomial(1000, 0.3)
	gen cov2 = runiform(0,77)
	gen cov3 = runiform(-3, 10) + 5
	gen cov4 = runiform(0,1)
	replace cov4 = cov4 < .5

***************************************************************************
** DATA CLEANING & MODIFICATION *******************************************
***************************************************************************

* LABELLING
	* Labelling indepvar and depvar
	lab var depvar "Dependent Variable"
	lab var indep "Independent Variable"

	* Covariates
	foreach i of num 1/4{
		lab var cov`i' "Covariates `i'"
	}
	
	lab var gang "Coalition"
	
	* Identifier
	lab var id "ID obs"
	lab var yr "Year"

	* Labelling dataset
	lab data "Demo dataset"

* REORDERING
order id yr depvar indep cov1 cov2 cov3 cov4
sort id yr
***************************************************************************
***************************************************************************

* SAVING DATASET
compress
save "data_raw/demo_dataset.dta", replace
