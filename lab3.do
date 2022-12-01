///Zhihao Chen lab 3

. use "/Users/chensitong/Desktop/ECON 360/Wooldridge Data/hprice1.dta"
. describe

. regress lprice bdrms lotsize sqrft
. gen sigmahat=e(rmse)
. summ bdrms,detail
. gen varxl=r(Var)
. regress bdrms lotsize sqrft 
. gen r2xl=1-e(r2)
. display  .0285928 *(varxl*r2xl*87)^-0.5
. regress lprice bdrms lotsize sqrft
. display 0.0252388/0.0285928
. display 2*ttail(84, 0.0252388/.0285928)
. display 0.0252388+.0285928*invttail(84,0.025)
. display 0.0252388-.0285928*invttail(84,0.025)
. testparm bdrms lotsize
. gen r2ur=e(r2)
. regress lprice sqrft
. gen r2r=e(r2)
. display ((r2ur-r2r)/(1-r2ur))*(84/2)
. regress lprice bdrms lotsize sqrft
. lincom bdrms+140*sqrft
. gen newthing = sqrft-140*bdrms
. regress lprice bdrms lotsize newthing
. regress sqrft bdrms lotsize 
. predict sqrft_res, residuals
. regress lprice sqrft_res
