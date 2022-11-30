//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//STEP10  EXEC PGM=IDCAMS                                               00013016
//SYSPRINT DD  SYSOUT=*                                                 00014010
//SYSOUT   DD  SYSOUT=*                                                 00015010
//SYSIN    DD  *                                                        00016016
     DELETE 'KC02762.TSU.FILEX'                                         00017019
/*                                                                      00018016
