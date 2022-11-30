      *Use the output file that was created from the above
      *program and sort the file using the SORT verb.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUESTION11.
       AUTHOR ERIKSEN.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE1  ASSIGN TO INFILE1.
           SELECT OUTPUT-FILE1 ASSIGN TO OUTFILE1.
           SELECT WORK-FILE    ASSIGN TO WORKFILE.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE1.
       01 EMPLOYEE-DATA.
           05 EMPLOYEE-ID           PIC 9(4).
           05 EMPLOYEE-NAME         PIC X(30).
           05 EMPLOYEE-SALARY       PIC 9(5).
           05 EMPLOYEE-BONUS        PIC 9(6).

       FD  OUTPUT-FILE1.
       01 OUTPUT-DATA.
           05 EMPLOYEE-ID-O         PIC 9(4).
           05 EMPLOYEE-NAME-O       PIC X(30).
           05 EMPLOYEE-SALARY-O     PIC 9(5).
           05 EMPLOYEE-BONUS-O      PIC 9(6).

       SD WORK-FILE.
       01 WORK-EMPLOYEE.
           05 EMPLOYEE-ID-W         PIC 9(4).
           05 EMPLOYEE-NAME-W       PIC X(30).
           05 EMPLOYEE-SALARY-W     PIC 9(5).
           05 EMPLOYEE-BONUS-W      PIC 9(6).

       PROCEDURE DIVISION.
           SORT WORK-FILE ON ASCENDING KEY EMPLOYEE-ID-W
           USING INPUT-FILE1 GIVING OUTPUT-FILE1.
           DISPLAY 'Sort Successful'.
           STOP RUN.

