//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//STEP10  EXEC PGM=IEFBR14                                              00013010
//SYSPRINT DD  SYSOUT=*                                                 00014010
//SYSOUT   DD  SYSOUT=*                                                 00015010
//SYSDUMP  DD  SYSOUT=*                                                 00015110
//DD1      DD  DSN=KC02762.TSU.REGSFILE,                                00016018
//             DISP=(NEW,CATLG,DELETE),                                 00017012
//             SPACE=(CYL,(1,1)),UNIT=DISK,                             00018014
//             DCB=(DSORG=PS,RECFM=FB,LRECL=83,BLKSIZE=0)               00019018
/*                                                                      00019116
//*                                                                     00019216
