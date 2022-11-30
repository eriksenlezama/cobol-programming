//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID
//**************************************************
//* EXECUTE THE PROGRAM
//**************************************************
//COBEXE   EXEC PGM=CREASTFL
//STEPLIB  DD DSN=KC02762.TSU.LOAD,DISP=SHR
//SDDATA   DD DSN=KC02762.STU.DATAZ,
//            DISP=(NEW,CATLG,DELETE),
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=0),
//            SPACE=(TRK,(1,1),RLSE)
//SYSIN    DD  *
1234567SUKUMARSSR19970101CSC1M
/*
