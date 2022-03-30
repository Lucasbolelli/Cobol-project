      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 28/03/2022
      * Purpose:TESTAR INITIALIZE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
          01 NM.
           03 NOME         PIC X(5) VALUE 'LUCAS'.
           03 FILLER       PIC X(7) VALUE 'BOLELLI'.
           03 NUM1         PIC 9(03) VALUE 1.
       PROCEDURE DIVISION.

               DISPLAY 'SAIDA 1: '
               DISPLAY NM

               DISPLAY 'SAIDA 2: '
               INITIALISE NM REPLACING ALPHANUMERIC BY '-----'
                                            NUMERIC BY 555
               DISPLAY NM

               DISPLAY 'SAIDA 3: '
               INITIALISE NM
               DISPLAY NM

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
