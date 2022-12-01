///Zhihao Chen lab 4


. use "/Users/chensitong/Desktop/ECON 360/Wooldridge Data/GPA1.DTA"
. describe 
. regress colGPA hsGPA ACT skipped 
. regress colGPA hsGPA ACT skipped ,beta
. summ
. display _b[ACT]*2.844252/0.37231303
. reg colGPA c.hsGPA##c.ACT skipped
. generate hsGPA_ACT = hsGPA*ACT
. regress colGPA hsGPA ACT skipped hsGPA_ACT
. testparm ACT c.hsGPA#c.ACT
. margins,dydx(hsGPA)
. summ ACT
. margins,dydx(hsGPA)at(ACT=(24.15603))
. margins,dydx(hsGPA)at(ACT=(18,24,30))
. reg colGPA c.hsGPA##c.ACT c.skipped##c.skipped
. summ skipped, detail
. margins,dydx(skipped) at (skipped =(0 1 2 3 4 5))
. margins, at(skipped=(0 1 2 3 4 5)) atmeans plot
. predict se_Eyonx, stdp
. predict yhat, stdf
. lincom _cons+3*hsGPA+21*ACT+3*21*c.hsGPA#c.ACT+2*skipped+4*c.skipped#c.skipped
. display (.0673619^2+e(rmse)^2)^0.5
