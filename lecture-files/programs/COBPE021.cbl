      *This program explains about GO TO AND GO TO DEPENDING            00010055
      * BRANCH WITH/WITHOUT CONDITION                                   00011055
       IDENTIFICATION DIVISION.                                         00020024
       PROGRAM-ID. COBPE021                                             00030055
       DATA DIVISION.                                                   00031029
       WORKING-STORAGE SECTION.                                         00032029
       01 WS-A             PIC 9(1) VALUE 3.                            00033055
       PROCEDURE DIVISION.                                              00036043
       PARA-A.                                                          00037055
            DISPLAY 'I AM IN PARA-A'.                                   00039055
            GO TO PARA-B.                                               00040055
       PARA-B.                                                          00150055
            DISPLAY 'I AM IN PARA-B'.                                   00160055
            GO TO PARA-C PARA-D PARA-E DEPENDING ON WS-A.               00160155
       PARA-C.                                                          00160255
            DISPLAY 'I AM IN PARA-C'.                                   00160355
       PARA-D.                                                          00160455
            DISPLAY 'I AM IN PARA-D'.                                   00160555
       PARA-E.                                                          00160755
            DISPLAY 'I AM IN PARA-E'.                                   00160855
            STOP RUN.                                                   00170055
