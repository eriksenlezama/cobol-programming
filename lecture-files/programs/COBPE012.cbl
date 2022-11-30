      *This program explains about IF Statement                         00010037
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE012                                             00030037
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC 9(2).                                             00033037
          01 WS-NUM2 PIC 9(2).                                          00034037
          01 WS-NUM3 PIC 9(2).                                          00035037
          01 WS-NUM4 PIC 9(2).                                          00036037
       PROCEDURE DIVISION.                                              00037037
       A000-FIRST-PARA.                                                 00038038
           MOVE 55 TO WS-NUM1 WS-NUM3.                                  00039038
           MOVE 25 TO WS-NUM2 WS-NUM4.                                  00040038
           IF WS-NUM1 > WS-NUM2 THEN                                    00060038
             DISPLAY 'I am in 1st IF BLOCK'                             00070037
              IF WS-NUM3 = WS-NUM4 THEN                                 00090037
                   DISPLAY 'I am in 2nd IF BLOCK'                       00100037
                ELSE                                                    00110037
                   DISPLAY 'I am in 2nd ELSE BLOCK'                     00120037
              END-IF                                                    00130037
           ELSE                                                         00150038
            DISPLAY 'I am in 1st ELSE BLOCK'                            00160037
           END-IF.                                                      00170038
           STOP RUN.                                                    00180038
