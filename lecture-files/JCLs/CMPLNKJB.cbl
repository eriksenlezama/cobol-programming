//KC02762J JOB 1,'SRINIVAS  ',NOTIFY=&SYSUID                            00010103
//**************************************************                    00012000
//* COMPILE COBOL PROGRAM                                               00020000
//**************************************************                    00021000
//STEP1 EXEC IGYWCL,LNGPRFX=IGY420,REGION=0M,                           00030007
//      PARM='LIB,OBJECT,APOST,TEST'                                    00031007
//SYSIN        DD DSN=KC02762.TSU.COBOL(SORTPG01),DISP=SHR              00040010
//COBOL.SYSLIB DD DSN=CEE.SCEESAMP,DISP=SHR                             00041000
//LKED.SYSLMOD DD DSN=KC02762.TSU.LOAD(SORTPG01),DISP=SHR               00050010
