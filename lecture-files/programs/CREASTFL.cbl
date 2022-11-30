       IDENTIFICATION DIVISION.                                         00003010
       PROGRAM-ID.  CREASTFL.                                           00004010
       ENVIRONMENT DIVISION.                                            00010010
       INPUT-OUTPUT SECTION.                                            00020010
       FILE-CONTROL.                                                    00030010
           SELECT StudentFile ASSIGN TO SDDATA.                         00040021
                                                                        00060008
       DATA DIVISION.                                                   00070010
       FILE SECTION.                                                    00080010
       FD StudentFile.                                                  00081010
       01 studentdetails      pic x(80).                                00090017
       working-storage section.                                         00100018
       01 ws-StudentDetails.                                            00182015
          02  ws-StudentId       PIC 9(7).                              00183016
          02  ws-StudentName.                                           00184016
              03 ws-Surname      PIC X(8).                              00185016
              03 ws-Initials     PIC XX.                                00186016
          02  ws-DateOfBirth.                                           00187016
              03 ws-YOBirth      PIC 9(4).                              00188016
              03 ws-MOBirth      PIC 9(2).                              00189016
              03 ws-moBirth      PIC 9(2).                              00189116
          02  ws-CourseCode      PIC X(4).                              00189216
          02  ws-gender          PIC X.                                 00189316
          02  FILLER          PIC X(50).                                00189415
                                                                        00190008
        PROCEDURE DIVISION.                                             00200010
        begin.                                                          00210020
            OPEN OUTPUT StudentFile.                                    00220013
      *   "Enter student details in the job  using sysin."              00230011
                                                                        00240008
            PERFORM GetStudentDetails                                   00250010
            PERFORM UNTIL ws-StudentDetails = SPACES                    00260015
               move ws-studentDetails to StudentDetails                 00261020
               WRITE StudentDetails                                     00270010
               PERFORM GetStudentDetails                                00280010
            END-PERFORM.                                                00290013
            CLOSE StudentFile.                                          00300013
            STOP RUN.                                                   00310010
                                                                        00320008
        GetStudentDetails.                                              00330010
           ACCEPT  ws-StudentDetails.                                   00340015
