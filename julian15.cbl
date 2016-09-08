      ***************************************************************** *
       IDENTIFICATION DIVISION. 
      ******************************************************************
       PROGRAM-ID. JULIAN15.
      ******************************************************************
      *  APPLICATION : JULIAN15                                        *
      ******************************************************************
      *  PROGRAMME : JULIAN15                                          *
      *                                                                *
      *  Date de creation : 02/08/2016                                 *
      *  Auteur : JGO                                                  *
      *                                                                *
      *  Description :                                                 *
      ******************************************************************
      *                                                                *
      ******************************************************************
      *  COMMENTAIRES                                                  *
      ******************************************************************
      *                   M O D I F I C A T I O N S                    *
      *                   =========================                    *
      *  Date       User Libelle                                       *
      *  jj/mm/ssaa xxx  xxxxxxxxxxxxxxxxxxxxxxxx                      *
      *                                                                *
      ******************************************************************
       
      ******************************************************************
       ENVIRONMENT DIVISION.
      ******************************************************************
      *-----------------------------------------------------------------
       INPUT-OUTPUT SECTION.
      *-----------------------------------------------------------------
       
      ******************************************************************
       DATA DIVISION.
      ******************************************************************
      ******************************************************************
       FILE SECTION.
      ******************************************************************
       
      ******************************************************************
       WORKING-STORAGE SECTION.
      ******************************************************************
       01 WVAR-IDENT-CGESLOGV.
           05 ID-SVN                   PIC X(255) VALUE
           '$ID$'.
       
      *--- CONSTANTES --------------------------------------------------
       77 C-PROG-NAME                  PIC X(8) VALUE 'DACSCLS1'.
       
      *--- FLAGS -------------------------------------------------------
       01 FL-DISPLAY                   PIC X(2).
          88 FL-DISPLAY-OK                 VALUE '1'.
          88 FL-DISPLAY-KO                 VALUE '0'.
       
      *--- WORK VARIABLES ----------------------------------------------
       
       01 XPM-PARAM.
         05 XPM-DEV       PIC X(3).
         05 XPM-CPTY      PIC X(8).
         05 XPM-LIBELLE   PIC X(47).
         05 XPM-CODRET    PIC X(2).
       
      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************
       
           SET FL-DISPLAY-OK TO TRUE
      *    SET FL-DISPLAY-KO TO TRUE
       
           PERFORM 1000-INITIALISATION
           PERFORM 9999-FIN-PROG
           EXIT PROGRAM
           GOBACK
           .
       
      *-----------------------------------------------------------------
       1000-INITIALISATION SECTION.
      *-----------------------------------------------------------------
           DISPLAY '1000-INITIALISATION'
       
           PERFORM 1100-TRAITEMENT
           .
       

      *-----------------------------------------------------------------
       1100-TRAITEMENT SECTION.
      *-----------------------------------------------------------------
           DISPLAY '1100-TRAITEMENT'
           PERFORM 9000-JULIAN14
           .
       
      *-----------------------------------------------------------------
       9000-JULIAN14 SECTION.
      *-----------------------------------------------------------------
      * Validite et decodage d'un numero de compte IBAN
           DISPLAY '9000-JULIAN14'
           INITIALIZE XPM-PARAM
       
           MOVE 'AUD'        TO XPM-DEV
           DISPLAY 'W-DEV : ' XPM-DEV
       
           CALL C-PROG-NAME USING BY REFERENCE XPM-PARAM
           
           DISPLAY 'APRES APPEL : '
           DISPLAY 'XPM-PARAM : ' XPM-PARAM
           DISPLAY 'XPM-DEV : ' XPM-DEV
           DISPLAY 'XPM-CPTY : ' XPM-CPTY
           DISPLAY 'XPM-LIBELLE : ' XPM-LIBELLE
           DISPLAY 'XPM-CODRET : ' XPM-CODRET
       
           IF XPM-CODRET = '0'
             DISPLAY 'OK'
           ELSE
             DISPLAY 'NOK'
           END-IF
           EXIT
           .
       
      *-----------------------------------------------------------------
       9900-ARRET-PROG SECTION.
      *-----------------------------------------------------------------
      *--- Plantage provoque
           DISPLAY '9900-ARRET-PROG'
       
           GOBACK
           .
      
      *-----------------------------------------------------------------
       9999-FIN-PROG SECTION.
      *-----------------------------------------------------------------
       
           .
       
       END PROGRAM JULIAN15.