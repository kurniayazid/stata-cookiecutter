/*
Name: Analysis 1
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
** Reporting **************************************************************
***************************************************************************

* Importing dataset
use "data_cleaned/demo_cleaned.dta", clear

