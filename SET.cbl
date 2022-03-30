      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 27/03/2022
      * Purpose: TREINAMENTO DE SET
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 NUM1         PIC 99 VALUE 0.
       77 NUM2         PIC 99 VALUE 0.
       01 CAGUEI       PIC X VALUE 'N'.
          88 HOJE       VALUE 'S' FALSE 'N'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *>       SET = É USADO NO BOOLEAN

      *>      SET NUM1        TO 0
      *>      SET NUM2        TO 0

      *>          DISPLAY "ANTES DE SETAR NUM1: " NUM1
      *>          SET NUM1        TO 4
      *>          DISPLAY NUM1

      *>          DISPLAY "ANTES DE SETAR NUM2: " NUM2
      *>          SET NUM2        TO 5
      *>          DISPLAY NUM2
               DISPLAY 'SITUAÇÃO DO ESTOMAGO : ' CAGUEI
               SET HOJE                     TO TRUE
               DISPLAY 'NOVA SITUAÇÃO DO ESTOMAGO: ' CAGUEI
               SET HOJE                     TO FALSE
               DISPLAY 'É HOJE EU NÃO CAGUEI: ' CAGUEI
               .


            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
