      *This program explains about OCCURS Clause and OCCURS DEPENDING   00010078
      *TABLE HANDLING - TWO DIMENSIONAL WITH INDEXED BY CLAUSE          00010190
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE028.                                            00030087
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01   WS-TABLE.                                                   00033080
            05 WS-A OCCURS 3 TIMES INDEXED BY I.                        00034094
             10 WS-B   PIC X(2).                                        00035097
             10 WS-C   OCCURS 2 TIMES INDEXED BY J.                     00035194
               15 WS-D PIC X(3).                                        00035295
       PROCEDURE DIVISION.                                              00036099
       PARA-A.                                                          00037099
            MOVE '12ABCDEF34GHIJKL56MNOPQR' TO WS-TABLE.                00037194
            PERFORM PARA-B VARYING I FROM 1 BY 1 UNTIL I > 3.           00038098
            STOP RUN.                                                   00038287
       PARA-B.                                                          00038398
            DISPLAY WS-B(I).                                            00038499
            PERFORM PARA-C VARYING J FROM 1 BY 1 UNTIL J > 2.           00038597
       PARA-C.                                                          00038687
            DISPLAY WS-C(I, J).                                         00038797
