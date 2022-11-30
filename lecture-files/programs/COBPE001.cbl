      * SAMPLE BASIC HELLO PROGRAM                                      00001013
       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. COBPE001.                                            00020012
       AUTHOR. TSU.                                                     00030003
       DATA DIVISION.                                                   00070003
       WORKING-STORAGE SECTION.                                         00080003
       01  WS-DATE.                                                     00081010
           05 YYYY  PIC X(4).                                           00081111
           05 MM    PIC X(2).                                           00081308
           02 DD    PIC X(2).                                           00081508
       01  WS-NAME  PIC X(66).                                          00082018
       PROCEDURE DIVISION.                                              00120007
       000-DISPLAY-PARA.                                                00130003
           ACCEPT WS-NAME.                                              00130116
           ACCEPT WS-DATE FROM DATE YYYYMMDD.                           00131011
           DISPLAY WS-NAME,WS-DATE.                                     00140015
           STOP RUN.                                                    00150007
