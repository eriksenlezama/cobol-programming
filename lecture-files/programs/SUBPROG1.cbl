        IDENTIFICATION DIVISION.
        PROGRAM-ID. SUBPROG1.

        DATA DIVISION.
        LINKAGE SECTION.
        01 LS-STUDENT-ID PIC 9(4).
        01 LS-STUDENT-NAME PIC A(15).

        PROCEDURE DIVISION USING LS-STUDENT-ID, LS-STUDENT-NAME.
            DISPLAY 'In Called Program'.
            MOVE 2222 TO LS-STUDENT-ID.
            EXIT PROGRAM.