//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID
//**************************************************
//* EXECUTE THE PROGRAM
//STEP10  EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//SYSIN    DD  *
     DELETE 'KC02762.TSU.JCLSORT'
/*
//STEP20   EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DSN=KC02762.TSU.INPTMAST,DISP=SHR
//SORTOUT  DD DSN=KC02762.TSU.JCLSORT,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=(RECFM=FB,LRECL=30,DSORG=PS,BLKSIZE=0),
//            SPACE=(CYL,(1,1),RLSE)
//SYSIN    DD *
  SORT FORMAT=CH,
     FIELDS=(1,5,BI,A)
/*