//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//STEP10  EXEC PGM=IEFBR14                                              00013010
//SYSPRINT DD  SYSOUT=*                                                 00014010
//SYSOUT   DD  SYSOUT=*                                                 00015010
//SYSDUMP  DD  SYSOUT=*                                                 00015110
//DD1      DD  DSN=KC02762.TSU.XXXXX,                                   00016016
//             DISP=(NEW,CATLG,DELETE),                                 00017012
//             SPACE=(CYL,(1,1)),UNIT=DISK,                             00018014
//             DCB=(DSORG=PS,RECFM=FB,LRECL=80,BLKSIZE=0)               00019016
//*                                                                     00019110
