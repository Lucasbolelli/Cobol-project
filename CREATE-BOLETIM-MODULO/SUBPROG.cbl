      ******************************************************************
      * Author: LUCAS BOLELLI
      * Date: 03/01/2024
      * Purpose: ESTUDOS SUBROTINA + CREATE TXT FILE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUBPROG.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
           COPY INF-ALUNO.
       PROCEDURE DIVISION USING WS-CAMPO-DE-MEDIAS.

       P100-INICIO.
           INITIALIZE WS-CAMPO-DE-MEDIAS
           PERFORM P500-MEDIAS
           PERFORM P550-CALC
           PERFORM P999-FIM.

       P020-ERROR.
               DISPLAY 'ERRO NAS INFORMACOES FORNECIDAS.'
               GOBACK.

       P500-MEDIAS.

           DISPLAY 'ENTRE COM A PRIMEIRA NOTA: '
               ACCEPT MEDIA1
           DISPLAY 'ENTRE COM A SEGUNDA NOTA: '
               ACCEPT MEDIA2
           DISPLAY 'ENTRE COM A TERCEIRA NOTA: '
               ACCEPT MEDIA3
           DISPLAY 'ENTRE COM A QUARTA NOTA: '
               ACCEPT MEDIA4



           IF MEDIA1 + MEDIA2  + MEDIA3 + MEDIA4 > 0 THEN
               GO TO P550-CALC
           ELSE
               DISPLAY '****ALUNO REPROVADO POR FALTA DE MEDIA****'
               PERFORM P020-ERROR
           END-IF.

       P550-CALC.
           COMPUTE
               MEDIATOTAL = (MEDIA1 + MEDIA2 + MEDIA3 + MEDIA4)/4
                             ON SIZE ERROR PERFORM P020-ERROR
           END-COMPUTE
           .

       P999-FIM.
            GOBACK.
