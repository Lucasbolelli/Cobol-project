      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 03/01/2024
      * Purpose: ESTUDOS SUBROTINA + CREATE TXT FILE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.

       PROGRAM-ID. PROGPRINCIPAL.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT BOLETIM
               ASSIGN TO
                   'C:\Users\labolelli\Downloads\BOLETIM.txt'
                   ORGANIZATION IS LINE SEQUENTIAL
                   .
       DATA DIVISION.
       FILE SECTION.
       FD BOLETIM
       DATA RECORD IS BOLETIM-LINHA.
       01 BOLETIM-LINHA.
           03 F-CABECALHO      PIC X(34).
           03 F-NOME           PIC X(30).
           03 F-MATERIA        PIC X(30).
           03 F-MEDIA          PIC X(30).
           03 F-STATUS         PIC X(20).
           03 F-RODAPE         PIC X(34).
       WORKING-STORAGE SECTION.
       COPY INF-ALUNO.
       77 WS-SAIDA                 PIC A.
       77 WS-TXT                   PIC A VALUE 'S'.
       PROCEDURE DIVISION.

               PERFORM ALUNO UNTIL WS-TXT EQUAL 'N'.

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

           CALL 'SUBPROG'
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
               DISPLAY 'ALUNO INSERUDO NO TXT'
               OPEN OUTPUT BOLETIM

               MOVE '*** RESULTADO DO PROCESSAMENTO ***'
                   TO F-CABECALHO
               MOVE ' NOME DO ALUNO: '
                   TO F-NOME
               SET F-NOME(17:) TO WS-NOME-ALUNO
               MOVE 'MATERIA: '
                   TO F-MATERIA
               SET F-MATERIA(10:) TO WS-NOME-MATERIA
               MOVE 'MEDIA: '
                   TO F-MEDIA
               SET F-MEDIA(8:) TO MEDIATOTAL
               MOVE ' STATUS: '
                   TO F-STATUS
               SET F-STATUS(10:) TO WS-SITUACAO
               MOVE '**********************************'
                   TO F-RODAPE
               WRITE BOLETIM-LINHA
               CLOSE BOLETIM

               DISPLAY
                 'DESEJA PROCESSAR UM NOVO ALUNO ? '
                 'S PARA SIM OU N PARA NAO'
                   ACCEPT WS-SAIDA

               EVALUATE WS-SAIDA
                   WHEN 'S'
                       GO TO ALUNO
                   WHEN 'N'
                       DISPLAY 'O PROGRAMA SERA ENCERRADO'
                       STOP RUN

           ELSE
               DISPLAY
                 'DESEJA PROCESSAR UM NOVO ALUNO ? '
                 'S PARA SIM OU N PARA NAO'
                   ACCEPT WS-SAIDA

               EVALUATE WS-SAIDA
                   WHEN 'S'
                       GO TO ALUNO
                   WHEN 'N'
                       DISPLAY 'O PROGRAMA SERA ENCERRADO'
                       STOP RUN
           END-IF.

       P01-FIM.

       END PROGRAM PROGPRINCIPAL.
