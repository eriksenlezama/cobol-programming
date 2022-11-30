      *This program explains about RELATIONAL condition                 00010039
      * [Data Name/Arithmetic Operation]                                00011039
      * [IS] [NOT]                                                      00013039
      * [Equal to (=),Greater than (>), Less than (<),                  00015039
      * Greater than or Equal (>=), Less than or equal (<=) ]           00016039
      * [Data Name/Arithmetic Operation]                                00018039
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE013                                             00030039
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC 9(2).                                             00033037
       01 WS-NUM2 PIC 9(2).                                             00034039
       PROCEDURE DIVISION.                                              00037037
       A000-FIRST-PARA.                                                 00038038
           MOVE 55 TO WS-NUM1.                                          00039039
           MOVE 25 TO WS-NUM2.                                          00040039
           IF WS-NUM1 IS GREATER THAN OR EQUAL TO WS-NUM2               00060039
             DISPLAY 'WS-NUM1 > WS-NUM2'                                00070039
           ELSE                                                         00080039
             DISPLAY 'WS-NUM1 < WS-NUM2'                                00090039
           END-IF.                                                      00100039
           STOP RUN.                                                    00110039
