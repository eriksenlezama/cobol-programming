      //KC03D65A JOB 1,'ERIKSEN  ',NOTIFY=&SYSUID                       00010132
      //**************************************************              00012000
      //* COMPILE COBOL PROGRAM                                         00020000
      //**************************************************              00021000
      //STEP1 EXEC IGYWCL,LNGPRFX=IGY420,REGION=0M,                     00030007
      //      PARM='LIB,OBJECT,APOST,TEST'                              00031007
      //SYSIN        DD DSN=KC03D65.TSU.COBOL(ASSIG003),DISP=SHR        00040038
      //COBOL.SYSLIB DD DSN=CEE.SCEESAMP,DISP=SHR                       00041000
      //LKED.SYSLMOD DD DSN=KC03D65.TSU.LOAD(ASSIG003),DISP=SHR         00050038