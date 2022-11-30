      *Write a small program that accepts the data from the job and use
      *the STRING verb to concatenate the words and UNSTRING verb to
      *split one string into multiple sub-strings.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUESTION3.
       AUTHOR. ERIKSEN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ST-1          PIC X(10).
       01 ST-2          PIC X(10).
       01 ST-CONCAT     PIC X(20).
       01 QST-1         PIC X(5).
       01 QST-2         PIC X(5).
       01 QST-3         PIC X(5).
       01 QST-4         PIC X(5).

       PROCEDURE DIVISION.
           ACCEPT ST-1.
           ACCEPT ST-2.

           STRING ST-1 DELIMITED BY SIZE
                  ST-2 DELIMITED BY SIZE
                  INTO ST-CONCAT.

           UNSTRING ST-CONCAT DELIMITED BY "."
                    INTO QST-1 QST-2 QST-3 QST-4.

      * DISPLAYING VALUES *
           DISPLAY "String concatenated: "          ST-CONCAT.
           DISPLAY "Quarter string 1: "             QST-1.
           DISPLAY "Quarter string 2: "             QST-2.
           DISPLAY "Quarter string 3: "             QST-3.
           DISPLAY "Quarter string 4: "             QST-4.
           STOP RUN.