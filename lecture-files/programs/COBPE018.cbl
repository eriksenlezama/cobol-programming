      *This program explains about PERFORM  VERB                        00010048
      * Repeating n times                                               00011048
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE018                                             00030048
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-A             PIC 9(3).                                    00033047
       PROCEDURE DIVISION.                                              00036043
       A000-FIRST-PARA.                                                 00037043
            MOVE 100 TO WS-A.                                           00038048
            PERFORM DISPLAY-PARA 5 TIMES                                00039049
            STOP RUN.                                                   00140047
       DISPLAY-PARA.                                                    00150048
            DISPLAY WS-A.                                               00160048
            SUBTRACT 1 FROM WS-A GIVING WS-A.                           00170049
