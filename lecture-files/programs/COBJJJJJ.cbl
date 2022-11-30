      * Sample program to write multiplication table using perform      00001019
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. COBPE002.                                            00020013
       AUTHOR. TSU.                                                     00030003
       DATA DIVISION.                                                   00070003
       WORKING-STORAGE SECTION.                                         00080003
       01  A            PIC 9(2).                                       00081023
       01  B            PIC 9(2).                                       00081123
       01  I            PIC 9(2).                                       00081223
       01  J            PIC 9(2).                                       00081323
       01  MULT         PIC 9(3).                                       00081423
       PROCEDURE DIVISION.                                              00120007
       000-DISPLAY-PARA.                                                00130003
           ACCEPT A.                                                    00131023
           ACCEPT B.                                                    00132023
           PERFORM MULT-PARA VARYING I FROM 1 BY 1 UNTIL I = A.         00140023
       MULT-PARA.                                                       00140113
           PERFORM DISP-PARA VARYING J FROM 1 BY 1 UNTIL J > B.         00140223
       DISP-PARA.                                                       00140322
           COMPUTE MULT = I * J                                         00140416
           DISPLAY I, ' * ',  J , ' = ',  MULT.                         00140516
       EXIT-PARA.                                                       00140613
           STOP RUN.                                                    00150007
