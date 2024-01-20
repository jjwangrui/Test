data premarital;
input S R B P count;
datalines;
1 1 1 1 99
1 1 1 2 73
1 1 1 3 51
1 1 2 1 15
1 1 2 2 20
1 1 2 3 19
1 2 1 1 73
1 2 1 2 87
1 2 1 3 51
1 2 2 1 25
1 2 2 2 37
1 2 2 3 36
2 1 1 1 8
2 1 1 2 20
2 1 1 3 6
2 1 2 1 4
2 1 2 2 13
2 1 2 3 12
2 2 1 1 24
2 2 1 2 50
2 2 1 3 33
2 2 2 1 22
2 2 2 2 60
2 2 2 3 88
;
proc genmod;
class S (ref='2') R (ref='2') B (ref='2') P (ref='3');
model count = S R B P / dist=poi link=log lrci type3 obstats;

proc genmod;
class S (ref='2') R (ref='2') B (ref='2') P (ref='3');
model count = S|R|B|P @2/ dist=poi link=log lrci type3 obstats;

proc genmod;
class S (ref='2') R (ref='2') B (ref='2') P (ref='3');
model count = S R B P S*R S*B S*P R*B B*P/ dist=poi link=log lrci type3 obstats;

proc genmod;
class S (ref='2') R (ref='2') B (ref='2') P (ref='3');
model count = S R B P S*R S*B S*P B*P/ dist=poi link=log lrci type3 obstats;

proc genmod;
class S (ref='2') R (ref='2') B (ref='2') P (ref='3');
model count = S R B P S*R S*B S*P R*B/ dist=poi link=log lrci type3 obstats;
