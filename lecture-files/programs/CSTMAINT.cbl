       IDENTIFICATION DIVISION.                                         00003010
       PROGRAM-ID.  CSTMAINT.                                           00004022
       ENVIRONMENT DIVISION.                                            00010010
       INPUT-OUTPUT SECTION.                                            00020010
       FILE-CONTROL.                                                    00030010
           SELECT  CUSTOMER-MNT-FILE ASSIGN TO CUSTOLD                  00040022
           FILE STATUS IS WF-CUST-STATUS.                               00060022
           SELECT  CUSTOMER-UPDATE-FILE ASSIGN TO CUSTNEW               00061022
           FILE STATUS IS WF-UPDATED-STATUS.                            00062022
       DATA DIVISION.                                                   00070010
       FILE SECTION.                                                    00080010
       FD  CUSTOMER-MNT-FILE                                            00081022
           RECORD CONTAINS 80 CHARACTERS.                               00082025
       01  CUSTOMER-MNT-REC.                                            00083022
            05  CMF-CODE                    PIC X.                      00085022
            05  CMF-DATA.                                               00087022
               07 CMF-NUMBER               PIC 9(6).                    00089022
               07 CMF-NAME                 PIC X(32).                   00089222
               07 CMF-TYPE                 PIC X.                       00089422
            05  CMF-AGE                    PIC 99.                      00089622
            05  FILLER                     PIC X(38).                   00089825
       FD  CUSTOMER-UPDATE-FILE                                         00089922
           RECORD CONTAINS 80 CHARACTERS.                               00090025
       01  CUSTOMER-UPD-REC.                                            00090122
            05  UPD-CODE                    PIC X.                      00090322
            05  UPD-DATA.                                               00090522
               07 UPD-NUMBER               PIC Z(6).                    00090723
               07 UPD-NAME                 PIC X(32).                   00090922
               07 UPD-TYPE                 PIC X.                       00091122
            05  UPD-AGE                    PIC 99.                      00091324
            05  FILLER                     PIC X(38).                   00091525
       WORKING-STORAGE SECTION.                                         00100022
        01  WF-FLAGS.                                                   00182122
            05  WF-END-OF-FILE              PIC X.                      00182322
                88  END-OF-FILE             VALUE 'Y'.                  00182522
                88  NOT-END-OF-FILE         VALUE 'N'.                  00182722
            05 WF-CUST-STATUS               PIC XX.                     00182922
                88  CUST-FILE-OK            VALUE '00'.                 00183122
            05 WF-UPDATED-STATUS            PIC XX.                     00183322
                88  UPDATED-FILE-OK         VALUE '00'.                 00183522
                                                                        00190008
        PROCEDURE DIVISION.                                             00200010
        000-MAINLINE.                                                   00210022
            PERFORM 100-INITIALIZE.                                     00220022
            PERFORM 200-OPEN-FILES.                                     00230022
            PERFORM 400-PROCESS-FILE                                    00240022
                     UNTIL END-OF-FILE.                                 00250022
            PERFORM 900-CLOSE-FILES                                     00260022
            STOP RUN.                                                   00270022
       100-INITIALIZE.                                                  00280022
            SET NOT-END-OF-FILE TO TRUE.                                00290022
       200-OPEN-FILES.                                                  00300022
            OPEN INPUT CUSTOMER-MNT-FILE.                               00310022
            IF NOT CUST-FILE-OK THEN                                    00320022
              DISPLAY 'CUSTOMER FILE OPEN ERROR : ' WF-CUST-STATUS      00330022
              PERFORM 1000-ABORT                                        00340022
            END-IF.                                                     00350022
            OPEN  OUTPUT  CUSTOMER-UPDATE-FILE.                         00360022
            IF NOT UPDATED-FILE-OK THEN                                 00370022
              DISPLAY 'CUSTOMER FILE OPEN ERROR : ' WF-UPDATED-STATUS   00380022
              PERFORM 1000-ABORT                                        00390022
            END-IF.                                                     00400022
       400-PROCESS-FILE.                                                00410022
           READ CUSTOMER-MNT-FILE                                       00420022
             AT END SET END-OF-FILE TO TRUE                             00430022
             NOT AT END                                                 00440022
                 PERFORM 500-COPY-AND-UPDATE-FILE                       00450022
           END-READ.                                                    00460022
           IF NOT END-OF-FILE                                           00470022
              PERFORM 500-COPY-AND-UPDATE-FILE.                         00480022
       500-COPY-AND-UPDATE-FILE.                                        00490026
           MOVE CUSTOMER-MNT-REC TO  CUSTOMER-UPD-REC.                  00500022
           ADD  1 TO  UPD-AGE.                                          00510022
           DISPLAY " writing " UPD-NAME.                                00520022
           WRITE   CUSTOMER-UPD-REC.                                    00530022
       900-CLOSE-FILES.                                                 00540022
           CLOSE   CUSTOMER-MNT-FILE.                                   00550022
           CLOSE   CUSTOMER-UPDATE-FILE.                                00560022
       1000-ABORT.                                                      00570022
            STOP RUN.                                                   00580022
