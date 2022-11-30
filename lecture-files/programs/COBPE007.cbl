      *This program explains about MULTIPLY verb                        00010028
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE007                                             00030028
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC 9(3) VALUE 10 .                                   00040028
       01 WS-NUM2 PIC 9(3) VALUE 10.                                    00050028
       01 WS-NUM3 PIC 9(3) VALUE 10.                                    00060028
       01 WS-NUMA PIC 9(3) VALUE 10.                                    00070028
       01 WS-NUMB PIC 9(3) VALUE 10.                                    00080028
       01 WS-NUMC PIC 9(3) VALUE 10.                                    00090028
       PROCEDURE DIVISION.                                              00110028
           MULTIPLY WS-NUM1 BY WS-NUM2 WS-NUM3.                         00120028
           MULTIPLY WS-NUMA BY WS-NUMB GIVING WS-NUMC.                  00130028
           DISPLAY "WS-NUM1     : " WS-NUM1                             00131028
           DISPLAY "WS-NUM2     : " WS-NUM2                             00132028
           DISPLAY "WS-NUM3     : " WS-NUM3                             00133028
           DISPLAY "WS-NUMA     : " WS-NUMA                             00134028
           DISPLAY "WS-NUMB     : " WS-NUMB                             00135028
           DISPLAY "WS-NUMC     : " WS-NUMC                             00136028
           STOP RUN.                                                    00138028
