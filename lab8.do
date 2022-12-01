///Zhihao Chen


. import excel "/Users/chensitong/Desktop/EMM_EPM0_PTE_NUS_DPGw.xls", sheet("Data 1") cellrange(A3:B1552) firstrow clear
. tsset Date, daily delta(7)
. tsline gasprice_gal
. gen mon=month(Date)
. gen lprice=ln(gasprice_gal)
. reg lprice Date i.mon
. testparm i.mon
. predict lprice_detr, residuals
. tsline lprice_detr
. corr lprice L7.lprice
. corr lprice l7(7(7)70).lprice
. reg S.lprice L.lprice, nocons
. dfuller lprice, noconstant regress lag(0)
. reg S.lprice L.lprice Date
. dfuller lprice, trend regress lags(0)
. sort Date
. gen party=.
. replace party=1 in 1/407
. replace party=1 in 826/1242
. replace party=1 in 1452/1495
. replace party=0 if party==.
. label define Party 1 "Democrat" 0 "Republican"
. label values party Party
. reg S.lprice S.party i.mon
. reg S.lprice S(0/10).party Date i.mon
. reg S.lprice S(0/10).party i
. margins, dydx(party)
