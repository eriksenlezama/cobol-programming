//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID
//**************************************************
//* EXECUTE THE PROGRAM
//**************************************************
//COBEXE   EXEC PGM=CRSTFILE
//STEPLIB  DD DSN=KC02762.TSU.LOAD,DISP=SHR
//STFILE   DD DSN=KC02762.STU.DATAY,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=0),
//            SPACE=(TRK,(1,1),RLSE)
//SYSIN    DD  *
12345SRINIVAS
89045DAVID
                              Y
/*
