//KC02762K JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010145
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=CRSTFILE                                            00030042
//STEPLIB  DD DSN=KC02762.TSU.LOAD(CRSTFILE),DISP=SHR                   00040044
//STUFILE  DD  DSN=KC02762.STU.DATA,DISP=SHR                            00040146
//SYSOUT   DD SYSOUT=*                                                  00040607
/*
