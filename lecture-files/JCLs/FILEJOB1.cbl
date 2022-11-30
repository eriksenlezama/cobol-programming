//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID
//**************************************************
//* EXECUTE THE PROGRAM
//**************************************************
//COBEXE   EXEC PGM=FILEEXM1
//STEPLIB  DD DSN=KC02762.TSU.LOAD,DISP=SHR
//INFILE   DD DSN=KC02762.STU.DATA1,DISP=SHR
//OUTFILE  DD DSN=KC02762.STU.OUTFL2,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=(RECFM=FB,LRECL=80,DSORG=PS,BLKSIZE=0),
//            SPACE=(CYL,(1,1),RLSE)
//SYSOUT   DD SYSOUT=*
/*
