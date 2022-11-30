      *This program explains about OCCURS Clause and OCCURS DEPENDING   00010078
      *OCCURS N TIMES                                                   00010178
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE025.                                            00030078
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-TABLE.                                                     00033078
          05 WS-NAME PIC X(09) VALUE 'SRINIVAS ' OCCURS 4 TIMES.        00034078
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            DISPLAY 'ONE DIMENSION TABLE: ' WS-TABLE.                   00038078
            STOP RUN.                                                   00120065
