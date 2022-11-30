//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//STEP10  EXEC PGM=IEBGENR                                              00013017
//SYSPRINT DD  SYSOUT=*                                                 00014010
//SYSOUT   DD  SYSOUT=*                                                 00015010
//SYSDUMP  DD  SYSOUT=*                                                 00015110
//SYSUT1   DD  DSN=KC02762.TSU.DATA,DISP=SHR                            00016017
//SYSUT2   DD  DSN=KC02762.TSU.CUSTOLD,                                 00016119
//             DISP=(NEW,CATLG,DELETE),                                 00017012
//             SPACE=(CYL,(1,1)),UNIT=DISK,                             00018014
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80,BLKSIZE=0)               00019017
//SYSIN    DD  *                                                        00019117
/*                                                                      00019216
