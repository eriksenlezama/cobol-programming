//KC02762R JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID
//**************************************************
//* EXECUTE THE PROGRAM
//**************************************************
//COBEXE   EXEC PGM=DISPRECS
//STEPLIB  DD DSN=KC02762.TSU.LOAD,DISP=SHR
//STUFILE  DD DSN=KC02762.STU.DATA,DISP=SHR
//SYSOUT   DD SYSOUT=*
/*
