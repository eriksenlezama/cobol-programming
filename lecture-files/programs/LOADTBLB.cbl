       IDENTIFICATION DIVISION.                                         00010074
       PROGRAM-ID. LOADTABL.                                            00020099
      *                                                                 00030099
       ENVIRONMENT DIVISION.                                            00040074
       INPUT-OUTPUT SECTION.                                            00050075
       FILE-CONTROL.                                                    00060075
           SELECT RATETABL ASSIGN TO RATETABL.                          00090099
           SELECT RATELIST ASSIGN TO RATELIST.                          00092099
      *                                                                 00093099
       DATA DIVISION.                                                   00100074
      *                                                                 00101099
       FILE SECTION.                                                    00110074
       FD  RATETABL.                                                    00150699
       01  RATE-TABLE-RECORD.                                           00150799
            05  RT-LOW-AGE              PIC 99.                         00150899
            05  RT-HIGH-AGE             PIC 99.                         00150999
            05  RT-CLASS-GROUP          OCCURS 4 TIMES.                 00151099
                10  RT-CLASS-NUMBER     PIC 99.                         00151199
                10  RT-INSURANCE-RATE   PIC S99V99.                     00151299
      *                                                                 00151599
       FD  RATELIST.                                                    00152499
       01 PRINT-AREA        PIC X(40).                                  00152799
      *                                                                 00152899
       WORKING-STORAGE SECTION.                                         00153299
      *                                                                 00153399
       01  SWITCHES.                                                    00153499
           05  END-OF-SESSION-SWITCH   PIC X    VALUE  "N".             00153699
                88  END-OF-SESSION             VALUE   "Y".             00153799
           05  RATE-TABLE-EOF-SWITCH   PIC X   VALUE   "N".             00153899
                88  RATE-TABLE-EOF             VALUE   "Y".             00154099
           05  AGE-GROUP-FOUND-SWITCH  PIC X.                           00155099
               88  AGE-GROUP-FOUND                 VALUE "Y".           00156099
           05  CLASS-FOUND-SWITCH      PIC X.                           00156199
               88  CLASS-FOUND                     VALUE "Y".           00156299
      *                                                                 00157099
       01  SUBSCRIPTS          COMP.                                    00158099
           05  CLASS-SUB       PIC S9.                                  00160099
      *                                                                 00170099
       01  ENTRY-FIELDS.                                                00180099
           05  EF-AGE              PIC 99.                              00200099
           05  EF-CLASS-NUMBER     PIC 99.                              00210099
      *                                                                 00211099
       01  DISPLAY-FIELDS.                                              00220099
           05  DF-INSURANCE-RATE   PIC ZZ.99.                           00240099
      *                                                                 00241099
       01  RATE-TABLE.                                                  00250099
           05  AGE-GROUP               OCCURS 6 TIMES                   00270099
                                           INDEXED BY AGE-INDEX.        00280099
             10  LOW-AGE             PIC 99.                            00290099
             10  HIGH-AGE            PIC 99.                            00300099
             10  CLASS-GROUP         OCCURS 4 TIMES                     00310099
                                            INDEXED BY CLASS-INDEX.     00320099
                15  CLASS-NUMBER    PIC 99.                             00330099
                15  INSURANCE-RATE  PIC S99V99.                         00340099
      *                                                                 00350099
       01  AGE-RATE-LINE.                                               00360099
           05  AR-LOW-AGE              PIC 99.                          00380099
           05  FILLER                  PIC X       VALUE "-".           00390099
           05  AR-HIGH-AGE             PIC 99.                          00400099
           05  FILLER                  PIC X(3)    VALUE SPACE.         00410099
           05  AR-CLASS-DATA           OCCURS 4 TIMES.                  00420099
               10  AR-INSURANCE-RATE   PIC Z9.99.                       00430099
               10  FILLER              PIC X(3)    VALUE SPACE.         00440099
       PROCEDURE DIVISION.                                              00760099
      *                                                                 00770099
       000-DISPLAY-INSURANCE-RATES.                                     00780099
      *                                                                 00790099
           OPEN INPUT  RATETABL                                         00800099
                OUTPUT RATELIST.                                        00810099
           PERFORM 100-LOAD-RATE-TABLE.                                 00820099
           PERFORM 200-DISPLAY-INSURANCE-RATE                           00830099
                   UNTIL END-OF-SESSION.                                00840099
           PERFORM 300-PRINT-RATE-TABLE.                                00850099
           CLOSE RATETABL                                               00860099
                 RATELIST.                                              00870099
           STOP RUN.                                                    00880099
       100-LOAD-RATE-TABLE.                                             00890099
           PERFORM 110-LOAD-RATE-TABLE-ENTRY                            00891099
                    WITH TEST AFTER                                     00892099
                    VARYING AGE-INDEX FROM 1 BY 1                       00893099
                    UNTIL AGE-INDEX = 6                                 00894099
                    OR RATE-TABLE-EOF.                                  00895099
      *                                                                 00895199
       110-LOAD-RATE-TABLE-ENTRY.                                       00896099
           PERFORM 120-READ-RATE-TABLE-RECORD.                          00898099
           IF NOT RATE-TABLE-EOF                                        00899099
               MOVE RT-LOW-AGE  TO LOW-AGE (AGE-INDEX)                  00899199
               MOVE RT-HIGH-AGE TO HIGH-AGE (AGE-INDEX)                 00899299
               PERFORM                                                  00899399
                   WITH TEST AFTER                                      00899499
                   VARYING CLASS-INDEX FROM 1 BY 1                      00899599
                   UNTIL CLASS-INDEX = 4                                00899699
                       SET CLASS-SUB TO CLASS-INDEX                     00899799
               END-PERFORM                                              00899899
           END-IF.                                                      00899999
      *                                                                 00900099
       120-READ-RATE-TABLE-RECORD.                                      00900199
           READ RATETABL                                                00901099
               AT END                                                   00902099
                   MOVE "Y" TO RATE-TABLE-EOF-SWITCH.                   00903099
       200-DISPLAY-INSURANCE-RATE.                                      00910099
           ACCEPT  END-OF-SESSION-SWITCH.                               00940099
           IF NOT END-OF-SESSION                                        00981099
               PERFORM 210-GET-CLIENT-AGE                               00982099
               PERFORM 220-SEARCH-AGE-GROUP                             00983099
               IF AGE-GROUP-FOUND                                       00984099
                   PERFORM 230-GET-CLIENT-CLASS                         00985099
                   PERFORM 240-SEARCH-CLIENT-CLASS                      00986099
                   IF CLASS-FOUND                                       00987099
                       MOVE INSURANCE-RATE (AGE-INDEX CLASS-INDEX)      00988099
                           TO DF-INSURANCE-RATE                         00989099
                       DISPLAY "THE INSURANCE RATE IS "                 00989199
                           DF-INSURANCE-RATE                            00989299
                   ELSE                                                 00989399
                       DISPLAY "CLASS " EF-CLASS-NUMBER " NOT FOUND"    00989499
                   END-IF                                               00989599
               END-IF                                                   00989699
           END-IF.                                                      00989799
       210-GET-CLIENT-AGE.                                              00990099
           ACCEPT  EF-AGE.                                              01020099
       220-SEARCH-AGE-GROUP.                                            01040099
           SET AGE-INDEX TO 1.                                          01050099
           SEARCH AGE-GROUP                                             01051099
               AT END                                                   01052099
                   MOVE "N" TO AGE-GROUP-FOUND-SWITCH                   01053099
               WHEN EF-AGE >= LOW-AGE (AGE-INDEX)                       01054099
                AND EF-AGE <= HIGH-AGE (AGE-INDEX)                      01055099
                   MOVE "Y" TO AGE-GROUP-FOUND-SWITCH.                  01056099
       230-GET-CLIENT-CLASS.                                            01060099
            ACCEPT  EF-CLASS-NUMBER.                                    01090099
       240-SEARCH-CLIENT-CLASS.                                         01110099
           SET CLASS-INDEX TO 1.                                        01120099
           SEARCH CLASS-GROUP                                           01121099
               AT END                                                   01122099
                   MOVE "N" TO CLASS-FOUND-SWITCH                       01123099
               WHEN EF-CLASS-NUMBER                                     01124099
                       = CLASS-NUMBER (AGE-INDEX CLASS-INDEX)           01125099
                   MOVE "Y" TO CLASS-FOUND-SWITCH.                      01126099
       300-PRINT-RATE-TABLE.                                            01130099
           PERFORM                                                      01140099
               WITH TEST AFTER                                          01150099
               VARYING AGE-INDEX FROM 1 BY 1                            01160099
               UNTIL AGE-INDEX = 6                                      01170099
                   MOVE LOW-AGE (AGE-INDEX)  TO AR-LOW-AGE              01180099
                   MOVE HIGH-AGE (AGE-INDEX) TO AR-HIGH-AGE             01190099
                   PERFORM                                              01200099
                       WITH TEST AFTER                                  01210099
                       VARYING CLASS-INDEX FROM 1 BY 1                  01220099
                       UNTIL CLASS-INDEX = 4                            01230099
                           SET CLASS-SUB TO CLASS-INDEX                 01240099
                           MOVE INSURANCE-RATE (AGE-INDEX CLASS-INDEX)  01250099
                               TO AR-INSURANCE-RATE (CLASS-SUB)         01260099
                   END-PERFORM                                          01270099
           END-PERFORM.                                                 01271099
               MOVE AGE-RATE-LINE TO PRINT-AREA.                        01280099
               PERFORM 310-WRITE-REPORT-LINE.                           01290099
       310-WRITE-REPORT-LINE.                                           01300099
           WRITE PRINT-AREA AFTER ADVANCING 1 LINE.                     01310099
