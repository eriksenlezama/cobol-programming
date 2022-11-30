      *This program explains about OCCURS Clause and OCCURS DEPENDING   00010078
      *TABLE HANDLING - TWO DIMENSIONAL WITH INDEXED BY CLAUSE          00010190
      *SET STATEMENT - TO INCREMENT/DECREMENT/INITIALIZE THE INDEX      00010291
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE029.                                            00030091
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01   WS-TABLE.                                                   00033080
            05 WS-NAME OCCURS 3 TIMES INDEXED BY I.                     00034094
             10 NUM1   PIC 9(2).                                        00035087
             10 NUM2   OCCURS 2 TIMES INDEXED BY J.                     00035194
               15 WS-C PIC 9(2).                                        00035287
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            MOVE '12345678909876543210' TO WS-TABLE.                    00037197
            SET I J TO 1.                                               00037291
            DISPLAY NUM1(I).                                            00037396
            DISPLAY WS-C(I,J).                                          00037491
            SET I J UP BY 1.                                            00037595
            DISPLAY NUM1(I).                                            00037698
            DISPLAY WS-C(I,J).                                          00037791
            STOP RUN.                                                   00037891
