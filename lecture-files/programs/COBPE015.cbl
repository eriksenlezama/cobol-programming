      *This program explains about C;ASS CONDITION                      00010042
      * [Data Name/Arithmetic Operation>]                               00011042
      * [IS] [NOT]                                                      00013039
      * [NUMERIC, ALPHABETIC, ALPHABETIC-LOWER, ALPHABETIC-UPPER]       00015042
      * [Data Name/Arithmetic Operation]                                00016040
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE014                                             00030041
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC X(9) VALUE 'SRINI'.                               00033042
       01 WS-NUM2 PIC 9(3) VALUE 123.                                   00034040
       PROCEDURE DIVISION.                                              00037037
       A000-FIRST-PARA.                                                 00038038
           IF WS-NUM1 IS ALPHABETIC THEN                                00039042
                 DISPLAY 'WS-NUM1 IS ALPHABETIC'.                       00040042
              IF WS-NUM1 IS NUMERIC THEN                                00060042
                 DISPLAY 'WS-NUM1 IS NUMERIC'.                          00070042
              IF WS-NUM2 IS NUMERIC THEN                                00090042
                 DISPLAY 'WS-NUM2 IS NUMERIC'.                          00100042
           STOP RUN.                                                    00120042
