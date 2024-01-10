      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 05/01/2024
      * Purpose: UTILIZAR TODAS AS TECNICAS DE CRUD - CREATE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREATE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT BOLETIM
               ASSIGN TO
                   'D:\COBOL\bin\NOTASV2.DAT'
                   ORGANIZATION IS INDEXED
                   ACCESS MODE  IS SEQUENTIAL
                   RECORD KEY   IS F-ID
                   FILE STATUS IS WS-FILE-STATUS
                   .
       DATA DIVISION.
       FILE SECTION.
       FD BOLETIM
       DATA RECORD IS BOLETIM-LINHA.
            COPY BOLETIM_DADOS.
       WORKING-STORAGE SECTION.
       77 WS-FILE-STATUS                   PIC 9(02).
       LINKAGE SECTION.
           COPY INF-ALUNO.
       PROCEDURE DIVISION USING BOLETIM-COMPLETO.
       MAIN-PROCEDURE.

       P01-PROCESSA.
            DISPLAY 'ALUNO INSERIDO NO TXT'
               OPEN OUTPUT BOLETIM

               MOVE '*** RESULTADO DO PROCESSAMENTO ***'
                   TO F-CABECALHO
               MOVE ' NOME DO ALUNO: '
                   TO F-NOME
               SET F-NOME(17:)     TO WS-NOME-ALUNO
               MOVE 'MATERIA: '
                   TO F-MATERIA
               SET F-MATERIA(10:)  TO WS-NOME-MATERIA
               MOVE 'MEDIA: '
                   TO F-MEDIA
               SET F-MEDIA(8:)     TO MEDIATOTAL
               MOVE ' STATUS: '
                   TO F-STATUS
               SET F-STATUS(10:)   TO WS-SITUACAO
               MOVE 'ID: '
                   TO F-ID
               SET F-ID(5:)        TO WS-ID-ALUNO
               MOVE '**********************************'
                   TO F-RODAPE
               WRITE BOLETIM-LINHA
               CLOSE BOLETIM

            IF WS-FILE-STATUS <> 0 THEN
                DISPLAY 'ERRO NO PROCESSAMENTO --> COD '
                                               WS-FILE-STATUS
                GOBACK
            END-IF
            .

       P01-FIM.

       P99-SAIDA.
            GOBACK.
