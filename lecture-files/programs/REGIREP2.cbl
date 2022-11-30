       IDENTIFICATION DIVISION.

       PROGRAM-ID. REGIREP2.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT CRSEREG  ASSIGN TO REGSFILE.
           SELECT REG2RPT  ASSIGN TO REGSREP2.

       DATA DIVISION.

       FILE SECTION.

       FD  CRSEREG.

       01  COURSE-REGISTRATION-RECORD.
           05  CR-COURSE-KEY.
               10  CR-DEPARTMENT-CODE          PIC X(04).
               10  CR-COURSE-NUMBER            PIC 9(03).
               10  CR-SECTION-NUMBER           PIC 9(02).
           05  CR-COURSE-INFORMATION.
               10  CR-COURSE-TITLE             PIC X(20).
               10  CR-COURSE-START-DATE.
                   15  CR-COURSE-START-YEAR    PIC 9(04).
                   15  CR-COURSE-START-MONTH   PIC 9(02).
               10  CR-COURSE-UNITS             PIC 9(01).
               10  CR-COURSE-DAYS              PIC 9(01).
           05  CR-REGISTRATION-INFORMATION.
               10  CR-TEACHER-NUMBER           PIC 9(03).
               10  CR-STUDENT-INFORMATION.
                   15  CR-STUDENT-ID           PIC 9(09).
                   15  CR-STUDENT-NAME         PIC X(25).
                   15  CR-CLASS-STANDING       PIC 9(01).
                       88  FRESHMAN            VALUE 1.
                       88  SOPHOMORE           VALUE 2.
                       88  JUNIOR              VALUE 3.
                       88  SENIOR              VALUE 4.
                   15  CR-MAJOR                PIC X(04).
           05  CR-GRADING-INFORMATION.
               10  CR-6-WEEKS-GRADE            PIC X(01).
               10  CR-12-WEEKS-GRADE           PIC X(01).
               10  CR-FINAL-EXAM-GRADE         PIC X(01).
               10  CR-SEMESTER-GRADE           PIC X(01).

       FD  REG2RPT.

       01  PRINT-AREA      PIC X(132).

       WORKING-STORAGE SECTION.

       01  SWITCHES.
           05  CRSEREG-EOF-SWITCH          PIC X(01)   VALUE "N".
               88  CRSEREG-EOF                         VALUE "Y".
           05  FIRST-RECORD-SWITCH         PIC X(01)   VALUE "Y".
               88  FIRST-RECORD                        VALUE "Y".
               88  NOT-FIRST-RECORD                    VALUE "N".
           05  PRINT-CLASS-STANDING-SWITCH PIC X(01)   VALUE "Y".
               88  PRINT-CLASS-STANDING                VALUE "Y".
               88  SUPPRESS-CLASS-STANDING             VALUE "N".
           05  PRINT-MAJOR-SWITCH          PIC X(01)   VALUE "Y".
               88  PRINT-MAJOR                         VALUE "Y".
               88  SUPPRESS-MAJOR                      VALUE "N".

       01  CONTROL-FIELDS.
           05  OLD-CLASS-STANDING          PIC 9(01).
           05  OLD-MAJOR                   PIC X(04).
           05  OLD-STUDENT-ID.
               10  OLD-STUDENT-ID-1        PIC 9(03).
               10  OLD-STUDENT-ID-2        PIC 9(03).
               10  OLD-STUDENT-ID-3        PIC 9(03).

       01  WORK-FIELDS.
           05  FORMATTED-STUDENT-ID.
               10  FORMATTED-STUDENT-ID-1  PIC 9(03).
               10  FILLER                  PIC X(01)   VALUE "-".
               10  FORMATTED-STUDENT-ID-2  PIC 9(02).
               10  FILLER                  PIC X(01)   VALUE "-".
               10  FORMATTED-STUDENT-ID-3  PIC 9(04).
           05  OLD-STUDENT-NAME            PIC X(25).

       01  PRINT-FIELDS.
           05  PAGE-COUNT                  PIC S9(03)  VALUE ZERO.
           05  LINES-ON-PAGE               PIC S9(03)  VALUE +55.
           05  LINE-COUNT                  PIC S9(03)  VALUE +99.
           05  SPACE-CONTROL               PIC S9(01).

       01  TOTAL-FIELDS.
           05  STUDENT-TOTAL-COURSES       PIC S9(03) VALUE ZERO.
           05  STUDENT-TOTAL-UNITS         PIC S9(03) VALUE ZERO.
           05  MAJOR-TOTAL-STUDENTS        PIC S9(05) VALUE ZERO.
           05  MAJOR-TOTAL-COURSES         PIC S9(05) VALUE ZERO.
           05  MAJOR-TOTAL-UNITS           PIC S9(05) VALUE ZERO.
           05  CLASS-TOTAL-STUDENTS        PIC S9(05) VALUE ZERO.
           05  CLASS-TOTAL-COURSES         PIC S9(05) VALUE ZERO.
           05  CLASS-TOTAL-UNITS           PIC S9(05) VALUE ZERO.
           05  GRAND-TOTAL-STUDENTS        PIC S9(05) VALUE ZERO.
           05  GRAND-TOTAL-COURSES         PIC S9(05) VALUE ZERO.
           05  GRAND-TOTAL-UNITS           PIC S9(05) VALUE ZERO.

       01  CURRENT-DATE-AND-TIME.
           05  CD-YEAR                     PIC 9(04).
           05  CD-MONTH                    PIC 9(02).
           05  CD-DAY                      PIC 9(02).
           05  CD-HOURS                    PIC 9(02).
           05  CD-MINUTES                  PIC 9(02).
           05  FILLER                      PIC X(09).

       01  HEADING-LINE-1.
           05  FILLER          PIC X(07)   VALUE "DATE:  ".
           05  HL1-MONTH       PIC 9(02).
           05  FILLER          PIC X(01)   VALUE "/".
           05  HL1-DAY         PIC 9(02).
           05  FILLER          PIC X(01)   VALUE "/".
           05  HL1-YEAR        PIC 9(04).
           05  FILLER          PIC X(04)   VALUE SPACE.
           05  FILLER          PIC X(20)   VALUE "STUDENT REGISTRATION".
           05  FILLER          PIC X(15)   VALUE " SUMMARY REPORT".
           05  FILLER          PIC X(11)   VALUE SPACE.
           05  FILLER          PIC X(06)   VALUE "PAGE: ".
           05  HL1-PAGE-NUMBER PIC ZZZ9.
           05  FILLER          PIC X(55)   VALUE SPACE.

       01  HEADING-LINE-2.
           05  FILLER          PIC X(07)   VALUE "TIME:  ".
           05  HL2-HOURS       PIC 9(02).
           05  FILLER          PIC X(01)   VALUE ":".
           05  HL2-MINUTES     PIC 9(02).
           05  FILLER          PIC X(55)   VALUE SPACE.
           05  FILLER          PIC X(07)   VALUE "SRREP2".
           05  FILLER          PIC X(58)   VALUE SPACE.

       01  HEADING-LINE-3.
           05  FILLER      PIC X(58)  VALUE SPACE.
           05  FILLER      PIC X(09)  VALUE "NUMBER OF".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(08)  VALUE "NUMBER".
           05  FILLER      PIC X(57)  VALUE SPACE.

       01  HEADING-LINE-4.
           05  FILLER      PIC X(09)  VALUE "CLASS".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(05)  VALUE "MAJOR".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(11)  VALUE "STUDENT ID".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(25)  VALUE "STUDENT NAME".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(09)  VALUE "COURSES".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(08)  VALUE "OF UNITS".
           05  FILLER      PIC X(55)  VALUE SPACE.

       01  HEADING-LINE-5.
           05  FILLER      PIC X(09)  VALUE "---------".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(05)  VALUE "-----".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(11)  VALUE "-----------".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(25)  VALUE "-------------------------".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(09)  VALUE "---------".
           05  FILLER      PIC X(02)  VALUE SPACE.
           05  FILLER      PIC X(08)  VALUE "--------".
           05  FILLER      PIC X(55)  VALUE SPACE.

       01  STUDENT-TOTAL-LINE.
           05  STL-CLASS-STANDING      PIC X(09).
           05  FILLER                  PIC X(02)   VALUE SPACE.
           05  STL-MAJOR               PIC X(04).
           05  FILLER                  PIC X(03)   VALUE SPACE.
           05  STL-STUDENT-ID          PIC X(11).
           05  FILLER                  PIC X(02)   VALUE SPACE.
           05  STL-STUDENT-NAME        PIC X(25).
           05  FILLER                  PIC X(05)   VALUE SPACE.
           05  STL-NUMBER-OF-COURSES   PIC ZZ9.
           05  FILLER                  PIC X(07)   VALUE SPACE.
           05  STL-NUMBER-OF-UNITS     PIC ZZ9.
           05  FILLER                  PIC X(58)   VALUE SPACE.

       01  MAJOR-TOTAL-LINE.
           05  FILLER             PIC X(18)  VALUE "TOTALS FOR MAJOR -".
           05  FILLER             PIC X(02)  VALUE SPACE.
           05  FILLER             PIC X(10)  VALUE "STUDENTS: ".
           05  MTL-TOTAL-STUDENTS PIC ZZ,ZZ9.
           05  FILLER             PIC X(22)  VALUE SPACE.
           05  MTL-TOTAL-COURSES  PIC ZZ,ZZ9.
           05  FILLER             PIC X(04)  VALUE SPACE.
           05  MTL-TOTAL-UNITS    PIC ZZ,ZZ9.
           05  FILLER             PIC X(58)  VALUE SPACE.

       01  CLASS-TOTAL-LINE.
           05  FILLER             PIC X(18)  VALUE "TOTALS FOR CLASS -".
           05  FILLER             PIC X(02)  VALUE SPACE.
           05  FILLER             PIC X(10)  VALUE "STUDENTS: ".
           05  CTL-TOTAL-STUDENTS PIC ZZ,ZZ9.
           05  FILLER             PIC X(22)  VALUE SPACE.
           05  CTL-TOTAL-COURSES  PIC ZZ,ZZ9.
           05  FILLER             PIC X(04)  VALUE SPACE.
           05  CTL-TOTAL-UNITS    PIC ZZ,ZZ9.
           05  FILLER             PIC X(58)  VALUE SPACE.

       01  GRAND-TOTAL-LINE.
           05  FILLER             PIC X(18)  VALUE "GRAND TOTALS - ".
           05  FILLER             PIC X(02)  VALUE SPACE.
           05  FILLER             PIC X(10)  VALUE "STUDENTS: ".
           05  GTL-TOTAL-STUDENTS PIC ZZ,ZZ9.
           05  FILLER             PIC X(22)  VALUE SPACE.
           05  GTL-TOTAL-COURSES  PIC ZZ,ZZ9.
           05  FILLER             PIC X(04)  VALUE SPACE.
           05  GTL-TOTAL-UNITS    PIC ZZ,ZZ9.
           05  FILLER             PIC X(58)  VALUE SPACE.

       PROCEDURE DIVISION.

       000-PREPARE-REG-SUMMARY-RPT.

           OPEN INPUT  CRSEREG
                OUTPUT REG2RPT.
           PERFORM 100-FORMAT-REPORT-HEADING.
           PERFORM 300-PREPARE-REGISTRATION-LINES
               UNTIL CRSEREG-EOF.
           PERFORM 350-PRINT-GRAND-TOTAL-LINE.
           CLOSE CRSEREG
                 REG2RPT.
           STOP RUN.

       100-FORMAT-REPORT-HEADING.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE CD-MONTH   TO HL1-MONTH.
           MOVE CD-DAY     TO HL1-DAY.
           MOVE CD-YEAR    TO HL1-YEAR.
           MOVE CD-HOURS   TO HL2-HOURS.
           MOVE CD-MINUTES TO HL2-MINUTES.

       300-PREPARE-REGISTRATION-LINES.

           PERFORM 310-READ-REGISTRATION-RECORD.

           EVALUATE TRUE
               WHEN CRSEREG-EOF
                   PERFORM 320-PRINT-STUDENT-TOTAL-LINE
                   PERFORM 330-PRINT-MAJOR-TOTAL-LINE
                   PERFORM 340-PRINT-CLASS-TOTAL-LINE
               WHEN FIRST-RECORD
                   MOVE CR-CLASS-STANDING   TO OLD-CLASS-STANDING
                   MOVE CR-MAJOR            TO OLD-MAJOR
                   MOVE CR-STUDENT-ID       TO OLD-STUDENT-ID
                   MOVE CR-STUDENT-NAME     TO OLD-STUDENT-NAME
                   SET PRINT-MAJOR          TO TRUE
                   SET PRINT-CLASS-STANDING TO TRUE
                   ADD 1 TO MAJOR-TOTAL-STUDENTS
                   SET NOT-FIRST-RECORD   TO TRUE
               WHEN CR-CLASS-STANDING > OLD-CLASS-STANDING
                   PERFORM 320-PRINT-STUDENT-TOTAL-LINE
                   PERFORM 330-PRINT-MAJOR-TOTAL-LINE
                   PERFORM 340-PRINT-CLASS-TOTAL-LINE
                   MOVE CR-CLASS-STANDING   TO OLD-CLASS-STANDING
                   MOVE CR-MAJOR            TO OLD-MAJOR
                   MOVE CR-STUDENT-ID       TO OLD-STUDENT-ID
                   MOVE CR-STUDENT-NAME     TO OLD-STUDENT-NAME
                   SET PRINT-MAJOR          TO TRUE
                   SET PRINT-CLASS-STANDING TO TRUE
                   ADD 1 TO MAJOR-TOTAL-STUDENTS
               WHEN CR-MAJOR > OLD-MAJOR
                   PERFORM 320-PRINT-STUDENT-TOTAL-LINE
                   PERFORM 330-PRINT-MAJOR-TOTAL-LINE
                   MOVE CR-MAJOR            TO OLD-MAJOR
                   MOVE CR-STUDENT-ID       TO OLD-STUDENT-ID
                   MOVE CR-STUDENT-NAME     TO OLD-STUDENT-NAME
                   SET PRINT-MAJOR          TO TRUE
                   ADD 1 TO MAJOR-TOTAL-STUDENTS
               WHEN CR-STUDENT-ID > OLD-STUDENT-ID
                   PERFORM 320-PRINT-STUDENT-TOTAL-LINE
                   MOVE CR-STUDENT-ID       TO OLD-STUDENT-ID
                   MOVE CR-STUDENT-NAME     TO OLD-STUDENT-NAME
                   ADD 1 TO MAJOR-TOTAL-STUDENTS
           END-EVALUATE.

           ADD 1               TO STUDENT-TOTAL-COURSES.
           ADD CR-COURSE-UNITS TO STUDENT-TOTAL-UNITS.

       310-READ-REGISTRATION-RECORD.

           READ CRSEREG
               AT END
                   MOVE "Y" TO CRSEREG-EOF-SWITCH.

       320-PRINT-STUDENT-TOTAL-LINE.

           IF LINE-COUNT >= LINES-ON-PAGE
               PERFORM 360-PRINT-HEADING-LINES
               SET PRINT-CLASS-STANDING TO TRUE
               SET PRINT-MAJOR          TO TRUE
               MOVE 2 TO SPACE-CONTROL
           ELSE
               EVALUATE TRUE
                   WHEN PRINT-CLASS-STANDING
                       MOVE 3 TO SPACE-CONTROL
                   WHEN PRINT-MAJOR
                       MOVE 3 TO SPACE-CONTROL
                   WHEN OTHER
                       MOVE 1 TO SPACE-CONTROL
               END-EVALUATE
           END-IF.

           IF PRINT-CLASS-STANDING
               EVALUATE OLD-CLASS-STANDING
                   WHEN 1
                       MOVE "FRESHMAN"     TO STL-CLASS-STANDING
                   WHEN 2
                       MOVE "SOPHOMORE"    TO STL-CLASS-STANDING
                   WHEN 3
                       MOVE "JUNIOR"       TO STL-CLASS-STANDING
                   WHEN 4
                       MOVE "SENIOR"       TO STL-CLASS-STANDING
                   WHEN OTHER
                       MOVE SPACE          TO STL-CLASS-STANDING
               END-EVALUATE
               SET SUPPRESS-CLASS-STANDING TO TRUE
           ELSE
               MOVE SPACE                  TO STL-CLASS-STANDING
           END-IF.

           IF PRINT-MAJOR
              MOVE OLD-MAJOR          TO STL-MAJOR
              SET SUPPRESS-MAJOR      TO TRUE
           ELSE
              MOVE SPACE              TO STL-MAJOR
           END-IF.

           MOVE OLD-STUDENT-ID-1      TO FORMATTED-STUDENT-ID-1.
           MOVE OLD-STUDENT-ID-2      TO FORMATTED-STUDENT-ID-2.
           MOVE OLD-STUDENT-ID-3      TO FORMATTED-STUDENT-ID-3.
           MOVE FORMATTED-STUDENT-ID  TO STL-STUDENT-ID.
           MOVE OLD-STUDENT-NAME      TO STL-STUDENT-NAME.
           MOVE STUDENT-TOTAL-COURSES TO STL-NUMBER-OF-COURSES.
           MOVE STUDENT-TOTAL-UNITS   TO STL-NUMBER-OF-UNITS.
           MOVE STUDENT-TOTAL-LINE    TO PRINT-AREA.
           PERFORM 380-WRITE-REPORT-LINE.
           ADD STUDENT-TOTAL-COURSES  TO MAJOR-TOTAL-COURSES.
           ADD STUDENT-TOTAL-UNITS    TO MAJOR-TOTAL-UNITS.
           MOVE ZERO                  TO STUDENT-TOTAL-COURSES.
           MOVE ZERO                  TO STUDENT-TOTAL-UNITS.

       330-PRINT-MAJOR-TOTAL-LINE.

           MOVE MAJOR-TOTAL-STUDENTS TO MTL-TOTAL-STUDENTS.
           MOVE MAJOR-TOTAL-COURSES  TO MTL-TOTAL-COURSES.
           MOVE MAJOR-TOTAL-UNITS    TO MTL-TOTAL-UNITS.
           MOVE MAJOR-TOTAL-LINE     TO PRINT-AREA.
           MOVE 2 TO SPACE-CONTROL.
           PERFORM 380-WRITE-REPORT-LINE.
           ADD MAJOR-TOTAL-STUDENTS  TO CLASS-TOTAL-STUDENTS.
           ADD MAJOR-TOTAL-COURSES   TO CLASS-TOTAL-COURSES.
           ADD MAJOR-TOTAL-UNITS     TO CLASS-TOTAL-UNITS.
           MOVE ZERO                 TO MAJOR-TOTAL-STUDENTS.
           MOVE ZERO                 TO MAJOR-TOTAL-COURSES.
           MOVE ZERO                 TO MAJOR-TOTAL-UNITS.

       340-PRINT-CLASS-TOTAL-LINE.

           MOVE CLASS-TOTAL-STUDENTS TO CTL-TOTAL-STUDENTS.
           MOVE CLASS-TOTAL-COURSES  TO CTL-TOTAL-COURSES.
           MOVE CLASS-TOTAL-UNITS    TO CTL-TOTAL-UNITS.
           MOVE CLASS-TOTAL-LINE     TO PRINT-AREA.
           MOVE 2 TO SPACE-CONTROL.
           PERFORM 380-WRITE-REPORT-LINE.
           ADD CLASS-TOTAL-STUDENTS  TO GRAND-TOTAL-STUDENTS.
           ADD CLASS-TOTAL-COURSES   TO GRAND-TOTAL-COURSES.
           ADD CLASS-TOTAL-UNITS     TO GRAND-TOTAL-UNITS.
           MOVE ZERO                 TO CLASS-TOTAL-STUDENTS.
           MOVE ZERO                 TO CLASS-TOTAL-COURSES.
           MOVE ZERO                 TO CLASS-TOTAL-UNITS.

       350-PRINT-GRAND-TOTAL-LINE.

           MOVE GRAND-TOTAL-STUDENTS TO GTL-TOTAL-STUDENTS.
           MOVE GRAND-TOTAL-COURSES  TO GTL-TOTAL-COURSES.
           MOVE GRAND-TOTAL-UNITS    TO GTL-TOTAL-UNITS.
           MOVE GRAND-TOTAL-LINE     TO PRINT-AREA.
           MOVE 2 TO SPACE-CONTROL.
           PERFORM 380-WRITE-REPORT-LINE.

       360-PRINT-HEADING-LINES.

           ADD 1 TO PAGE-COUNT.
           MOVE PAGE-COUNT     TO HL1-PAGE-NUMBER.
           MOVE HEADING-LINE-1 TO PRINT-AREA.
           PERFORM 370-WRITE-PAGE-TOP-LINE.
           MOVE HEADING-LINE-2 TO PRINT-AREA.
           MOVE 1 TO SPACE-CONTROL.
           PERFORM 380-WRITE-REPORT-LINE.
           MOVE HEADING-LINE-3 TO PRINT-AREA.
           MOVE 2 TO SPACE-CONTROL.
           PERFORM 380-WRITE-REPORT-LINE.
           MOVE HEADING-LINE-4 TO PRINT-AREA.
           MOVE 1 TO SPACE-CONTROL.
           PERFORM 380-WRITE-REPORT-LINE.
           MOVE HEADING-LINE-5 TO PRINT-AREA.
           MOVE 1 TO SPACE-CONTROL.
           PERFORM 380-WRITE-REPORT-LINE.

       370-WRITE-PAGE-TOP-LINE.

           WRITE PRINT-AREA AFTER ADVANCING PAGE.
           MOVE 1 TO LINE-COUNT.

       380-WRITE-REPORT-LINE.

           WRITE PRINT-AREA AFTER ADVANCING SPACE-CONTROL LINES.
           ADD SPACE-CONTROL TO LINE-COUNT.
