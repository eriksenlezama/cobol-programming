//KC02762C JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010114
//**************************************************                    00012000
//* COMPILE COBOL PROGRAM                                               00020000
//**************************************************                    00021000
//*-------------------------------------------------------
//* DECLARATION OF VARIABLES
//*-------------------------------------------------------
// SET WSPC=500
// SET MEM=COBCALP1
// SET SRC=KC02762.TSU.COBOL
// SET LOAD=KC02762.TSU.LOAD
// SET OBJ=KC02762.TSU.OBJ
//*-------------------------------------------------------
//*COMPILE STEP
//*-------------------------------------------------------
//STEP1 EXEC IGYWCL,LNGPRFX=IGY420,REGION=0M,
//      PARM='LIB,OBJECT,APOST,TEST'
//SYSPRINT DD SYSOUT=A
//SYSIN    DD DSN=&SRC(COBCALP1)
//SYSLIN   DD DSN=&OBJ,DISP=OLD,
//SYSUT1   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT2   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT3   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT4   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT5   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT6   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//SYSUT7   DD SPACE=(800,(&WSPC,&WSPC),,,ROUND),UNIT=SYSDA
//*-------------------------------------------------------
//*LINK EDIT STEP
//*-------------------------------------------------
//STEP2   EXEC PGM=IEWL
//SYSLIB   DD DSN=CEE.SCEELKED,DISP=SHR
//SYSLIN   DD DSN=&OBJ,DISP=SHR
//SYSLMOD DD DSN=&LOAD(&MEM),
//        DISP=SHR
//SYSPRINT DD SYSOUT=A
//SYSUT1   DD SPACE=(1024,(50,50)),UNIT=SYSDA
