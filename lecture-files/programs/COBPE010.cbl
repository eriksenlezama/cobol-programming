      *This program explains about REDEFINES CLAUSE                     00010033
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE010                                             00030033
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-DESCRIPTION.                                               00033033
          05 WS-DATE1.                                                  00034033
          10 WS-YEAR PIC X(4).                                          00035033
          10 WS-MONTH PIC X(2).                                         00036033
          10 WS-DATE PIC X(2).                                          00037033
          05 WS-DATE2 REDEFINES WS-DATE1 PIC 9(8).                      00038033
       PROCEDURE DIVISION.                                              00039033
           ACCEPT WS-DATE1 FROM DATE YYYYMMDD.                          00039133
           DISPLAY "WS-DATE1 : " WS-DATE1.                              00040034
           DISPLAY "WS-DATE2 : " WS-DATE2.                              00050034
           STOP RUN.                                                    00070034
