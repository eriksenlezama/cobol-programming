//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=COBPE004                                            00030012
//STEPLIB  DD DSN=KC02762.TSU.LOAD(COBPE004),DISP=SHR                   00040012
//SYSOUT   DD SYSOUT=*                                                  00040107
//SYSIN    DD SYSOUT=*                                                  00040212
/*                                                                      00041004
