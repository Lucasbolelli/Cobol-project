      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 21/06/2021
      * Purpose: DESAFIO MÓDULO 2
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DESAFIO2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 DATA-H.
           03 ANO-AT               PIC 9(04).
           03 MES-AT               PIC 9(02).
           03 DIA-AT               PIC 9(02).

       01 CAMPO-DE-NOMES.
           03 NOME-ALUNO               PIC X(20).
           03 CAMPO-DE-MATERIAS        PIC X(20).

       01 CAMPO-DE-MEDIAS.
           03 MEDIA1               PIC 9(02).
           03 MEDIA2               PIC 9(02).
           03 MEDIA3               PIC 9(02).
           03 MEDIA4               PIC 9(02).
           03 MEDIATOTAL           PIC 9(02).

       PROCEDURE DIVISION.



           DISPLAY 'NOME DO ALUNO'
                   ACCEPT NOME-ALUNO
           DISPLAY 'MÁTERIA'
                   ACCEPT CAMPO-DE-MATERIAS



           PERFORM S1
           PERFORM S2.


       S1 SECTION.

           CALL 'C:\Users\User\DESAFIOCALC.cbl'
                                       USING CAMPO-DE-MEDIAS




           DISPLAY 'MEDIA 1º BIM: ' MEDIA1
           DISPLAY 'MEDIA 2º BIM: ' MEDIA2
           DISPLAY 'MEDIA 3º BIM: ' MEDIA3
           DISPLAY 'MEDIA 4º BIM: ' MEDIA4
           DISPLAY 'MEDIA TOTAL: '  MEDIATOTAL



           .

       S2 SECTION.
           IF MEDIATOTAL LESS 7
           ACCEPT DATA-H FROM DATE YYYYMMDD
           DISPLAY 'DIA: ' ANO-AT '/' MES-AT '/' DIA-AT
           DISPLAY 'NOME DO ALUNO: ' NOME-ALUNO
           DISPLAY 'MÁTERIA: ' CAMPO-DE-MATERIAS
           DISPLAY 'MEDIA' MEDIATOTAL
           DISPLAY 'REPROVADO'

            ELSE


           ACCEPT DATA-H FROM DATE YYYYMMDD
           DISPLAY 'DIA: ' ANO-AT '/' MES-AT '/' DIA-AT
           DISPLAY 'NOME DO ALUNO: ' NOME-ALUNO
           DISPLAY 'MÁTERIA: ' CAMPO-DE-MATERIAS
           DISPLAY 'MEDIA' MEDIATOTAL
           DISPLAY 'APROVADO'



            STOP RUN.
       END PROGRAM DESAFIO2.
