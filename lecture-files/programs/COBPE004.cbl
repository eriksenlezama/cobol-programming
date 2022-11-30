       IDENTIFICATION DIVISION.                                         00010020
       PROGRAM-ID. COBPE004                                             00020022
       DATA DIVISION.                                                   00040020
          WORKING-STORAGE SECTION.                                      00050020
          01 WS-NUM1 PIC 9(9).                                          00060020
          01 WS-NUM2 PIC 9(9).                                          00070020
          01 WS-NUM3 PIC 9(5).                                          00080020
          01 WS-NUM4 PIC 9(6).                                          00090020
          01 WS-ADDRESS.                                                00100020
             05 WS-HOUSE-NUMBER PIC 9(3).                               00110020
             05 WS-COUNTRY PIC X(5).                                    00120020
             05 WS-POSTAL-CODE PIC 9(5).                                00130020
          01 WS-ADDRESS1   PIC X(13).                                   00131021
       PROCEDURE DIVISION.                                              00140020
       A000-FIRST-PARA.                                                 00150022
           MOVE 123456789 TO WS-NUM1.                                   00160020
           MOVE WS-NUM1 TO WS-NUM2 WS-NUM3.                             00170020
           MOVE WS-NUM1(3:6) TO WS-NUM4.                                00180020
           MOVE 123 TO WS-HOUSE-NUMBER.                                 00190020
           MOVE 'USA' TO WS-COUNTRY.                                    00200020
           MOVE 75035 TO WS-POSTAL-CODE.                                00210020
           MOVE WS-ADDRESS TO WS-ADDRESS1.                              00220020
           DISPLAY "WS-NUM1     : " WS-NUM1.                            00240021
           DISPLAY "WS-NUM2     : " WS-NUM2.                            00250021
           DISPLAY "WS-NUM3     : " WS-NUM3.                            00260021
           DISPLAY "WS-NUM4     : " WS-NUM4.                            00270021
           DISPLAY "WS-ADDRESS  : " WS-ADDRESS.                         00280021
           DISPLAY "WS-ADDRESS1 : " WS-ADDRESS1.                        00281021
           STOP RUN.                                                    00290023
