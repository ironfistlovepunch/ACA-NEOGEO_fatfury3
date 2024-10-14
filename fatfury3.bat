REM fatfury3
REM SROM
copy 348470 069-s1.s1
copy /b 069-s1.s1+

REM MROM PROM
romcutter 1E7650 069-m1.m1 0 20000

romcutter 1E7650 069-p1.p1 20000 100000
romcutter 1E7650 069-sp2.sp2 120000 200000

REM PROM
REM romcutter 1F3D53 069-p1.p1 0 100000
REM romcutter 1F3D53 069-sp2.sp2 100000 200000

REM VROM
romcutter C74454 069-v1.v1 0 400000
romcutter C74454 069-v2.v2 400000 400000
romcutter C74454 069-v3.v3 800000 200000

REM CROM
copy /b 39E1C0+58DD2C+7C6F7C+A22CA8 crom
romcutter crom c1c2 0 800000
romcutter crom c3c4 800000 800000
romcutter crom c5c6 1000000 400000

BSwap.exe d B c1c2 oddeven.txt 069-c1.c1 069-c2.c2
BSwap.exe d B c3c4 oddeven.txt 069-c3.c3 069-c4.c4
BSwap.exe d B c5c6 oddeven.txt 069-c5.c5 069-c6.c6

REM delete
del c1c2 c3c4 c5c6
del crom

REM forcecrc
copy 069-p1.p1 069-p1_bak.p1
REM EA010
forcecrc32.py 069-p1.p1 958480 a8bcfbbc

REM compress
REM powershell Compress-Archive 069*.* -Force -DestinationPath fatfury3.zip
