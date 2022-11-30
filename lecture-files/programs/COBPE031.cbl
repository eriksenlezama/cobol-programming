      *This program explains about OCCURS Clause and OCCURS DEPENDING   00010078
      *TABLE HANDLING - ONE/TWO DIMENSIONAL WITH INDEXED BY CLAUSE      00010196
      *SEARCH ALL - TO FIND ELEMENTS FROM THE TABLE. SORTED             00010299
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE030.                                            00030096
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-TABLE.                                                     00033099
          05 WS-STR OCCURS 10 TIMES ASCENDING KEY IS WS-NUM             00034099
                           INDEXED BY I.                                00034199
             10 WS-NUM  PIC 9(2).                                       00034299
             10 WS-NAME PIC X(3).                                       00035199
          05 WS-SRCH    PIC X(2).                                       00035299
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            MOVE '12ABC56DEF34GHI78JKL93MNO11PQR' TO WS-TABLE.          00037199
            SEARCH ALL WS-STR                                           00037499
                AT END DISPLAY WS-SRCH ' NOT FOUND'                     00037596
                WHEN WS-NUM(I) = '11'                                   00037699
                DISPLAY WS-SRCH ' FOUND'                                00037797
                DISPLAY WS-NUM(I)                                       00037899
                DISPLAY WS-NAME(I)                                      00037999
            END-SEARCH.                                                 00038096
            STOP RUN.                                                   00039091
