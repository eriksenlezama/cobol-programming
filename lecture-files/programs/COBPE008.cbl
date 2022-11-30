      *This program explains about DIVIDE verb                          00010030
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE007                                             00030028
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC 9(3) VALUE 5.                                     00040030
       01 WS-NUM2 PIC 9(3) VALUE 250.                                   00050030
       01 WS-NUMA PIC 9(3) VALUE 100.                                   00060030
       01 WS-NUMB PIC 9(3) VALUE 15.                                    00070030
       01 WS-NUMC PIC 9(3).                                             00080030
       01 WS-REM PIC 9(3).                                              00090030
       PROCEDURE DIVISION.                                              00110028
           DIVIDE WS-NUMA BY WS-NUMB GIVING WS-NUMC REMAINDER WS-REM.   00122030
           DISPLAY "WS-NUM1     : " WS-NUM1                             00123030
           DISPLAY "WS-NUM2     : " WS-NUM2                             00124030
           DISPLAY "WS-NUMA     : " WS-NUMA                             00125030
           DISPLAY "WS-NUMB     : " WS-NUMB                             00126030
           DISPLAY "WS-NUMC     : " WS-NUMC                             00127030
           DISPLAY "WS-REM      : " WS-REM                              00128030
           STOP RUN.                                                    00138028
