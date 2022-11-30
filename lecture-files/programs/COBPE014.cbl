      *This program explains about SIGN CONDITION                       00010040
      * [Data Name/Arithmetic Operation]                                00011039
      * [IS] [NOT]                                                      00013039
      * [Positive, Negative or Zero]                                    00015040
      * [Data Name/Arithmetic Operation]                                00016040
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE014                                             00030041
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC S9(3) VALUE -123.                                 00033040
       01 WS-NUM2 PIC 9(3) VALUE 123.                                   00034040
       PROCEDURE DIVISION.                                              00037037
       A000-FIRST-PARA.                                                 00038038
           IF WS-NUM1 IS POSITIVE THEN                                  00039040
                 DISPLAY 'WS-NUM1 IS POSITIVE'.                         00040040
              IF WS-NUM1 IS NEGATIVE THEN                               00060040
                 DISPLAY 'WS-NUM1 IS NEGATIVE'.                         00070040
              IF WS-NUM1 IS ZERO THEN                                   00090040
                 DISPLAY 'WS-NUM1 IS ZERO'.                             00100040
              IF WS-NUM2 IS POSITIVE THEN                               00120040
                 DISPLAY 'WS-NUM2 IS POSITIVE'.                         00130040
           STOP RUN.                                                    00150040
