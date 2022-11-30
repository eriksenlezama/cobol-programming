      *This program explains about STRING VERB                          00010063
      *Syntax for STRING verb                                           00010163
      * STRING ws-string1 DELIMITED BY SPACE                            00011063
      *  ws-string2 DELIMITED BY SIZE                                   00012063
      *  INTO ws-destination-string                                     00012163
      *  WITH POINTER ws-count                                          00012263
      *  ON OVERFLOW DISPLAY message1                                   00013063
      *  NOT ON OVERFLOW DISPLAY message2                               00014063
      * END-STRING.                                                     00015063
        IDENTIFICATION DIVISION.                                        00016074
        PROGRAM-ID. COBPE023.                                           00017076
        DATA DIVISION.                                                  00019074
        WORKING-STORAGE SECTION.                                        00020074
        01 WS-STRING PIC A(31).                                         00030078
        01 WS-STR1 PIC X(14) VALUE 'TSU  Students'.                     00040078
        01 WS-STR2 PIC A(8) VALUE 'Welcome '.                           00050078
        01 WS-STR3 PIC X(7) VALUE 'To AND'.                             00060077
        01 WS-COUNT PIC 99 VALUE 1.                                     00070075
                                                                        00080074
        PROCEDURE DIVISION.                                             00090074
             STRING WS-STR2 DELIMITED BY SIZE                           00100074
                WS-STR3 DELIMITED BY SPACE                              00110074
                WS-STR1 DELIMITED BY SIZE                               00120074
                INTO WS-STRING                                          00130074
                WITH POINTER WS-COUNT                                   00140074
                ON OVERFLOW DISPLAY 'OVERFLOW!'                         00150074
             END-STRING.                                                00160074
              DISPLAY 'WS-STRING : 'WS-STRING.                          00170074
              DISPLAY 'WS-COUNT : 'WS-COUNT.                            00180074
             STOP RUN.                                                  00190074
