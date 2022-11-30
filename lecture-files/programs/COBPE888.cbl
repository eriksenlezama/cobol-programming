      *This program explains about IF Statement                         00010037
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE888.                                            00030039
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC 9(3).                                             00034043
       01 WS-NUM2 PIC 9(3).                                             00035043
       01 WS-NUM3 PIC 9(5).                                             00035146
       01 WS-EDIT-NUMBER PIC ZZ9.                                       00036045
       PROCEDURE DIVISION.                                              00037037
       A000-FIRST-PARA.                                                 00038038
           accept ws-num1.                                              00039041
           accept ws-num2.                                              00040041
           IF WS-NUM1 < WS-NUM2 THEN                                    00060039
             MOVE WS-NUM1 TO WS-EDIT-NUMBER                             00061045
             DISPLAY 'ws-num1 is small: ' WS-EDIT-NUMBER                00070045
           else                                                         00090039
             MOVE ws-num2 TO WS-EDIT-NUMBER                             00091045
             DISPLAY 'ws-num2 is small:' WS-EDIT-NUMBER                 00100045
           end-if.                                                      00110046
           ADD WS-NUM1 WS-NUM2 TO WS-NUM3.                              00120047
           MOVE ws-num3 TO WS-EDIT-NUMBER                               00121048
           DISPLAY 'THE SUM = ' WS-EDIT-NUMBER                          00130048
           STOP RUN.                                                    00180038
