      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 05/01/2024
      * Purpose: LEITURA SEQUENCIAL DE ARQUIVO INDEXADO - GETALL
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GETALL.
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
       77 WS-CONT                          PIC 9(03) VALUE 0.
       LINKAGE SECTION.
           COPY INF-ALUNO.
       PROCEDURE DIVISION USING BOLETIM-COMPLETO.
       MAIN-PROCEDURE.
            DISPLAY '*** LISTAGEM DE CONTATOS ***'
            SET EXIT-OK                TO FALSE
            PERFORM P300-LISTAR        THRU P300-FIM
            PERFORM P900-FIM
            .

       P300-LISTAR.
            SET EOF-OK                  TO FALSE
            SET FS-OK                   TO TRUE
            SET WS-CONT                 TO 0.

            OPEN INPUT BOLETIM
            IF FS-OK THEN
               PERFORM UNTIL EOF-OK
                  READ BOLETIM INTO BOLETIM-COMPLETO
                       AT END
                          SET EOF-OK TO TRUE
                       NOT AT END
                           ADD 1      TO WS-CONT
                           DISPLAY 'REGISTRO '
                                    WS-CONT
                                    ': '
                                    WS-ID-ALUNO
                                    ' - '
                                    WS-NOME-ALUNO
                   END-READ
               END-PERFORM
            ELSE
                DISPLAY 'ERRO AO ABRIR OS REGISTROS DOS ALUNOS.'
                DISPLAY 'FILE STATUS: ' WS-FS
            END-IF
               .
       P300-FIM.
       P900-FIM.

            GOBACK.
