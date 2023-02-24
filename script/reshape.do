/*
Name: Reshape Do
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

***************************************************************************
** RESHAPING DATA *********************************************************
***************************************************************************

* Importing dataset
use "data_raw/demo_dataset.dta", clear

* Set panel
xtset id yr

* Preserve and drop
preserve
drop cov* gang // make sure to include all variables, so I drop it for a while


* Reshape from long to wide
reshape wide depvar indep, i(id) j(yr)

* Reshape from long to wide
reshape long depvar indep, i(id) j(year)

* Restoring dataset
restore

***************************************************************************
***************************************************************************

* SAVING DATASET
compress
save "data_cleaned/demo_cleaned.dta", replace
