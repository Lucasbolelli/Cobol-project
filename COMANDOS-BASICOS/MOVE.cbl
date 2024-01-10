      ******************************************************************
      * Author:LUCAS BOLELLI
      * Date: 22/03/2022
      * Purpose: ESTUDAR MOVE
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 DT               PIC X(8).
       77 PAD              PIC X(10).
       PROCEDURE DIVISION.

      *>          MOVE '22'       TO DT(1:2)
      *>          MOVE '/'        TO DT(3:1)
      *>          MOVE '03'       TO DT(4:2)
      *>          MOVE '/'        TO DT(6:1)
      *>          MOVE '2022'     TO DT(7:4)
      *>          .

      *>          DISPLAY DT.

               ACCEPT DT FROM DATE YYYYMMDD


               IF DT < 8 THEN
                   MOVE DT(1:4)     TO PAD (1:4)
                   MOVE '/'         TO PAD (5:1)
                   MOVE DT(5:2)     TO PAD (6:2)
                   MOVE '/'         TO PAD (8:1)
                   MOVE DT          TO PAD (9:2)
                   DISPLAY PAD.

           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
