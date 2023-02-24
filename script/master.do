/*
Name: Master Do
Date Created: 02/23/2023
Date Last Modified: 02/23/2023
Created by: EKY
Modified By: EKY
Last modified by: EKY
Uses data:
Creates data: 
Description:
*/

********************************************************************************
** MASTER SETUP ****************************************************************
********************************************************************************

/*
REQUIREMENT:
	ssc install outreg2
*/

cls
clear
set more off
version 16.1
// set memory 15m // not applicable for version > 12.0 

* Set directory [to replicate, CHANGE THIS DIRECTORY]
cd /Users/egayazid/QMSS/SPRING23/coding_test/stata-cookiecutter

* Check directory
pwd

* Start log session
log using "log/$S_DATE", replace

***************************************************************************
** DO-FILE WORKFLOW *******************************************************
***************************************************************************

**PART 1. Dataset preparation

	** Generate dataset
	do "script/gen_data.do"
	
	** Merging dataset
	do "script/reshape.do"
	
// 	* Cleaning part (a)
// 	do "script/clean_1.do"
	
// 	* Cleaning part (b)
// 	do "script/clean_2.do"


**PART 2. Analysis

	** Descriptive analysis and EDA
	do "script/EDA.do"
	
	** Inference analysis
// 	do "script/analysis_2.do"

**PART 3. Reporting

	** Table reporting
	do "script/report_1.do"
	
	** Plot visualization
// 	do "script/report_2.do"

***************************************************************************

* End log session
capture log close

translate "log/$S_DATE.smcl" "log/$S_DATE.pdf", replace
