//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010145
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=COBPE888                                            00030042
//STEPLIB  DD DSN=KC02762.TSU.LOAD(COBPE888),DISP=SHR                   00040044
//SYSOUT   DD SYSOUT=*                                                  00040607
//SYSIN    DD *
55
45
/*
