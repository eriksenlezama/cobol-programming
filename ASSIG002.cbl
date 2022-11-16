      * ASSIGNMENT 2                                                    00010012
                                                                        00011001
       IDENTIFICATION DIVISION.                                         00020000
       PROGRAM-ID. ASSIGN02.                                            00030012
       AUTHOR. ERIKSEN.                                                 00040001
                                                                        00041001
       DATA DIVISION.                                                   00050000
       WORKING-STORAGE SECTION.                                         00060000
       01 ws-s1          PIC X(10).                                     00070036
       01 ws-s2          PIC X(27).                                     00070136
       01 ws-string      PIC X(37).                                     00071036
       01 ws-u-1         PIC X(15).                                     00073036
       01 ws-u-2         PIC X(15).                                     00074036
       01 ws-u-3         PIC X(15).                                     00075036
       01 ws-u-4         PIC X(15).                                     00076036
       01 ws-u-5         PIC X(15).                                     00077036
       01 ws-char-count  PIC 9(2).                                      00090036
       01 ws-subs-count  PIC 9(2).                                      00100036
                                                                        00160002
       PROCEDURE DIVISION.                                              00170002
           ACCEPT ws-s1.                                                00171022
           ACCEPT ws-s2.                                                00172022
                                                                        00172302
           STRING ws-s1 DELIMITED BY SIZE                               00172525
                  ws-s2 DELIMITED BY SIZE                               00172725
                  INTO ws-string.                                       00172836
                                                                        00172927
           UNSTRING ws-string DELIMITED BY SPACE                        00173036
                    INTO ws-u-1 ws-u-2 ws-u-3 ws-u-4 ws-u-5             00173232
                    TALLYING IN ws-subs-count.                          00173436
                                                                        00173727
           INSPECT ws-string TALLYING ws-char-count FOR CHARACTERS.     00174036
                                                                        00182202
      * DISPLAYING VALUES *                                             00185004
           DISPLAY "String received: "                 ws-string.       00191036
           DISPLAY "Num of characters: "               ws-char-count.   00193036
           DISPLAY "Num of substrings: "               ws-subs-count.   00194036
           STOP RUN.                                                    00290000
