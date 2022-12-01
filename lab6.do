///Zhihao Chen lab 6


. use "/Users/chensitong/Desktop/ECON 360/Wooldridge Data/RENTAL.DTA"
. describe
. regress rent enroll avginc rnthsg
. predict uhat2, residuals
. replace uhat2=uhat2^2
. reg uhat2 enroll avginc rnthsg if year==90
. display Ftail(3,60,(e(r2)/(1-e(r2))*(60/3)))
. display chi2tail(3,e(r2)*e(r2)*e(N))
. reg uhat2 enroll avginc rnthsg if year==90
. hettest, rhs fstat
. hettest, rhs iid
. reg uhat2 c.(enroll avginc rnthsg)##c.(enroll avginc rnthsg) if year==90
. display Ftail(9,54,(e(r2)/(1-e(r2))*(54/9)))
. display chi2tail(9,e(r2)*e(N))
. estat imtest
. regress rent enroll avginc rnthsg
. predict yhat
. reg uhat2 c.yhat##c.yhat if year ==90
. reg lrent lenroll lavginc lrnthsg if year==90, vce(robust)
. estimate store robust
. reg lrent lenroll lavginc lrnthsg if year==90
. estimate store ols
. estimate table ols robust, stat(N r2)se
. estimate table ols robust, stats(F r2)
. estimate table ols robust, stats(F r2) b(%9.3f) se(%9.3f) 
. estimate table ols robust, stats(F r2) varwidth(3)
. label variable enroll "people enrolled"




