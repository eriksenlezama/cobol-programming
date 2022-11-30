      *This program explains about COMPUTE VERB                         00010032
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE009                                             00030032
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-NUM1 PIC 9(3) VALUE 10.                                    00040032
       01 WS-NUM2 PIC 9(3) VALUE 10.                                    00050032
       01 WS-NUM3 PIC 9(3) VALUE 10.                                    00051032
       01 WS-NUMA PIC 9(3) VALUE 50.                                    00060032
       01 WS-NUMB PIC 9(3) VALUE 10.                                    00070032
       01 WS-NUMC PIC 9(3).                                             00080030
       PROCEDURE DIVISION.                                              00110028
           COMPUTE WS-NUMC=                                             00122032
            (WS-NUM1 * WS-NUM2) - (WS-NUMA / WS-NUMB) + WS-NUM3.        00122132
              DISPLAY "WS-NUM1     : " WS-NUM1                          00123032
              DISPLAY "WS-NUM2     : " WS-NUM2                          00124032
              DISPLAY "WS-NUM3     : " WS-NUM3                          00125032
              DISPLAY "WS-NUMA     : " WS-NUMA                          00126032
              DISPLAY "WS-NUMB     : " WS-NUMB                          00127032
              DISPLAY "WS-NUMC     : " WS-NUMC                          00128032
           STOP RUN.                                                    00138028
