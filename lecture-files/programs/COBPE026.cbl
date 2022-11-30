      *This program explains about OCCURS Clause and OCCURS DEPENDING   00010078
      *TABLE HANDLING - TWO DIMENSIONAL                                 00010179
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE025.                                            00030078
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01   WS-TABLE.                                                   00033080
            05 WS-NAME OCCURS 2 TIMES.                                  00034082
             10 WS-A   PIC X(4) VALUE 'ROWS'.                           00035080
             10 WS-B   OCCURS 3 TIMES.                                  00035179
               15 WS-C PIC X(7) VALUE 'COLUMNS'.                        00035281
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            DISPLAY 'ONE DIMENSION TABLE: ' WS-TABLE.                   00038078
            STOP RUN.                                                   00120065
