      *This program explains about PERFORM  WITH TEST                   00010051
      * Repeating until condition                                       00011051
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE019                                             00030051
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-A             PIC 9(1) VALUE 0.                            00033053
       PROCEDURE DIVISION.                                              00036043
       A000-FIRST-PARA.                                                 00037043
            MOVE 100 TO WS-A.                                           00038048
            PERFORM DISPLAY-PARA WITH TEST AFTER UNTIL WS-A > 5.        00039052
            STOP RUN.                                                   00140047
       DISPLAY-PARA.                                                    00150048
            DISPLAY 'WS-A = ' WS-A.                                     00160053
            ADD 1 TO WS-A.                                              00170051
