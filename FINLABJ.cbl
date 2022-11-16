//KC03D65A JOB 1,'ERIKSEN   ',NOTIFY=&SYSUID
//**************************************************
//* EXECUTE THE PROGRAM
//**************************************************
//STEP10  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//SYSIN    DD  *
     DELETE 'KC03D65.TSU.FLABOUT'
/*
//**************************************************
//COBEXE   EXEC PGM=FINLAB
//STEPLIB  DD DSN=KC03D65.TSU.LOAD,DISP=SHR
//INFILE   DD DSN=KC03D65.TSU.FLABINP,DISP=SHR
//OUTFILE  DD DSN=KC03D65.TSU.FLABOUT,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=(RECFM=FB,LRECL=132,DSORG=PS,BLKSIZE=0),
//            SPACE=(CYL,(1,1),RLSE)
//SYSOUT   DD SYSOUT=*
/*
