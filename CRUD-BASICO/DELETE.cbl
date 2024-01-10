      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 03/01/2024
      * Purpose: EXCLUIT ARQUIVOS EM LISTA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DELCONTT.
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
       77 WS-CONFIRMA                      PIC X.
          88 CONFIRMA-OK                   VALUE 'S' FALSE 'N'.
       LINKAGE SECTION.
           COPY INF-ALUNO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY '*** UPDATE CONTATO ***'
            SET EXIT-OK                TO FALSE
            PERFORM P300-CONSULTA      THRU P300-FIM UNTIL EXIT-OK
            PERFORM P900-FIM
            .

       P300-CONSULTA.
            SET EOF-OK                  TO FALSE
            SET FS-OK                   TO TRUE
            SET CONFIRMA-OK             TO FALSE

            OPEN I-O BOLETIM

            IF FS-OK THEN

                DISPLAY 'INFORME O NUMERO DE IDENTIFICACAO DO USER: '
                   ACCEPT WS-NOME-ALUNO

                READ BOLETIM INTO BOLETIM-COMPLETO
                KEY IS F-ID
                   INVALID KEY
                       DISPLAY 'CONTATO INEXISTENTE'
                   NOT INVALID KEY
                       DISPLAY 'NOME: ' WS-NOME-ALUNO
                       DISPLAY 'DESEJA DELETAR O ALUNO: '
                       DISPLAY 'TECLE: '
                               '<S> PARA CONFIRMAR OU <QUALQUER TECLA>'
                               ' PARA ABORTAR'
                           ACCEPT WS-CONFIRMA
                       IF WS-CONFIRMA EQUAL 'S' THEN
                           DELETE BOLETIM RECORD
                           DISPLAY 'CONTATO EXCLUIDO COM SUCESSO'
                       ELSE
                           DISPLAY 'O CONTATO NAO FOI EXCLUIDO'
                       END-IF
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
