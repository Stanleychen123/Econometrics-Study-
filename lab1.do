///Zhihao Chen


. use "/Users/chensitong/Desktop/ECON 360/Wooldridge Data/WAGE1.DTA",clear
. describe


. summarize wage edu exper tenure
. summarize wage edu exper tenure, detail
. tabulate educ
. histogram edu
. twoway scatter wage edu
. correlate wage edu, covariance
. display 1- ttail(63,-1.84) 
. display 2*(1- ttail(63,-1.84)) 
. help density_functions

. gen wage2010=3.23*wage
. gen lwage2010=ln(wage2010)
. replace tenure = tenure * 12
. regress wage2010 educ 
. regress lwage2010 educ 
