      ******************************************************************
      * Author:LUCAS BOLELLI
      * Date: 22/03/2022
      * Purpose: ESTUDAR MOVE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-DECISAOBOOLEAN        PIC X VALUE 'N'.
          88 WS-SET                VALUE 'S' FALSE 'N'.
       01 WS-MOVE.
          03 WS-MOVE-FIRSTNAME     PIC X(50) VALUES SPACES.
          03 WS-MOVE-LASTNAME         PIC X(10) VALUES SPACES.
       PROCEDURE DIVISION.

            MOVE 'S' TO WS-DECISAOBOOLEAN
            DISPLAY WS-DECISAOBOOLEAN
            IF WS-DECISAOBOOLEAN EQUAL TO 'S'
              SET WS-SET TO FALSE
            END-IF.
            DISPLAY WS-DECISAOBOOLEAN
              SET WS-SET TO TRUE
            DISPLAY WS-DECISAOBOOLEAN


            MOVE 'LUCAS' TO WS-MOVE-FIRSTNAME
            IF WS-MOVE GREATER OR EQUAL TO 5
                 MOVE 'BOLELLI' TO WS-MOVE-LASTNAME
            END-IF.
            DISPLAY WS-MOVE-FIRSTNAME, WS-MOVE-LASTNAME

            MOVE LENGTH OF WS-MOVE-FIRSTNAME TO WS-MOVE-LASTNAME
            DISPLAY 'FOI MOVIDO AQUI: ', WS-MOVE-LASTNAME
            DISPLAY LENGTH OF WS-MOVE

            IF WS-MOVE < 50
               DISPLAY 'SEU GAY'
            END-IF.

           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
