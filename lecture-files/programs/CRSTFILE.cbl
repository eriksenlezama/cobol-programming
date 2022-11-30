       IDENTIFICATION DIVISION.                                         00010074
       PROGRAM-ID. CRSTFILE.                                            00020074
       ENVIRONMENT DIVISION.                                            00040074
       INPUT-OUTPUT SECTION.                                            00050075
       FILE-CONTROL.                                                    00060075
           SELECT OUTFILE ASSIGN TO STFILE                              00090087
           ORGANIZATION IS SEQUENTIAL.                                  00091087
       DATA DIVISION.                                                   00100074
       FILE SECTION.                                                    00110074
       FD  OUTFILE                                                      00150696
           RECORDING MODE IS F                                          00150789
           DATA RECORD IS OUT-REC.                                      00150889
       01 OUT-REC        PIC X(80).                                     00150987
       WORKING-STORAGE SECTION.                                         00151077
       77  END-OF-SESSION-SWITCH       PIC X   VALUE "N".               00151187
       01 WS-STUDENT.                                                   00152077
             05 WS-STUDENT-ID PIC X(5).                                 00153081
             05 WS-NAME PIC X(25).                                      00154081
             05 END-OF-FILE PIC X(1).                                   00154191
             05 FILLER  PIC X(49).                                      00154291
       PROCEDURE DIVISION.                                              00170074
           OPEN OUTPUT OUTFILE.                                         00180087
           PERFORM WRITE-TO-FILE                                        00190088
                  UNTIL END-OF-SESSION-SWITCH = "Y".                    00191088
           STOP RUN.                                                    00192087
       WRITE-TO-FILE.                                                   00193087
           ACCEPT WS-STUDENT.                                           00200087
           DISPLAY WS-STUDENT.                                          00200191
           IF END-OF-FILE = "Y" THEN                                    00201091
             MOVE "Y" TO END-OF-SESSION-SWITCH                          00202090
             CLOSE OUTFILE                                              00202190
           ELSE                                                         00203090
              MOVE WS-STUDENT TO OUT-REC                                00204095
              WRITE OUT-REC                                             00211093
           END-IF.                                                      00220090
