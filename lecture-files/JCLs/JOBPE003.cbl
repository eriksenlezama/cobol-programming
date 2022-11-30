//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=COBPE003                                            00030011
//STEPLIB  DD DSN=KC02762.TSU.LOAD(COBPE003),DISP=SHR                   00040011
//SYSOUT   DD SYSOUT=*                                                  00040107
//SYSIN    DD *                                                         00040208
5                                                                       00040309
/*                                                                      00041004
