       IDENTIFICATION DIVISION.                                         00010074
       PROGRAM-ID. DISPRECS.                                            00020087
       ENVIRONMENT DIVISION.                                            00040074
       INPUT-OUTPUT SECTION.                                            00050075
       FILE-CONTROL.                                                    00060075
           SELECT INFILE ASSIGN TO STUFILE                              00070083
           ORGANIZATION IS SEQUENTIAL.                                  00080083
       DATA DIVISION.                                                   00100074
       FILE SECTION.                                                    00110074
       FD INFILE.                                                       00120083
       01 STUDENT-REC.                                                  00130079
             05 STUDENT-ID PIC X(5).                                    00140081
             05 NAME.                                                   00150085
                10 FNAME PIC X(15).                                     00150185
                10 LNAME PIC X(10).                                     00150285
             05 FILLER   PIC X(50).                                     00150584
       WORKING-STORAGE SECTION.                                         00151077
       01 WS-STUDENT.                                                   00152077
             05 WS-STUDENT-ID PIC X(5).                                 00153081
             05 WS-NAME PIC X(25).                                      00154081
             05 FILLER  PIC X(50).                                      00154184
       01 WS-EOF PIC X(1) VALUE 'N'.                                    00155083
       PROCEDURE DIVISION.                                              00170074
           OPEN INPUT INFILE                                            00180083
              PERFORM UNTIL WS-EOF='Y'                                  00190074
                 READ INFILE INTO WS-STUDENT                            00200083
                    AT END MOVE 'Y' TO WS-EOF                           00210074
                    NOT AT END DISPLAY WS-STUDENT                       00220074
                 END-READ                                               00230074
              END-PERFORM.                                              00240074
           CLOSE INFILE.                                                00250083
           STOP RUN.                                                    00260074
