       IDENTIFICATION DIVISION.                                         00010074
       PROGRAM-ID. RPRT1000.                                            00020099
      *                                                                 00030099
       ENVIRONMENT DIVISION.                                            00040074
       INPUT-OUTPUT SECTION.                                            00050075
       FILE-CONTROL.                                                    00060075
           SELECT CUSTMAST ASSIGN TO CUSTMAST.                          00090099
           SELECT SALESRPT ASSIGN TO SALESRPT.                          00092099
      *                                                                 00093099
       DATA DIVISION.                                                   00100074
      *                                                                 00101099
       FILE SECTION.                                                    00110074
       FD  CUSTMAST.                                                    00150699
       01  CUSTOMER-MASTER-RECORD.                                      00150799
           05  CM-BRANCH-NUMBER        PIC 9(2).                        00150899
           05  CM-SALESREP-NUMBER      PIC 9(2).                        00150999
           05  CM-CUSTOMER-NUMBER      PIC 9(5).                        00151099
           05  CM-CUSTOMER-NAME        PIC X(20).                       00151199
           05  CM-SALES-THIS-YTD       PIC 9(5)V9(2).                   00151299
           05  CM-SALES-LAST-YTD       PIC 9(5)V9(2).                   00151399
           05  FILLER                  PIC X(37).                       00151499
      *                                                                 00151599
       FD  SALESRPT.                                                    00152499
       01 PRINT-AREA        PIC X(132).                                 00152799
      *                                                                 00152899
       WORKING-STORAGE SECTION.                                         00152996
      *                                                                 00153099
       01  SWITCHES.                                                    00153199
           05  CUSTMAST-EOF-SWITCH     PIC X    VALUE "N".              00153299
      *                                                                 00153399
       01  PRINT-FIELDS.                                                00153599
           05  PAGE-COUNT      PIC S9(3)   VALUE ZERO.                  00153699
           05  LINES-ON-PAGE   PIC S9(3)   VALUE +55.                   00154099
           05  LINE-COUNT      PIC S9(3)   VALUE +02.                   00155099
      *                                                                 00157099
       01  TOTAL-FIELDS.                                                00158099
           05  GRAND-TOTAL-THIS-YTD   PIC S9(7)V99   VALUE ZERO.        00159099
           05  GRAND-TOTAL-LAST-YTD   PIC S9(7)V99   VALUE ZERO.        00160099
      *                                                                 00170099
       01  CURRENT-DATE-AND-TIME.                                       00180099
           05  CD-YEAR         PIC 9999.                                00190099
           05  CD-MONTH        PIC 99.                                  00200099
           05  CD-DAY          PIC 99.                                  00210099
           05  CD-HOURS        PIC 99.                                  00220099
           05  CD-MINUTES      PIC 99.                                  00230099
           05  FILLER          PIC X(9).                                00240099
      *                                                                 00250099
       01  HEADING-LINE-1.                                              00260099
           05  FILLER          PIC X(7)    VALUE "DATE:  ".             00270099
           05  HL1-MONTH       PIC 9(2).                                00280099
           05  FILLER          PIC X(1)    VALUE "/".                   00290099
           05  HL1-DAY         PIC 9(2).                                00300099
           05  FILLER          PIC X(1)    VALUE "/".                   00310099
           05  HL1-YEAR        PIC 9(4).                                00320099
           05  FILLER          PIC X(11)   VALUE SPACE.                 00330099
           05  FILLER          PIC X(20)   VALUE "YEAR-TO-DATE SALES R".00340099
           05  FILLER          PIC X(20)   VALUE "EPORT               ".00350099
           05  FILLER          PIC X(8)    VALUE "  PAGE: ".            00360099
           05  HL1-PAGE-NUMBER PIC ZZZ9.                                00370099
           05  FILLER          PIC X(52)   VALUE SPACE.                 00380099
      *                                                                 00390099
       01  HEADING-LINE-2.                                              00400099
           05  FILLER          PIC X(7)    VALUE "TIME:  ".             00410099
           05  HL2-HOURS       PIC 9(2).                                00420099
           05  FILLER          PIC X(1)    VALUE ":".                   00430099
           05  HL2-MINUTES     PIC 9(2).                                00440099
           05  FILLER          PIC X(58)   VALUE SPACE.                 00450099
           05  FILLER          PIC X(10)   VALUE "RPT1000".             00460099
           05  FILLER          PIC X(52)   VALUE SPACE.                 00470099
      *                                                                 00480099
       01  HEADING-LINE-3.                                              00490099
           05  FILLER      PIC X(20)   VALUE "CUST                ".    00500099
           05  FILLER      PIC X(20)   VALUE "            SALES   ".    00510099
           05  FILLER      PIC X(20)   VALUE "      SALES         ".    00520099
           05  FILLER      PIC X(72)   VALUE SPACE.                     00530099
      *                                                                 00540099
       01  HEADING-LINE-4.                                              00550099
           05  FILLER      PIC X(20)   VALUE "NUM    CUSTOMER NAME".    00560099
           05  FILLER      PIC X(20)   VALUE "           THIS YTD ".    00570099
           05  FILLER      PIC X(20)   VALUE "     LAST YTD       ".    00580099
           05  FILLER      PIC X(72)   VALUE SPACE.                     00590099
      *                                                                 00600099
       01  CUSTOMER-LINE.                                               00610099
      *    05 BRA         FIX THIS                                      00611099
      *    05 SALESS            FIX THIS                                00612099
           05  CL-CUSTOMER-NUMBER  PIC 9(5).                            00620099
           05  FILLER              PIC X(2)     VALUE SPACE.            00630099
           05  CL-CUSTOMER-NAME    PIC X(20).                           00640099
           05  FILLER              PIC X(3)     VALUE SPACE.            00650099
           05  CL-SALES-THIS-YTD   PIC ZZ,ZZ9.99-.                      00660099
           05  FILLER              PIC X(4)     VALUE SPACE.            00670099
           05  CL-SALES-LAST-YTD   PIC ZZ,ZZ9.99-.                      00680099
           05  FILLER              PIC X(78)    VALUE SPACE.            00690099
      *                                                                 00700099
       01  GRAND-TOTAL-LINE.                                            00710099
           05  FILLER              PIC X(27)    VALUE SPACE.            00720099
           05  GTL-SALES-THIS-YTD  PIC Z,ZZZ,ZZ9.99-.                   00730099
           05  FILLER              PIC X(1)     VALUE SPACE.            00740099
           05  GTL-SALES-LAST-YTD  PIC Z,ZZZ,ZZ9.99-.                   00750099
       PROCEDURE DIVISION.                                              00760099
      *                                                                 00770099
       000-PREPARE-SALES-REPORT.                                        00780099
      *                                                                 00790099
           OPEN INPUT  CUSTMAST                                         00800099
                OUTPUT SALESRPT.                                        00810099
           PERFORM 100-FORMAT-REPORT-HEADING.                           00820099
           PERFORM 230-PRINT-HEADING-LINES.                             00821099
           PERFORM 200-PREPARE-SALES-LINES                              00830099
               UNTIL CUSTMAST-EOF-SWITCH = "Y".                         00840099
           PERFORM 300-PRINT-GRAND-TOTALS.                              00850099
           CLOSE CUSTMAST                                               00860099
                 SALESRPT.                                              00870099
           STOP RUN.                                                    00880099
      *                                                                 00890099
       100-FORMAT-REPORT-HEADING.                                       00900099
      *                                                                 00910099
           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.         00920099
           MOVE CD-MONTH   TO HL1-MONTH.                                00930099
           MOVE CD-DAY     TO HL1-DAY.                                  00940099
           MOVE CD-YEAR    TO HL1-YEAR.                                 00950099
           MOVE CD-HOURS   TO HL2-HOURS.                                00960099
           MOVE CD-MINUTES TO HL2-MINUTES.                              00970099
      *                                                                 00980099
       200-PREPARE-SALES-LINES.                                         00990099
      *                                                                 01000099
           PERFORM 210-READ-CUSTOMER-RECORD.                            01010099
           IF CUSTMAST-EOF-SWITCH = "N"                                 01020099
               PERFORM 220-PRINT-CUSTOMER-LINE.                         01030099
      *                                                                 01040099
       210-READ-CUSTOMER-RECORD.                                        01050099
      *                                                                 01060099
           READ CUSTMAST                                                01070099
               AT END                                                   01080099
                   MOVE "Y" TO CUSTMAST-EOF-SWITCH.                     01090099
      *                                                                 01100099
       220-PRINT-CUSTOMER-LINE.                                         01110099
      *                                                                 01120099
           IF LINE-COUNT >= LINES-ON-PAGE                               01130099
               PERFORM 230-PRINT-HEADING-LINES.                         01140099
           MOVE CM-CUSTOMER-NUMBER  TO CL-CUSTOMER-NUMBER.              01150099
           MOVE CM-CUSTOMER-NAME    TO CL-CUSTOMER-NAME.                01160099
           MOVE CM-SALES-THIS-YTD   TO CL-SALES-THIS-YTD.               01170099
           MOVE CM-SALES-LAST-YTD   TO CL-SALES-LAST-YTD.               01180099
           MOVE CUSTOMER-LINE TO PRINT-AREA.                            01190099
           WRITE PRINT-AREA.                                            01200099
           ADD 1 TO LINE-COUNT.                                         01210099
           ADD CM-SALES-THIS-YTD TO GRAND-TOTAL-THIS-YTD.               01220099
           ADD CM-SALES-LAST-YTD TO GRAND-TOTAL-LAST-YTD.               01230099
      *                                                                 01250099
       230-PRINT-HEADING-LINES.                                         01260099
      *                                                                 01270099
           ADD 1 TO PAGE-COUNT.                                         01280099
           MOVE PAGE-COUNT     TO HL1-PAGE-NUMBER.                      01290099
           MOVE HEADING-LINE-1 TO PRINT-AREA.                           01300099
           WRITE PRINT-AREA.                                            01310099
           MOVE HEADING-LINE-2 TO PRINT-AREA.                           01320099
           WRITE PRINT-AREA.                                            01330099
           MOVE HEADING-LINE-3 TO PRINT-AREA.                           01340099
           WRITE PRINT-AREA.                                            01350099
           MOVE HEADING-LINE-4 TO PRINT-AREA.                           01360099
           WRITE PRINT-AREA.                                            01361099
      *                                                                 01370099
       300-PRINT-GRAND-TOTALS.                                          01380099
      *                                                                 01390099
           MOVE GRAND-TOTAL-THIS-YTD TO GTL-SALES-THIS-YTD.             01400099
           MOVE GRAND-TOTAL-LAST-YTD TO GTL-SALES-LAST-YTD.             01410099
           MOVE GRAND-TOTAL-LINE    TO PRINT-AREA.                      01420099
           WRITE PRINT-AREA.                                            01430099
