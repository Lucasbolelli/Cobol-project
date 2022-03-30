      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 21/03/2022
      * Purpose: TESTAR SECTION
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEITU.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 MENSAGEM             PIC X(20) VALUE SPACES.
       PROCEDURE DIVISION.
      *------------------------PRIMEIRA SESSAO-------------------------*
           MAIN-PROC SECTION.
      *------------------------PRIMEIROS PARAGRAFOS--------------------*
           P001-PROC1.
                   MOVE 'P001-PROC1'       TO MENSAGEM
                   DISPLAY MENSAGEM
                   PERFORM SEC-PROC
                   .
           P001-PROC2.
                   MOVE 'P001-PROC2'       TO MENSAGEM
                   DISPLAY MENSAGEM
                   PERFORM SEC-PROC
                   .
           P001-PROC3.
                   IF MENSAGEM NOT EQUAL   TO 'P002-PROC3'
                   MOVE 'P001-PROC3'       TO MENSAGEM
                   DISPLAY MENSAGEM
                   PERFORM P002-PROC3
                   ELSE
                       PERFORM FIM-PROC
                       END-IF
                   .
      *------------------------SEGUNDO PARAGRAFOS----------------------*
           SEC-PROC SECTION.
           P002-PROC1.
                   IF MENSAGEM NOT EQUAL   TO 'P001-PROC2'
                   MOVE 'P002-PROC1'       TO MENSAGEM
                   DISPLAY MENSAGEM
                   PERFORM P001-PROC2
                   .
           P002-PROC2.
                  MOVE 'P002-PROC2'        TO MENSAGEM
                  DISPLAY MENSAGEM
                  PERFORM P001-PROC3
                  .

           P002-PROC3.
                 MOVE 'P002-PROC3'         TO MENSAGEM
                 DISPLAY MENSAGEM
                 PERFORM P001-PROC3
                 .

           FIM-PROC SECTION.
            STOP RUN.
       END PROGRAM LEITU.
