      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 05/01/2024
      * Purpose: UTILIZAR TODAS AS TECNICAS CPY, READ/WRITE, MODULO
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.

       PROGRAM-ID. BOLETIMV2.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       COPY INF-ALUNO.
       77 WS-SAIDA                 PIC A.
       77 WS-TXT                   PIC A VALUE 'S'.
       PROCEDURE DIVISION.
            INITIALIZE BOLETIM-COMPLETO.

       ALUNO SECTION.
       ACCEPT WS-DATA-SISTEMA FROM DATE YYYYMMDD
               MOVE WS-DATA-SISTEMA(01:04) TO WS-DATA-FORMAT(01:04)
               MOVE '/' TO WS-DATA-FORMAT(05:01)
               MOVE WS-DATA-SISTEMA(05:02) TO WS-DATA-FORMAT(06:02)
               MOVE '/' TO WS-DATA-FORMAT(08:01)
               MOVE WS-DATA-SISTEMA(07:02) TO WS-DATA-FORMAT(09:02)

           DISPLAY 'INFORME SEU NOME DO ALUNO: '
               ACCEPT WS-NOME-ALUNO

           DISPLAY 'INFORME A MATERIA CONSULTADA:'
               ACCEPT WS-NOME-MATERIA

           CALL 'NOTECALC'
                      USING WS-CAMPO-DE-MEDIAS

           DISPLAY 'MEDIA 1º BIM: ' MEDIA1
           DISPLAY 'MEDIA 2º BIM: ' MEDIA2
           DISPLAY 'MEDIA 3º BIM: ' MEDIA3
           DISPLAY 'MEDIA 4º BIM: ' MEDIA4
           DISPLAY 'MEDIA TOTAL: '  MEDIATOTAL
           .

       P01-RESULTPROC.

           IF MEDIATOTAL LESS 7
               DISPLAY '****RESULTADO DO PROCESSAMENTO****'
               DISPLAY 'DATA: '          WS-DATA-FORMAT
               DISPLAY 'NOME DO ALUNO: ' WS-NOME-ALUNO
               DISPLAY 'MÁTERIA: '       WS-NOME-MATERIA
               DISPLAY 'MEDIA: '         MEDIATOTAL
               SET       WS-SITUACAO TO 'REPROVADO'
               DISPLAY                   WS-SITUACAO

           ELSE
               DISPLAY '****RESULTADO DO PROCESSAMENTO****'
               DISPLAY 'DATA: '          WS-DATA-FORMAT
               DISPLAY 'NOME DO ALUNO: ' WS-NOME-ALUNO
               DISPLAY 'MÁTERIA: '       WS-NOME-MATERIA
               DISPLAY 'MEDIA: '         MEDIATOTAL
               SET       WS-SITUACAO TO 'APROVADO'
               DISPLAY                   WS-SITUACAO

           END-IF.

           DISPLAY 'DESEJA UMA COPIA DO BOLETIM EM BLOCO DE NOTAS ?'
               ACCEPT WS-TXT

           IF WS-TXT EQUAL 'S' THEN
               ADD 1 TO WS-ID-ALUNO
               DISPLAY 'ID DO ALUNO: ' WS-ID-ALUNO
               CALL 'CREATE'
                   USING BOLETIM-COMPLETO

               DISPLAY
               'DESEJA INSERIR UM NOVO ALUNO NO ARQUIVO ?'
               'S PARA SIM OU N PARA NAO'
                   ACCEPT WS-SAIDA
               EVALUATE WS-SAIDA
                   WHEN 'S'
                       GO TO ALUNO
                   WHEN 'N'
                       DISPLAY 'DESEJA VISUALIZAR TODOS OS ALUNOS '
                               'CADASTRADOS'
                           ACCEPT WS-SAIDA
                           IF WS-SAIDA EQUAL 'S' THEN
                               CALL 'GETALL'
                                   USING BOLETIM-COMPLETO
                           ELSE
                               DISPLAY
                               'DESEJA ENCERRAR O PROGRAMA ?'
                               'S PARA SIM OU N PARA NAO'
                                   ACCEPT WS-SAIDA
                               EVALUATE WS-SAIDA
                                   WHEN 'S'
                                       STOP RUN
                                   WHEN 'N'
                                       DISPLAY
                                     'DESEJA ALTERAR ALGUM REGISTRO?'
                                     'S PARA SIM OU N PARA NAO'
                                           ACCEPT WS-SAIDA
                                           IF WS-SAIDA EQUAL 'S'
                                               CALL 'UPDATT'
                                                  USING BOLETIM-COMPLETO
                                           ELSE
                                               DISPLAY 'DESEJA VER'
                                                       'UM REGISTRO ?'
                                                       'S OU N'
                                                       ACCEPT WS-SAIDA
                                                EVALUATE WS-SAIDA
                                                       WHEN 'S'
                                                          CALL 'FINDONE'
                                                          USING
                                                        BOLETIM-COMPLETO
                                                       WHEN 'N'
                                                           DISPLAY
                                                           'DESEJA '
                                                           'DELETAR UM '
                                                           'REGISTRO!!'
                                                         ACCEPT WS-SAIDA
                                                       EVALUATE WS-SAIDA
                                                       WHEN 'S'
                                                          CALL 'FINDONE'
                                                          USING
                                                        BOLETIM-COMPLETO
                                                        WHEN 'N'
                                                        DISPLAY
                                                        'O PROGRAMA '
                                                        'SERA '
                                                        'ENCERRADO !!!'
                                                        STOP RUN

           END-IF.

       P01-FIM.
            STOP RUN.

       END PROGRAM BOLETIMV2.
