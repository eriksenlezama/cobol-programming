      *This program explains about CONDITION NAME CONDITION             00010043
      * 88 [Condition-Name] VALUE [IS, ARE] [LITERAL] [THRU LITERAL].   00011043
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE016                                             00030043
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-GRADE-POINT   PIC 9(3).                                    00033043
       88 PASS VALUES ARE 041 THRU 100.                                 00034043
       88 FAIL VALUES ARE 000 THRU 40.                                  00035043
       PROCEDURE DIVISION.                                              00036043
       A000-FIRST-PARA.                                                 00037043
           MOVE 65 TO WS-GRADE-POINT.                                   00038044
           IF PASS                                                      00040043
              DISPLAY 'Passed with ' WS-GRADE-POINT 'points.'.          00050046
           IF FAIL                                                      00070043
              DISPLAY 'FAILED with ' WS-GRADE-POINT 'points.'.          00080046
           STOP RUN.                                                    00100043
