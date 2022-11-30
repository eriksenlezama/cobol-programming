       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC1000.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  END-OF-SESSION-SWITCH       PIC X   VALUE "N".
       77  SALES-AMOUNT                PIC 9(5).
       77  SALES-TAX                   PIC Z,ZZZ.99.
       PROCEDURE DIVISION.
       000-CALCULATE-SALES-TAX.
           PERFORM 100-CALCULATE-ONE-SALES-TAX
                   UNTIL END-OF-SESSION-SWITCH = "Y".
           DISPLAY "END OF SESSION.".
           STOP RUN.
        100-CALCULATE-ONE-SALES-TAX.
            ACCEPT SALES-AMOUNT.
            IF SALES-AMOUNT = 0
                   MOVE "Y" TO END-OF-SESSION-SWITCH
            ELSE
            COMPUTE SALES-TAX ROUNDED =
                  SALES-AMOUNT * .0785
                  DISPLAY "SALES TAX = " SALES-TAX
            END-IF.
