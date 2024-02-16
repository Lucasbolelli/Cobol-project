      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 10/02/2024
      * Purpose: JOGO DA VELHA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIC-TAC-TOE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 TAB.
              05 M-LINHAS     OCCURS 3 TIMES.
                 10 M-COLUNAS OCCURS 3 TIMES.
                   15 M-ESPACO  PIC X VALUE ' '.

       01 WS-JOGADOR          PIC X VALUE 'X'.
       01 WS-LINHA            PIC 99.
       01 WS-COLUNA           PIC X.
       01 WS-GAME-OVER        PIC X VALUE 'N'.
          88 WS-SITUACAO      VALUE 'Y'.
       77 WS-CONTADOR         PIC 99.

       PROCEDURE DIVISION.
            PERFORM LIMPA-TABULEIRO.
            PERFORM DISPLAY-TABULEIRO.

            PERFORM UNTIL WS-GAME-OVER EQUAL 'Y'
            PERFORM TURNO
            IF WS-GAME-OVER EQUAL 'Y'
                PERFORM GANHADOR
            ELSE
                PERFORM TROCA-JOGADOR
                PERFORM DISPLAY-TABULEIRO
            END-IF
            END-PERFORM.


       LIMPA-TABULEIRO.
            MOVE SPACES TO TAB.

       DISPLAY-TABULEIRO.
            DISPLAY '  1 2 3'
            DISPLAY '1 ' M-COLUNAS(1,1) ' | ' M-COLUNAS(1,2) ' | '
                                                      M-COLUNAS(1,3)
            DISPLAY '  ---------'
            DISPLAY '2 ' M-COLUNAS(2,1) ' | ' M-COLUNAS(2,2) ' | '
                                                      M-COLUNAS(2,3)
            DISPLAY '  ---------'
            DISPLAY '3 ' M-COLUNAS(3,1) ' | ' M-COLUNAS(3,2) ' | '
                                                     M-COLUNAS(3,3)
           .

       TURNO.
            DISPLAY 'DE 1 A 9, PARA QUAL CASA DESEJA JOGAR ?'
               ACCEPT WS-COLUNA
            IF WS-COLUNA IS ALPHABETIC
                 DISPLAY 'DIGITE APENAS COM NUMEROS DE 1 A 9'
                 PERFORM TURNO
            END-IF
            MOVE WS-JOGADOR TO TAB(WS-COLUNA:1)
           .
**********************************VERIFICA VERTICAIS*************************************

            IF TAB(1:1)='X' AND TAB(4:1) ='X' AND TAB(7:1)='X' OR
                   TAB(1:1)='O' AND TAB(4:1) ='O' AND TAB(7:1)='O'
               SET WS-SITUACAO TO TRUE
            ELSE IF
                TAB(2:1)='X' AND TAB(5:1) ='X' AND TAB(8:1)='X' OR
                   TAB(2:1)='O' AND TAB(5:1) ='O' AND TAB(8:1)='O'
               SET WS-SITUACAO TO TRUE
            ELSE IF
                TAB(3:1)='X' AND TAB(6:1) ='X' AND TAB(9:1)='X' OR
                   TAB(3:1)='O' AND TAB(6:1) ='O' AND TAB(9:1)='O'
               SET WS-SITUACAO TO TRUE
***** *> ********************************VERIFICAR HORIZONTAIS*****************************
            ELSE IF
                TAB(1:1)='X' AND TAB(2:1) ='X' AND TAB(3:1)='X' OR
                   TAB(1:1)='O' AND TAB(2:1) ='O' AND TAB(3:1)='O'
               SET WS-SITUACAO TO TRUE
            ELSE IF
                TAB(4:1)='X' AND TAB(5:1) ='X' AND TAB(6:1)='X' OR
                   TAB(4:1)='O' AND TAB(5:1) ='O' AND TAB(6:1)='O'
               SET WS-SITUACAO TO TRUE
            ELSE IF
                TAB(7:1)='X' AND TAB(8:1) ='X' AND TAB(9:1)='X' OR
                   TAB(7:1)='O' AND TAB(8:1) ='O' AND TAB(9:1)='O'
               SET WS-SITUACAO TO TRUE
**** **> *********************************************************************************
           ELSE IF
               TAB(1:1)='X' AND TAB(5:1) ='X' AND TAB(9:1)='X' OR
                   TAB(1:1)='O' AND TAB(5:1) ='O' AND TAB(9:1)='O'
               SET WS-SITUACAO TO TRUE
            ELSE IF
                TAB(3:1)='X' AND TAB(5:1) ='X' AND TAB(7:1)='X' OR
                   TAB(3:1)='O' AND TAB(5:1) ='O' AND TAB(7:1)='O'
               SET WS-SITUACAO TO TRUE
            ELSE
                ADD 1 TO WS-CONTADOR
                IF WS-CONTADOR EQUAL 9
                    DISPLAY 'DEU VELHA'
                    STOP RUN.
           .



       TROCA-JOGADOR.
            IF WS-JOGADOR = 'X'
               MOVE 'O' TO WS-JOGADOR
            ELSE
               MOVE 'X' TO WS-JOGADOR
           .

       GANHADOR.
            DISPLAY 'JOGADOR ' WS-JOGADOR ' VENCEU!'
            PERFORM GAME-OVER
           .

           GAME-OVER SECTION.
               STOP RUN.
