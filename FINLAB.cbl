       IDENTIFICATION DIVISION.
       PROGRAM-ID. FINALLAB.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE   ASSIGN TO INFILE.
           SELECT OUTPUT-FILE  ASSIGN TO OUTFILE.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-CUSTOMER.
           05 CUSTOMER-NUM-I         PIC 9(4).
           05 CUSTOMER-NAME-I        PIC X(30).
           05 CUSTOMER-HOME-PRICE-I  PIC 999999.

       FD  OUTPUT-FILE.
       01 PRINT-AREA                 PIC X(132).
      *
       WORKING-STORAGE SECTION.
      *
       01  SWITCHES.
           05  MORTGAGES-EOF-SWITCH     PIC X    VALUE "N".
      *
       01  PRINT-FIELDS.
           05  PAGE-COUNT      PIC S9(3)   VALUE ZERO.
           05  LINES-ON-PAGE   PIC S9(3)   VALUE +55.
           05  LINE-COUNT      PIC S9(3)   VALUE +02.
      *
       01  VARIABLES.
           05  CLC-DOWNPAYMENT PIC 9(6).
           05  CLC-MORTGAGE    PIC 9(6).
           05  CLC-INTST-RATE  PIC 9V9999  VALUE 0.0025.
           05  CLC-MONTHS      PIC 9(3)    VALUE 360.
           05  CLC-MONTHLY-PAY PIC 9(6).
      *
       01  CURRENT-DATE-AND-TIME.
           05  CD-YEAR         PIC 9999.
           05  CD-MONTH        PIC 99.
           05  CD-DAY          PIC 99.
           05  CD-HOURS        PIC 99.
           05  CD-MINUTES      PIC 99.
           05  FILLER          PIC X(9).
      *
       01  HEADING-LINE-1.
           05  FILLER          PIC X(7)    VALUE "DATE:  ".
           05  HL1-MONTH       PIC 9(2).
           05  FILLER          PIC X(1)    VALUE "/".
           05  HL1-DAY         PIC 9(2).
           05  FILLER          PIC X(1)    VALUE "/".
           05  HL1-YEAR        PIC 9(4).
           05  FILLER          PIC X(11)   VALUE SPACE.
           05  FILLER          PIC X(20)   VALUE "LIST HOUSE SALE / MO".
           05  FILLER          PIC X(20)   VALUE "RTGAGE DETAIL       ".
           05  FILLER          PIC X(8)    VALUE "  PAGE: ".
           05  HL1-PAGE-NUMBER PIC ZZZ9.
           05  FILLER          PIC X(52)   VALUE SPACE.
      *
       01  HEADING-LINE-2.
           05  FILLER          PIC X(7)    VALUE "TIME:  ".
           05  HL2-HOURS       PIC 9(2).
           05  FILLER          PIC X(1)    VALUE ":".
           05  HL2-MINUTES     PIC 9(2).
           05  FILLER          PIC X(58)   VALUE SPACE.
           05  FILLER          PIC X(10)   VALUE "LST1000".
           05  FILLER          PIC X(52)   VALUE SPACE.
      *
       01  HEADING-LINE-3.
           05  FILLER      PIC X(132)   VALUE SPACE.
      *
       01  HEADING-LINE-4.
           05  FILLER      PIC X(20)   VALUE "NUM  CUSTOMER NAME  ".
           05  FILLER      PIC X(20)   VALUE "                HOME".
           05  FILLER      PIC X(20)   VALUE " PRICE  MORTGAGE    ".
           05  FILLER      PIC X(20)   VALUE "  DOWN PAYMENT  MONT".
           05  FILLER      PIC X(20)   VALUE "HLY PAYMENT         ".
           05  FILLER      PIC X(32)   VALUE SPACE.
      *
       01  CUSTOMER-LINE.
           05  CL-CUSTOMER-NUMBER       PIC 9(4).
           05  FILLER                   PIC X(1)     VALUE SPACE.
           05  CL-CUSTOMER-NAME         PIC X(30).
           05  FILLER                   PIC X(1)     VALUE SPACE.
           05  CL-CUSTOMER-HOME-PRICE   PIC $ZZZ,ZZ9.
           05  FILLER                   PIC X(4)     VALUE SPACE.
           05  CL-CUSTOMER-HOME-MORTG   PIC $ZZZ,ZZ9.
           05  FILLER                   PIC X(6)     VALUE SPACE.
           05  CL-CUSTOMER-HOME-DOWNP   PIC $ZZZ,ZZ9.
           05  FILLER                   PIC X(6)     VALUE SPACE.
           05  CL-CUSTOMER-MONTHLY-PAY  PIC $ZZZ,ZZ9.
           05  FILLER                   PIC X(48)    VALUE SPACE.
      *
       PROCEDURE DIVISION.
      *
       000-PREPARE-SALES-REPORT.
      *
           OPEN INPUT  INPUT-FILE
                OUTPUT OUTPUT-FILE.
           PERFORM 100-FORMAT-REPORT-HEADING.
           PERFORM 230-PRINT-HEADING-LINES.
           PERFORM 200-PREPARE-SALES-LINES
               UNTIL MORTGAGES-EOF-SWITCH = "Y".
           CLOSE INPUT-FILE
                 OUTPUT-FILE.
           STOP RUN.
      *
       100-FORMAT-REPORT-HEADING.
      *
           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE CD-MONTH   TO HL1-MONTH.
           MOVE CD-DAY     TO HL1-DAY.
           MOVE CD-YEAR    TO HL1-YEAR.
           MOVE CD-HOURS   TO HL2-HOURS.
           MOVE CD-MINUTES TO HL2-MINUTES.
      *
       200-PREPARE-SALES-LINES.
      *
           PERFORM 210-READ-CUSTOMER-RECORD.
           IF MORTGAGES-EOF-SWITCH = "N"
               PERFORM 220-PRINT-CUSTOMER-LINE.
      *
       210-READ-CUSTOMER-RECORD.
      *
           READ INPUT-FILE
               AT END
                   MOVE "Y" TO MORTGAGES-EOF-SWITCH.
      *
       220-PRINT-CUSTOMER-LINE.
      *
           IF LINE-COUNT >= LINES-ON-PAGE
               PERFORM 230-PRINT-HEADING-LINES.
           MOVE CUSTOMER-NUM-I          TO CL-CUSTOMER-NUMBER.
           MOVE CUSTOMER-NAME-I         TO CL-CUSTOMER-NAME.
           MOVE CUSTOMER-HOME-PRICE-I   TO CL-CUSTOMER-HOME-PRICE.

           COMPUTE CLC-DOWNPAYMENT ROUNDED =
                   CUSTOMER-HOME-PRICE-I * 6 / 100.
           COMPUTE CLC-MORTGAGE = CUSTOMER-HOME-PRICE-I -
                   CLC-DOWNPAYMENT.

           COMPUTE CLC-MONTHLY-PAY ROUNDED = CLC-MORTGAGE *
              CLC-INTST-RATE * ((1 + CLC-INTST-RATE) ** CLC-MONTHS) /
               (((1 + CLC-INTST-RATE) ** CLC-MONTHS) - 1).

      *M = P [ I(1 + I)^N ] / [ (1 + I)^N   1]

           MOVE CLC-DOWNPAYMENT TO CL-CUSTOMER-HOME-DOWNP.
           MOVE CLC-MORTGAGE    TO CL-CUSTOMER-HOME-MORTG.
           MOVE CLC-MONTHLY-PAY TO CL-CUSTOMER-MONTHLY-PAY.

           MOVE CUSTOMER-LINE TO PRINT-AREA.
           WRITE PRINT-AREA.
           ADD 1 TO LINE-COUNT.
      *
       230-PRINT-HEADING-LINES.
      *
           ADD 1 TO PAGE-COUNT.
           MOVE PAGE-COUNT     TO HL1-PAGE-NUMBER.
           MOVE HEADING-LINE-1 TO PRINT-AREA.
           WRITE PRINT-AREA.
           MOVE HEADING-LINE-2 TO PRINT-AREA.
           WRITE PRINT-AREA.
           MOVE HEADING-LINE-3 TO PRINT-AREA.
           WRITE PRINT-AREA.
           MOVE HEADING-LINE-4 TO PRINT-AREA.
           WRITE PRINT-AREA.
