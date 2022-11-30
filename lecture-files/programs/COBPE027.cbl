      *This program explains about OCCURS Clause and OCCURS DEPENDING   00010078
      *TABLE HANDLING - TWO DIMENSIONAL WITH SUBSCRIPT                  00010183
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE027.                                            00030083
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01   WS-TABLE.                                                   00033080
            05 WS-NAME OCCURS 3 TIMES.                                  00034083
             10 WS-A   PIC X(2).                                        00035083
             10 WS-B   OCCURS 2 TIMES.                                  00035183
               15 WS-C PIC X(3).                                        00035283
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            MOVE '1234567890ABCDEFGHIJKLMN'                             00037186
                 TO WS-TABLE.                                           00037285
            DISPLAY 'WS-TABLE: ' WS-TABLE.                              00038083
            DISPLAY 'WS-A(1) : ' WS-A(1).                               00039083
            DISPLAY 'WS-C(1,1) : ' WS-C(1,1).                           00040083
            DISPLAY 'WS-C(1,2) : ' WS-C(1,2).                           00050083
            DISPLAY 'WS-C(2,1) : ' WS-C(2,1).                           00060084
            STOP RUN.                                                   00120065
