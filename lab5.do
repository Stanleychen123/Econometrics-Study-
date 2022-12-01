///Zhihao Chen lab 5


. use "/Users/chensitong/Desktop/ECON 360/Wooldridge Data/beauty.dta"
. describe
. ttest lwage, by(abvavg)
. reg lwage abvavg educ exper female
. display 100*(exp(_b[female])-1)
. reg lwage i.abvavg##i.female educ exper
. lincom 1.abvavg+1.abvavg#1.female
. reg lwage i.abvavg##ib1.female educ exper
. reg lwage c.looks#i.female educ exper
. margins, dydx(looks) at (female=(0 1)) 
. margins, at(looks = (1 2 3 4 5) female = (0 1)) plot
. reg lwage ib3.looks i.female educ exper
. margins, at(looks=(1 2 3 4 5) female = (0 1)) plot
. reg lwage ib3.looks##i.female educ exper
. margins, at(looks=(1 2 3 4 5) female = (0 1)) plot
. test (-_b[1.looks] =2*_b[4.looks]) (-_b[2.looks]=_b[4.looks]) (_b[5.looks] =2*_b[4.looks]) (-_b[1.looks#1.female] =2*_b[4.looks#1.female]) (-_b[2.looks#1.female] =_b[4.looks#1.female]) (_b[5.looks#1.female] =2*_b[4.looks#1.female])
. display Ftail(6,1248,((.3431-.3363)/(1-.3431))*(1248/6))
. testparm i.looks i.looks#1.female

