      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-CONTADOR-1              PIC 99.
       77 WS-CONTADOR-2              PIC 99.
       77 WS-CONTADOR-3              PIC 99.
       COPY 'CADASTRO-PF'.
       PROCEDURE DIVISION.
            MOVE 'MARIA'          TO      WS-PRIMEIRO-NOME
            MOVE 'CAMPOS'         TO      WS-SEGUNDO-NOME
            MOVE '5511996225542'  TO      WS-TELEFONE
            MOVE 'RUA DEZ, 03'    TO      WS-RUA
            MOVE 'SAO JOSE'       TO      WS-BAIRRO
            MOVE 'SAO PAULO'      TO      WS-CIDADE
            MOVE 'SP'             TO      WS-UF
            MOVE '0112002'        TO      WS-CEP
            MOVE 'BRASILEIRA'     TO      WS-NACIONALIDADE
            MOVE 'ENFERMEIRA'     TO      WS-PROFISSAO


            MOVE ZEROS TO  WS-CONTADOR-1
            INSPECT FUNCTION REVERSE(WS-PRIMEIRO-NOME)
                TALLYING WS-CONTADOR-1 FOR LEADING ' '

            DISPLAY '1 - NOME COMPLETO: ' WS-PRIMEIRO-NOME
               (1:(FUNCTION LENGTH(WS-PRIMEIRO-NOME) - WS-CONTADOR-1))
                                           ' '
                                           WS-SEGUNDO-NOME

            DISPLAY '2 - TELEFONE.....: ' '+', WS-PAIS,
                                          '(', WS-DDD, ')',
                                           WS-PREFIXO, '-', WS-SUFIXO

            MOVE ZEROS TO  WS-CONTADOR-1
            INSPECT FUNCTION REVERSE(WS-RUA)
                TALLYING WS-CONTADOR-1 FOR LEADING ' '

            MOVE ZEROS TO  WS-CONTADOR-2
            INSPECT FUNCTION REVERSE(WS-CIDADE)
                TALLYING WS-CONTADOR-2 FOR LEADING ' '

            MOVE ZEROS TO  WS-CONTADOR-3
            INSPECT FUNCTION REVERSE(WS-BAIRRO)
                TALLYING WS-CONTADOR-3 FOR LEADING ' '

            DISPLAY '03 - ENDERECO.....: ' WS-RUA
                       (1:(FUNCTION LENGTH(WS-RUA) - WS-CONTADOR-1)),
                                            ' ',
                                           WS-BAIRRO
                       (1:(FUNCTION LENGTH(WS-BAIRRO) - WS-CONTADOR-3)),
                                            ' ',
                                           WS-CIDADE
                       (1:(FUNCTION LENGTH(WS-CIDADE) - WS-CONTADOR-2)),
                                            ' ',
                                            WS-UF,
                                            ' ',
                       FUNCTION CONCATENATE('CEP: ', WS-CEP-1 '-',
                                             WS-CEP-2)



            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
