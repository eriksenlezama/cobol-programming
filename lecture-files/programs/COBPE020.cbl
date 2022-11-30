      *This program explains about PERFORM  WITH TEST                   00010051
      * Repeating until condition                                       00011051
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE020                                             00030054
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-A             PIC 9(1) VALUE 0.                            00033053
       PROCEDURE DIVISION.                                              00036043
       A000-FIRST-PARA.                                                 00037043
            PERFORM PARA-A VARYING WS-A FROM 1 BY 1 UNTIL WS-A > 5.     00039054
            STOP RUN.                                                   00140047
       PARA-A.                                                          00150054
            DISPLAY 'WS-A = ' WS-A.                                     00160053
