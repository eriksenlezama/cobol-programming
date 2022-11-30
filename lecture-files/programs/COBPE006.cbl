      *This program explains about SUBTRACT verb                        00010026
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE006                                             00030026
       DATA DIVISION.                                                   00040026
       WORKING-STORAGE SECTION.                                         00050026
       01 WS-NUM1 PIC 9(3) VALUE 10 .                                   00060026
       01 WS-NUM2 PIC 9(3) VALUE 10.                                    00070026
       01 WS-NUM3 PIC 9(3) VALUE 100.                                   00080026
       01 WS-NUM4 PIC 9(3) VALUE 100.                                   00090026
       01 WS-NUMA PIC 9(3) VALUE 10.                                    00100026
       01 WS-NUMB PIC 9(3) VALUE 10.                                    00110026
       01 WS-NUMC PIC 9(3) VALUE 10.                                    00120026
       01 WS-NUMD PIC 9(3) VALUE 100.                                   00130026
       01 WS-NUME PIC 9(3) VALUE 10.                                    00140026
       PROCEDURE DIVISION.                                              00150026
           SUBTRACT WS-NUM1 WS-NUM2 FROM WS-NUM3 WS-NUM4.               00160027
           SUBTRACT WS-NUMA WS-NUMB WS-NUMC FROM WS-NUMD GIVING WS-NUME.00170027
           DISPLAY "WS-NUM1     : " WS-NUM1                             00190027
           DISPLAY "WS-NUM2     : " WS-NUM2                             00200027
           DISPLAY "WS-NUM3     : " WS-NUM3                             00210027
           DISPLAY "WS-NUM4     : " WS-NUM4                             00220027
           DISPLAY "WS-NUMA     : " WS-NUMA                             00230027
           DISPLAY "WS-NUMB     : " WS-NUMB                             00240027
           DISPLAY "WS-NUMC     : " WS-NUMC                             00250027
           DISPLAY "WS-NUMD     : " WS-NUMD                             00260027
           DISPLAY "WS-NUME     : " WS-NUME                             00270027
           STOP RUN.                                                    00290027
