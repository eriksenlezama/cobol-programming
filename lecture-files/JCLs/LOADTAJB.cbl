//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID
//**************************************************
//* EXECUTE THE PROGRAM
//**************************************************
//COBEXE   EXEC PGM=LOADTABL
//STEPLIB  DD DSN=KC02762.TSU.LOAD,DISP=SHR
//RATETABL DD DSN=KC02762.TSU.RATETS,DISP=SHR
//RATELIST DD DSN=KC02762.TSU.RATELIST,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=(RECFM=FB,LRECL=40,DSORG=PS,BLKSIZE=0),
//            SPACE=(CYL,(1,1),RLSE)
//SYSOUT   DD SYSOUT=*
/*
