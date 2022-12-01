///Zhihao Chen lab 2 

. use "/Users/chensitong/Desktop/ECON 360/CONGRESSIONAL.DTA",clear
. describe

. rename state stateabb
. rename name incumbent 
. drop if score == "n.a."
. duplicates drop incumbent stateabb dist score,force
. replace dist = "1" if dist == "AL"
. destring dist, replace
. save "/Users/chensitong/Desktop/ECON 360/rating.dta"



. import excel "/Users/chensitong/Desktop/ECON 360/vote2014.xlsx", sheet("Sheet1") firstrow clear
. rename State name
. rename CD dist
. replace dist = "1" if dist == "AL"
. destring dist, replace
. save "/Users/chensitong/Desktop/ECON 360/vote2014.dta"


. use "/Users/chensitong/Desktop/ECON 360/vote2014.dta"
. joinby name using  "/Users/chensitong/Desktop/ECON 360/State Abbrev Fips.dta", unmatched(none)
. joinby stateabb dist using  "/Users/chensitong/Desktop/ECON 360/rating.dta", unmatched(master)_merge(_merge)
. destring score DemVotes GOPVotes, replace ignore()
. save "/Users/chensitong/Desktop/ECON 360/Project.dta"

