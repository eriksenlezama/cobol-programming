      //KC03D65A JOB 1,'ERIKSEN   ',NOTIFY=&SYSUID
      //**************************************************
      //* EXECUTE THE PROGRAM
      //**************************************************
      //STEP10  EXEC PGM=IDCAMS
      //SYSPRINT DD  SYSOUT=*
      //SYSOUT   DD  SYSOUT=*
      //SYSIN    DD  *
           DELETE 'KC03D65.SALESRPT.DATA'
      /*
      //**************************************************
      //COBEXE   EXEC PGM=ASSIG003
      //STEPLIB  DD DSN=KC03D65.TSU.LOAD,DISP=SHR
      //CUSTMAST DD DSN=KC03D65.TSU.DATA,DISP=SHR
      //SALESRPT DD DSN=KC03D65.SALESRPT.DATA,
      //            DISP=(NEW,CATLG,DELETE),
      //            DCB=(RECFM=FB,LRECL=132,DSORG=PS,BLKSIZE=0),
      //            SPACE=(CYL,(1,1),RLSE)
      //SYSOUT   DD SYSOUT=*
      /*