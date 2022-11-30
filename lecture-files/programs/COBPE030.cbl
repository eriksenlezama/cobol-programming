      *This program explains about OCCURS Clause and OCCURS DEPENDING   00010078
      *TABLE HANDLING - ONE/TWO DIMENSIONAL WITH INDEXED BY CLAUSE      00010196
      *SEARCH - TO FIND ELEMENTS FROM THE TABLE. SORTED/UNSORTED        00010299
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE030.                                            00030096
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-TABLE.                                                     00034099
             05 WS-STR PIC X(1) OCCURS 8 TIMES INDEXED BY I.            00035099
       01 WS-SRCH PIC X(1).                                             00035199
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            ACCEPT WS-SRCH.                                             00037299
            MOVE 'SRINIVAS' TO WS-TABLE.                                00037399
            SET I TO 1.                                                 00037499
            SEARCH  WS-STR                                              00037599
                AT END DISPLAY WS-SRCH ' NOT FOUND'                     00037696
                WHEN WS-STR(I) = WS-SRCH                                00037799
                DISPLAY WS-SRCH ' FOUND'                                00037897
                DISPLAY WS-STR(I)                                       00037999
            END-SEARCH.                                                 00038196
            STOP RUN.                                                   00039091
