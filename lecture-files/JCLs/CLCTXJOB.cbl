//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010145
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=CALC1000                                            00030042
//STEPLIB  DD DSN=KC02762.TSU.LOAD(CALC1000),DISP=SHR                   00040044
//SYSOUT   DD SYSOUT=*                                                  00040607
//SYSIN    DD *
00700
00800
00900
00200
00300
00000
/*
