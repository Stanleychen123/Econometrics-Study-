///Zhihao Chen lab 7


. use "/Users/chensitong/Desktop/ECON 360/Wooldridge Data/CARD.DTA"
. describe
. regress wage educ exper IQ KWW
. estimates store ystar
. set seed 100
. gen e_0=rnormal(0,10)
. gen wage_mm=wage+e_0
. estimates store y
. estimates table ystar y, stats(N r2) b(%9.3f) se(%9.3f)
. gen lwage_mm = lwage+rnormal(0,1)
. reg lwage_mm educ exper IQ KWW
. gen exper_mm = exper+rnormal()
. reg lwage educ exper_mm IQ KWW
. gen s_i = runiform()
. sort s_i
. reg wage educ exper IQ KWW in 1/2500
. reg wage educ exper IQ KWW 
. predict yhat
. reg wage educ exper IQ KWW  c.yhat#c.yhat c.yhat#c.yhat#c.yhat
. testparm c.yhat#c.yhat c.yhat#c.yhat#c.yhat
. regress wage educ exper
. regress wage educ exper IQ KWW
. twoway scatter wage IQ
. lvr2plot 
. predict h,hat
. sort h  
. reg wage educ exper IQ KWW if h<.009 
. gen index=_n
. reg wage educ exper IQ KWW i(2034/2040).index
