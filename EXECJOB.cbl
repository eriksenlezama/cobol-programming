      //KC03D65A JOB 1,'ERIKSEN   ',NOTIFY=&SYSUID                      00010124
      //**************************************************              00012000
      //* EXECUTE THE PROGRAM                                           00020004
      //**************************************************              00021000
      //COBEXE   EXEC PGM=ASSIG002                                      00030038
      //STEPLIB  DD DSN=KC03D65.TSU.LOAD(ASSIG002),DISP=SHR             00040038
      //SYSOUT   DD SYSOUT=*                                            00040108
      //SYSIN    DD *                                                   00040208
      INPUTXX                                                           00040335
      INPUTYY                                                           00040435
      Y                                                                 00040533
      /*                                                                00041004
