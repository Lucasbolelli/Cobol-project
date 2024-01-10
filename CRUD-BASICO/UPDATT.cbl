      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 05/01/2024
      * Purpose: ALTERAR CONTATO - UPDATE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UPDATT.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT BOLETIM
               ASSIGN TO
                   'D:\COBOL\bin\NOTASV2.DAT'
                   ORGANIZATION IS INDEXED
                   ACCESS MODE  IS RANDOM
                   RECORD KEY   IS F-ID
                   FILE STATUS IS WS-FILE-STATUS
                   .
       DATA DIVISION.
       FILE SECTION.
       FD BOLETIM
       DATA RECORD IS BOLETIM-LINHA.
       01 BOLETIM-LINHA.
           03 F-CABECALHO      PIC X(34).
           03 F-NOME           PIC X(30).
           03 F-MATERIA        PIC X(30).
           03 F-MEDIA          PIC X(10).
           03 F-STATUS         PIC X(20).
           03 F-RODAPE         PIC X(34).
           03 F-ID             PIC X(06).
       WORKING-STORAGE SECTION.
       77 WS-FILE-STATUS                   PIC 9(02).
       77 WS-ENCERRA                       PIC X.
          88 ENCERRA-OK                    VALUE 'S' FALSE 'N'.
       77 WS-ALTERA                        PIC X.
       LINKAGE SECTION.
           COPY INF-ALUNO.
       PROCEDURE DIVISION USING BOLETIM-COMPLETO.
       MAIN-PROCEDURE.

       P01-PROCESSA.
            SET ENCERRA-OK         TO TRUE

            DISPLAY F-ID

            PERFORM UNTIL WS-ENCERRA EQUAL 'N'
                OPEN I-O BOLETIM
                DISPLAY 'INFORME O NUMERO DE IDENTIFICACAO DO ALUNO: '
                   ACCEPT F-ID
                READ BOLETIM INTO BOLETIM-COMPLETO
                   KEY IS F-ID
                   INVALID KEY
                       DISPLAY 'REGISTRO INEXISTENTE'
                   NOT INVALID KEY
                       DISPLAY 'INFORME OQUE DESEJA ALTERAR'
                               'M PARA MEDIA OU N PARA ALTERAR NOMES'
                           ACCEPT WS-ALTERA
                           IF WS-ALTERA EQUAL 'M' THEN
                               DISPLAY 'QUAL A NOVA MEDIA ?'
                                   ACCEPT MEDIATOTAL
                           ELSE
                               DISPLAY 'INFORME O NOVO NOME PARA O '
                                                             'ALUNO'
                                   ACCEPT WS-NOME-ALUNO
                           END-IF
                 REWRITE BOLETIM-LINHA
            DISPLAY 'DESEJA ALTERAR MAIS UM ALUNO ?'
                    'S PARA SIM N PARA NAO'
               ACCEPT WS-ENCERRA

            END-PERFORM


            IF WS-FILE-STATUS <> 0 THEN
                DISPLAY 'ERRO NO PROCESSAMENTO --> COD '
                                               WS-FILE-STATUS
                GOBACK
            END-IF

            CLOSE BOLETIM
            .

       P01-FIM.

       P99-SAIDA.
        GOBACK.
