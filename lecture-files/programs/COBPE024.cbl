      *This program explains about UNSTRING VERB                        00010068
      *Syntax for STRING verb                                           00010163
      * UNSTRING ws-string1 DELIMITED BY SPACE                          00011068
      *  ws-string1,ws-string2                                          00012068
      * NOT ON OVERFLOW DISPLAY message2                                00014077
      * END-UNSTRING.                                                   00015070
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE024                                             00030068
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-STRING        PIC X(30) VALUE                              00033075
            'WELCOME TO CLASS'.                                         00034074
       01 WS-STRING1       PIC X(7).                                    00035073
       01 WS-STRING2       PIC X(2).                                    00035173
       01 WS-STRING3       PIC X(5).                                    00035274
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            UNSTRING WS-STRING DELIMITED BY SPACE                       00038068
             INTO WS-STRING1                                            00050068
                 ,WS-STRING2                                            00051073
                 ,WS-STRING3                                            00052073
            END-UNSTRING.                                               00080070
            DISPLAY 'String1 : ' WS-STRING1.                            00100068
            DISPLAY 'String2 : ' WS-STRING2.                            00101068
            DISPLAY 'String3 : ' WS-STRING3.                            00102068
            STOP RUN.                                                   00120065
