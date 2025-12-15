*****************************************
* 1)set user network path
*****************************************

local user = "`c(username)'"
display "`user'"


* Mylene 
if "`user'"== "m.lagarde" {
		global dropbox="/Users/m.lagarde/Dropbox/PROJECTS/AI and Healthcare/"
        global code=""
}
* Radhika
if "`user'"=="radhi" | "`user'"=="rmjwaia" {
		global dropbox="C:/Users/rmjwaia/Dropbox/Research/0 RESEARCH PROJECTS/AI and Healthcare/"
        global code=""
}
* Jonas 
if "`user'"=="jonas" {
		global dropbox="/Users/jonas/Library/CloudStorage/Dropbox/AI and Healthcare"
        global code="/Users/jonas/Documents/GitHub/UgandaChatbotCRCT/"
}
*****************************************
* 2)initialize Stata
*****************************************

clear
set more off
cap clear matrix
set mem 100m
* source globals
do "${code}/globals.do"

*****************************************
* 3) baseline knowledge test import
*****************************************

do "${code}/import/baseline_knowledge/import_knowledge_test.do"
