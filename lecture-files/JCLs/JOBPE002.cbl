//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=COBPE002                                            00030010
//STEPLIB  DD DSN=KC02762.TSU.LOAD(COBPE002),DISP=SHR                   00040010
//SYSOUT   DD SYSOUT=*                                                  00040107
//SYSIN    DD *                                                         00040208
05                                                                      00040312
10                                                                      00040411
/*                                                                      00041004
