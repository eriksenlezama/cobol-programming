        IDENTIFICATION DIVISION.
        PROGRAM-ID. SORTPG01.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT INPUT-FILE ASSIGN TO INFILE.
            SELECT OUTPUT-FILE ASSIGN TO OUTFILE.
            SELECT WORK-FILE ASSIGN TO WORKFILE.

        DATA DIVISION.
        FILE SECTION.
        FD INPUT-FILE.
        01 INPUT-STUDENT.
         05 STUDENT-ID-I    PIC 9(5).
         05 STUDENT-NAME-I  PIC X(25).
        FD  OUTPUT-FILE.
        01 OUTPUT-STUDENT.
         05 STUDENT-ID-O    PIC 9(5).
         05 STUDENT-NAME-O  PIC X(25).
        SD WORK-FILE.
        01 WORK-STUDENT.
         05 STUDENT-ID-W    PIC 9(5).
         05 STUDENT-NAME-W  PIC X(25).

        PROCEDURE DIVISION.
            SORT WORK-FILE ON ASCENDING KEY STUDENT-ID-W
            USING INPUT-FILE GIVING OUTPUT-FILE.
            DISPLAY 'Sort Successful'.
            STOP RUN.
