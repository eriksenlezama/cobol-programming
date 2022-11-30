      *This program explains about RENAMES CLAUSE                       00010035
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE011                                             00030035
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-DESCRIPTION.                                               00033035
          05 WS-NUM.                                                    00034035
          10 WS-NUM1 PIC 9(2) VALUE 99.                                 00035036
          10 WS-NUM2 PIC 9(2) VALUE 88.                                 00036036
          05 WS-CHAR.                                                   00037035
          10 WS-CHAR1 PIC X(2) VALUE 'XX'.                              00038036
          10 WS-CHAR2 PIC X(2) VALUE 'ZZ'.                              00039036
          66 WS-NEW-NAME RENAMES WS-NUM2 THRU WS-CHAR2.                 00040035
       PROCEDURE DIVISION.                                              00060035
           DISPLAY "WS-NEW NAME : " WS-NEW-NAME.                        00070035
           STOP RUN.                                                    00090035
