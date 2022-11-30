      * THIS PROGRAM EXPLAINS THE INITIALIZE VERB.                      00001019
       IDENTIFICATION DIVISION.                                         00010018
       PROGRAM-ID. COBPE003                                             00020018
       DATA DIVISION.                                                   00040018
       WORKING-STORAGE SECTION.                                         00050018
       01 WS-NAME PIC X(30) VALUE 'SRINI'.                              00060018
       01 WS-ID PIC   9(5).                                             00070018
       01 WS-ADDRESS.                                                   00080018
          05 WS-HOUSE-NUMBER PIC 9(3).                                  00090018
          05 WS-COUNTRY PIC X(15).                                      00100018
          05 WS-PINCODE PIC 9(5).                                       00110018
       PROCEDURE DIVISION.                                              00130018
       A000-FIRST-PARA.                                                 00140018
           INITIALIZE WS-NAME, WS-ADDRESS.                              00150018
           INITIALIZE WS-ID REPLACING NUMERIC DATA BY 12345.            00160018
           DISPLAY "NAME   : "WS-NAME.                                  00170018
           DISPLAY "ID     : "WS-ID.                                    00180018
           DISPLAY "ADDRESS      : "WS-ADDRESS.                         00190018
           DISPLAY "HOUSE NUMBER : "WS-HOUSE-NUMBER.                    00200018
           DISPLAY "COUNTRY      : "WS-COUNTRY.                         00210018
           DISPLAY "PINCODE      : "WS-PINCODE.                         00220018
           STOP RUN.                                                    00240018
