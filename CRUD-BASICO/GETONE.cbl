      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 05/01/2024
      * Purpose: LEITURA INDEXADA - GETONE ALUNO-ID/NOME
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GETONE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT BOLETIM
               ASSIGN TO
                   'D:\COBOL\bin\NOTASV2.DAT'
                   ORGANIZATION IS INDEXED
                   ACCESS MODE  IS RANDOM
                   RECORD KEY   IS F-ID
                   FILE STATUS IS WS-FS
                   .
       DATA DIVISION.
       FILE SECTION.
           FD BOLETIM.
               COPY BOLETIM_DADOS.
       WORKING-STORAGE SECTION.
       77 WS-FS                            PIC 99.
          88 FS-OK                         VALUE 0.
       77 WS-EOF                           PIC X.
          88 EOF-OK                        VALUE 'S' FALSE 'N'.
       77 WS-EXIT                          PIC X.
          88 EXIT-OK                       VALUE 'F' FALSE 'N'.
       LINKAGE SECTION.
           COPY INF-ALUNO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY '*** FINDONE CONTATO ***'
            SET EXIT-OK                TO FALSE
            PERFORM P300-CONSULTA      THRU P300-FIM UNTIL EXIT-OK
            PERFORM P900-FIM
            .

       P300-CONSULTA.
            SET EOF-OK                  TO FALSE
            SET FS-OK                   TO TRUE

            OPEN INPUT BOLETIM

            IF FS-OK THEN

                DISPLAY 'INFORME O NUMERO DE IDENTIFICACAO DO USER: '
                   ACCEPT WS-ID-ALUNO

                READ BOLETIM INTO BOLETIM-COMPLETO
                KEY IS F-ID
                   INVALID KEY
                       DISPLAY 'CONTATO INEXISTENTE'
                   NOT INVALID KEY
                       DISPLAY WS-ID-ALUNO ' - ' WS-NOME-ALUNO
                END-READ
            ELSE
                DISPLAY 'ERRO AO ABRIR ARQUIVO DE CONTATOS.'
                DISPLAY 'FILE STATUS: ' WS-FS
            END-IF.

            CLOSE BOLETIM

            DISPLAY
                'TECLE: '
                '<QUALQUER TECLA> PARA CONTINUAR, OU <F> PARA FINALIZAR'
               ACCEPT WS-EXIT
               .
       P300-FIM.
       P900-FIM.

            GOBACK.
