      *This program explains about INSPECT VERB                         00010056
      *Please practice the following options                            00010159
      * INSPECT statement with TALLYING phrase (Key Phrases to use:     00011059
      *  BEFORE/AFTER, CHARACTERS BY,ALL,LEADING AND FIRST)             00012059
      * INSPECT statement with REPLACING Phrase (Key Phrases to use:    00012159
      *  BEFORE/AFTER, CHARACTERS BY,ALL,LEADING AND FIRST)             00012259
      * INSPECT statement with TALLYING and REPLACING phrases           00013059
      * INSPECT statement with CONVERTING phrase                        00014059
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE022                                             00030056
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-CNT1          PIC 9(1) VALUE 0.                            00033062
       01 WS-CNT2          PIC 9(1) VALUE 0.                            00034062
       01 WS-STRING        PIC X(13) VALUE 'SRINIVASA RAO'.             00035061
       01 WS-UPPER         PIC X(26) VALUE                              00035159
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.                                 00035260
       01 WS-LOWER         PIC X(26) VALUE                              00035359
          'abcdefghijklmnopqrstuvwxyz'.                                 00035460
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            INSPECT WS-STRING TALLYING WS-CNT1                          00039057
             FOR ALL 'A' BEFORE INITIAL SPACE.                          00039157
            DISPLAY 'TOTAL CHARACTERS: ' WS-CNT1.                       00039357
                                                                        00039461
            INSPECT WS-STRING TALLYING WS-CNT2 FOR ALL 'S'.             00039558
            DISPLAY 'TOTAL OF S CHARS: ' WS-CNT2.                       00160956
                                                                        00161061
            INSPECT WS-STRING                                           00161159
                   CONVERTING WS-UPPER TO WS-LOWER.                     00162059
            DISPLAY 'After conversion: ' ws-string.                     00163059
                                                                        00164061
            inspect ws-string replacing all 'a' by 'B'.                 00165061
            display 'New string: ' ws-string.                           00166061
            STOP RUN.                                                   00170055
