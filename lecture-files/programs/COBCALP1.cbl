       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBCALP1.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-STUDENT-ID PIC 9(4) VALUE 1000.
       01 WS-STUDENT-NAME PIC X(15) VALUE 'SRINIVAS'.

        PROCEDURE DIVISION.
            CALL 'SUBPROG1' USING WS-STUDENT-ID, WS-STUDENT-NAME.
            DISPLAY 'Student Id : ' WS-STUDENT-ID
            DISPLAY 'Student Name : ' WS-STUDENT-NAME
            STOP RUN.
