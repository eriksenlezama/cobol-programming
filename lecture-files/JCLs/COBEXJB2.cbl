//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010113
//**************************************************                    00012000
//* EXECUTE THE PROGRAM                                                 00020004
//**************************************************                    00021000
//COBEXE   EXEC PGM=CRINFILE                                            00030008
//STEPLIB  DD DSN=KC02762.TSU.LOAD,DISP=SHR                             00040008
//INFILE   DD DSN=KC02762.STUDENT.FILE,DISP=SHR                         00040113
//OUTFILE  DD SYSOUT=*                                                  00040415
/*                                                                      00041004
