//KC02762C JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010114
//**************************************************                    00012000
//* COMPILE COBOL PROGRAM                                               00020000
//**************************************************                    00021000
//STEP1 EXEC IGYWCL,LNGPRFX=IGY420,REGION=0M,                           00030007
//      PARM='LIB,OBJECT,APOST,TEST'                                    00031007
//SYSIN        DD DSN=KC02762.TSU.COBOL(COBCALP1),DISP=SHR              00040076
//COBOL.SYSLIB DD DSN=CEE.SCEESAMP,DISP=SHR                             00041000
//LKED.SYSLMOD DD DSN=KC02762.TSU.LOAD(COBCALP1),DISP=SHR               00050076
