      *This program explains about EVALUATE VERB                        00010047
      * Replacement to IF/else nested if                                00011047
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE017                                             00030047
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-A             PIC 9(3).                                    00033047
       PROCEDURE DIVISION.                                              00036043
       A000-FIRST-PARA.                                                 00037043
            MOVE 10 TO WS-A.                                            00038047
            EVALUATE TRUE                                               00039047
               WHEN WS-A > 5                                            00040047
                   DISPLAY 'WS-A GREATER THAN 2'                        00050047
               WHEN WS-A < 0                                            00070047
                   DISPLAY 'WS-A LESS THAN 0'                           00080047
               WHEN OTHER                                               00100047
                   DISPLAY 'INVALID VALUE OF WS-A'                      00110047
            END-EVALUATE.                                               00120047
            STOP RUN.                                                   00140047
