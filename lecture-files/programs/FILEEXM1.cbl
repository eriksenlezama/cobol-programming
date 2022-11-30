       IDENTIFICATION DIVISION.                                         00010074
       PROGRAM-ID. FILEEXM1.                                            00020096
       ENVIRONMENT DIVISION.                                            00040074
       INPUT-OUTPUT SECTION.                                            00050075
       FILE-CONTROL.                                                    00060075
           SELECT INPUT-FILE ASSIGN TO INFILE                           00090096
           ORGANIZATION IS SEQUENTIAL.                                  00091087
           SELECT OUTPUT-FILE ASSIGN TO OUTFILE                         00092096
           ORGANIZATION IS SEQUENTIAL.                                  00093096
       DATA DIVISION.                                                   00100074
       FILE SECTION.                                                    00110074
       FD  INPUT-FILE                                                   00150696
           RECORDING MODE IS F                                          00150789
           DATA RECORD IS INPUT-REC.                                    00150896
       01  INPUT-REC.                                                   00150996
           05 NAME.                                                     00151096
              10 FNAME    PIC X(10).                                    00151196
              10 MNAME    PIC X(5).                                     00151296
              10 LNAME    PIC X(10).                                    00151396
           05 ADDRSS1.                                                  00151497
              10 STREET   PIC X(10).                                    00151596
              10 CITY     PIC X(10).                                    00151696
           05 PHONE       PIC 9(10).                                    00151796
           05 FILLER      PIC X(25).                                    00151896
       FD  OUTPUT-FILE                                                  00151996
           RECORDING MODE IS F                                          00152096
           DATA RECORD IS OUTPUT-REC.                                   00152196
       01 OUTPUT-REC        PIC X(80).                                  00152297
       WORKING-STORAGE SECTION.                                         00152396
       01  EOF-FLAG             PIC X    VALUE SPACE.                   00152496
           88  EOF              VALUE 'T'.                              00152596
           88  NOT-EOF          VALUE 'F'.                              00152696
       PROCEDURE DIVISION.                                              00170074
       010-START-PROCESS.                                               00171096
           OPEN INPUT INPUT-FILE.                                       00180096
           OPEN OUTPUT OUTPUT-FILE.                                     00181096
           SET NOT-EOF TO TRUE.                                         00190096
           READ INPUT-FILE                                              00191096
              AT END                                                    00191196
                 SET EOF TO TRUE                                        00191296
           END-READ                                                     00191396
           PERFORM UNTIL EOF                                            00191496
             MOVE INPUT-REC TO OUTPUT-REC                               00191596
             WRITE OUTPUT-REC                                           00191699
             READ INPUT-FILE                                            00191796
               AT END                                                   00191896
                  SET EOF TO TRUE                                       00191996
             END-READ                                                   00192096
           END-PERFORM                                                  00192196
           CLOSE INPUT-FILE.                                            00192298
           CLOSE OUTPUT-FILE.                                           00192398
           STOP RUN.                                                    00192487
