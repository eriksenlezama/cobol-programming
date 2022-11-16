      * ASSIGNMENT 1                                                    00010008
                                                                        00011001
       IDENTIFICATION DIVISION.                                         00020000
       PROGRAM-ID. ASSIGN01.                                            00030003
       AUTHOR. ERIKSEN.                                                 00040001
                                                                        00041001
       DATA DIVISION.                                                   00050000
       WORKING-STORAGE SECTION.                                         00060000
       01 ws-num1      PIC 9(3).                                        00070003
       01 ws-num2      PIC 9(3).                                        00080003
       01 ws-add       PIC 9(3).                                        00090003
       01 ws-sub       PIC 9(3).                                        00100003
       01 ws-mult      PIC 9(3).                                        00110003
       01 ws-div       PIC 9(3).                                        00120003
       01 ws-remd      PIC 9(3).                                        00130007
       01 ws-comp-add  PIC 9(3).                                        00150003
       01 ws-comp-sub  PIC 9(3).                                        00150103
       01 ws-comp-mult PIC 9(3).                                        00150202
       01 ws-comp-div  PIC 9(3).                                        00150303
                                                                        00160002
       PROCEDURE DIVISION.                                              00170002
           ACCEPT ws-num1.                                              00171002
           ACCEPT ws-num2.                                              00172002
                                                                        00172102
      * OPERATIONS *                                                    00172204
           ADD ws-num1 TO ws-num2 GIVING ws-add.                        00173005
           SUBTRACT ws-num1 FROM ws-num2 GIVING ws-sub.                 00180005
           MULTIPLY ws-num1 BY ws-num2 GIVING ws-mult.                  00181005
           DIVIDE ws-num1 BY ws-num2 GIVING ws-div REMAINDER ws-remd.   00182009
                                                                        00182202
      * OPERATIONS WITH COMPUTE *                                       00182304
           COMPUTE ws-comp-add  = ws-num1 + ws-num2.                    00183008
           COMPUTE ws-comp-sub  = ws-num1 - ws-num2.                    00183108
           COMPUTE ws-comp-mult = ws-num1 * ws-num2.                    00183202
           COMPUTE ws-comp-div  = ws-num1 / ws-num2.                    00183308
                                                                        00184002
      * DISPLAYING VALUES *                                             00185004
           DISPLAY "NUM1         = " ws-num1                            00190011
           DISPLAY "NUM2         = " ws-num2                            00200011
           DISPLAY " "                                                  00200111
           DISPLAY "-----------------------"                            00201008
           DISPLAY "OPERATIONS USING VERBS"                             00202010
           DISPLAY "-----------------------"                            00203011
           DISPLAY "NUM1 + NUM2  = " ws-add                             00210011
           DISPLAY "NUM1 - NUM2  = " ws-sub                             00220011
           DISPLAY "NUM1 * NUM2  = " ws-mult                            00230011
           DISPLAY "NUM1 / NUM2  = " ws-div                             00240011
           DISPLAY "NUM1 % NUM2  = " ws-remd.                           00250011
           DISPLAY " "                                                  00250111
           DISPLAY "-----------------------"                            00250210
           DISPLAY "OPERATIONS USING COMPUTE"                           00251010
           DISPLAY "-----------------------"                            00252011
           DISPLAY "NUM1 + NUM2  = " ws-comp-add                        00260011
           DISPLAY "NUM1 - NUM2  = " ws-comp-sub                        00261011
           DISPLAY "NUM1 * NUM2  = " ws-comp-mult                       00280011
           DISPLAY "NUM1 / NUM2  = " ws-comp-div                        00281011
           STOP RUN.                                                    00290000
