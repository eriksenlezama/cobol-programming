//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010113
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=CALCTAX                                             00030017
//STEPLIB  DD DSN=KC02762.TSU.LOAD,DISP=SHR                             00040008
//SYSIN    DD *                                                         00040216
12345                                                                   00040419
/*                                                                      00041004
//SYSOUT   DD *                                                         00042019
