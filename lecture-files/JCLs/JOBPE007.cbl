//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=COBPE007                                            00030015
//STEPLIB  DD DSN=KC02762.TSU.LOAD(COBPE007),DISP=SHR                   00040015
//SYSOUT   DD SYSOUT=*                                                  00040107
//SYSIN    DD SYSOUT=*                                                  00040212
/*                                                                      00041004
