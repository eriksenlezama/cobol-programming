      *Write a Cobol program that creates a sequential file with the
      *following structure.
      *Input structure.
      *Employee Name - maximum length 30 characters
      *Employee Identification number - Ex. 1001
      *Employee base salary – Maximum 5 digits
      *Compute the bonus where bonus = Base salary + 20% of the base salary
      *Output structure:
      *Input structure and Bonus

       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUESTION12.
       AUTHOR ERIKSEN.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE   ASSIGN TO INFILE.
           SELECT OUTPUT-FILE  ASSIGN TO OUTFILE.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 EMPLOYE-DATA.
           05 EMPLOYEE-NAME         PIC X(30).
           05 EMPLOYEE-ID           PIC 9(4).
           05 EMPLOYEE-SALARY       PIC 9(5).

       FD  OUTPUT-FILE.
       01 PRINT-AREA                 PIC X(45).
      *
       WORKING-STORAGE SECTION.
      *
       01  SWITCHES.
           05  SALARIES-EOF-SWITCH     PIC X    VALUE "N".
      *
       01  VARIABLES.
           05  BONUS PIC 9(6).
      *
       01  EMPLOYEE-LINE.
           05  EL-EMPLOYEE-ID           PIC X(4).
           05  EL-EMPLOYEE-NAME         PIC 9(30).
           05  EL-EMPLOYEE-SALARY       PIC 9(5).
           05  EL-BONUS                 PIC 9(6).
      *
       PROCEDURE DIVISION.
      *
       000-PREPARE-SALES-REPORT.
      *
           OPEN INPUT  INPUT-FILE
                OUTPUT OUTPUT-FILE.
           PERFORM 100-PREPARE-SALES-LINES
               UNTIL SALARIES-EOF-SWITCH = "Y".
           CLOSE INPUT-FILE
                 OUTPUT-FILE.
           STOP RUN.
      *
       100-PREPARE-SALES-LINES.
      *
           PERFORM 200-READ-EMPLOYEE-RECORD.
           IF SALARIES-EOF-SWITCH = "N"
               PERFORM 300-PRINT-EMPLOYEE-LINE.
      *
       200-READ-EMPLOYEE-RECORD.
      *
           READ INPUT-FILE
               AT END
                   MOVE "Y" TO SALARIES-EOF-SWITCH.
      *
       300-PRINT-EMPLOYEE-LINE.
      *
           MOVE EMPLOYEE-NAME          TO EL-EMPLOYEE-NAME.
           MOVE EMPLOYEE-ID            TO EL-EMPLOYEE-ID.
           MOVE EMPLOYEE-SALARY        TO EL-EMPLOYEE-SALARY.

           COMPUTE BONUS ROUNDED =
                   EMPLOYEE-SALARY + (EMPLOYEE-SALARY * 20 / 100).

           MOVE BONUS TO EL-BONUS.

           MOVE EMPLOYEE-LINE TO PRINT-AREA.
           WRITE PRINT-AREA.