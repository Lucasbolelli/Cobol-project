      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 21/06/2021
      * Purpose: BOLETIM
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DESAFIOCALC.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 CAMPO-DE-MEDIAS.
           03 MEDIA1               PIC 9(02).
           03 MEDIA2               PIC 9(02).
           03 MEDIA3               PIC 9(02).
           03 MEDIA4               PIC 9(02).
           03 TOTALMED             PIC 9(02).
       PROCEDURE DIVISION USING CAMPO-DE-MEDIAS.

       P100-INICIO.
           INITIALIZE CAMPO-DE-MEDIAS
           PERFORM P500-MEDIAS
           PERFORM P550-CALC
           PERFORM P999-FIM.

       P020-ERROR.
               DISPLAY 'ERRO NAS INFORMACOES FORNECIDAS.'
               STOP RUN.

       P500-MEDIAS.

           DISPLAY 'ENTRE COM A PRIMEIRA NOTA: '
           ACCEPT MEDIA1
           IF MEDIA1 NOT GREATER 10 THEN CONTINUE
               ELSE
                   PERFORM P020-ERROR
           END-IF.

            DISPLAY 'ENTRE COM A SEGUNDA NOTA: '
           ACCEPT MEDIA2
           IF MEDIA2 NOT GREATER 10 THEN CONTINUE
               ELSE
                   PERFORM P020-ERROR
           END-IF.

            DISPLAY 'ENTRE COM A TERCEIRA NOTA: '
           ACCEPT MEDIA3
           IF MEDIA3 NOT GREATER 10 THEN CONTINUE
               ELSE
                   PERFORM P020-ERROR
           END-IF.

            DISPLAY 'ENTRE COM A QUARTA NOTA: '
           ACCEPT MEDIA4
           IF MEDIA4 > 0 THEN GO TO P550-CALC
               ELSE
                   PERFORM P020-ERROR
           END-IF.

       P550-CALC.
           IF CAMPO-DE-MEDIAS NOT GREATER 10 THEN
           COMPUTE
               TOTALMED = (MEDIA1 + MEDIA2 + MEDIA3 + MEDIA4)/4
                             ON SIZE ERROR PERFORM P020-ERROR
           END-COMPUTE
           END-IF.
       P999-FIM.


            GOBACK.
