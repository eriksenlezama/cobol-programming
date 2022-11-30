      *This program explains about ADD verb                             00010025
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. HELLO.                                               00030024
       DATA DIVISION.                                                   00050024
       WORKING-STORAGE SECTION.                                         00060024
       01 WS-NUM1 PIC 9(3) VALUE 20 .                                   00070024
       01 WS-NUM2 PIC 9(3) VALUE 20.                                    00080024
       01 WS-NUM3 PIC 9(3) VALUE 20.                                    00090024
       01 WS-NUM4 PIC 9(3) VALUE 20.                                    00100024
       01 WS-NUMA PIC 9(3) VALUE 20.                                    00110024
       01 WS-NUMB PIC 9(3) VALUE 20.                                    00120024
       01 WS-NUMC PIC 9(3) VALUE 20.                                    00130024
       01 WS-NUMD PIC 9(3) VALUE 20.                                    00140024
       01 WS-NUME PIC 9(3) VALUE 20.                                    00150024
       PROCEDURE DIVISION.                                              00160024
           ADD WS-NUM1 WS-NUM2 TO WS-NUM3 WS-NUM4.                      00170024
           ADD WS-NUMA WS-NUMB WS-NUMC TO WS-NUMD GIVING WS-NUME.       00180024
           DISPLAY "WS-NUM1     : " WS-NUM1                             00190024
           DISPLAY "WS-NUM2     : " WS-NUM2                             00200024
           DISPLAY "WS-NUM3     : " WS-NUM3                             00210024
           DISPLAY "WS-NUM4     : " WS-NUM4                             00220024
           DISPLAY "WS-NUMA     : " WS-NUMA                             00230024
           DISPLAY "WS-NUMB     : " WS-NUMB                             00240024
           DISPLAY "WS-NUMC     : " WS-NUMC                             00250024
           DISPLAY "WS-NUMD     : " WS-NUMD                             00260024
           DISPLAY "WS-NUME     : " WS-NUME                             00270024
           STOP RUN.                                                    00290024
