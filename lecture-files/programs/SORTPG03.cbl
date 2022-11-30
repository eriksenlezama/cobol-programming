        IDENTIFICATION DIVISION.
        PROGRAM-ID. SORTPG02.

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
         WORKING-STORAGE SECTION.
        01 ARE-THERE-MORE-RECORDS PIC X(3) VALUE "YES".
            88 NO-MORE-RECORDS VALUE "NO".
        01 PROCESSED-RECS     PIC 9(3).

        PROCEDURE DIVISION.
            SORT WORK-FILE ON ASCENDING KEY STUDENT-ID-W
            USING INPUT-FILE
            OUTPUT PROCEDURE IS 200-COUNT-PROCESSED-RECORDS.
            IF SORT-RETURN = 0
               DISPLAY 'Sort Successful'
            END-IF.
            CLOSE OUTPUT-FILE.
            DISPLAY "Recs processed " PROCESSED-RECS " RECORDS".
            STOP RUN.
        200-COUNT-PROCESSED-RECORDS.
            OPEN OUTPUT OUTPUT-FILE
            PERFORM UNTIL NO-MORE-RECORDS
                RETURN WORK-FILE
                    AT END
                        MOVE "NO " TO ARE-THERE-MORE-RECORDS
                    NOT AT END
                        ADD 1 TO PROCESSED-RECS
                        WRITE OUTPUT-STUDENT FROM WORK-STUDENT
                END-RETURN
            END-PERFORM.







