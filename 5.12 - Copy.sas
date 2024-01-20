data opinions;
input RA $ BC $ PV $ ONE TWO @@;
PS = ONE + TWO;
datalines;

1 1 1 99  8 1 1 2 73 20 1 1 3 51  6
1 2 1 15  4 1 2 2 20 13 1 2 3 19 12
2 1 1 73 24 2 1 2 87 50 2 1 3 51 33
2 2 1 25 22 2 2 2 37 60 2 2 3 36 88
;

ods graphics on;
proc logistic data=opinions plots(only)=roc(id=obs);
class RA BC PV;
model ONE/PS = RA|BC|PV @2/rsquare
scale=none
                         clparm=wald
                         clodds=pl
                         rsquare lackfit;
run;
ods graphics off;

ods graphics on;
proc logistic data=opinions  plots(only)=roc(id=obs);
class RA BC PV;
model ONE/PS = RA BC PV RA*BC RA*PV BC*PV/rsquare
scale=none
                         clparm=wald
                         clodds=pl
                         rsquare lackfit;
run;
ods graphics off;

ods graphics on;
proc logistic data=opinions plots(only)=roc(id=obs);
class RA BC PV;
model ONE/PS = RA BC PV RA*PV/rsquare
scale=none
                         clparm=wald
                         clodds=pl
                         rsquare lackfit;
run;
ods graphics off;

ods graphics on;
proc logistic data=opinions plots(only)=roc(id=obs);
class RA BC PV;
model ONE/PS = RA BC PV/rsquare
scale=none
                         clparm=wald
                         clodds=pl
                         rsquare lackfit;
run;
ods graphics off;