      ***************************************************************** *
       IDENTIFICATION DIVISION. 
      ******************************************************************
       PROGRAM-ID. DACSCLS1.
      ******************************************************************
      *  APPLICATION : DACSCLS1                                        *
      ******************************************************************
      *  PROGRAMME : DACSCLS1                                          *
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
       WORKING-STORAGE SECTION.
      ******************************************************************
       01 WVAR-IDENT-CGESLOGV.
           05 ID-SVN                   PIC X(255) VALUE
           '$ID$'.
       
      *--- CONSTANTES --------------------------------------------------
       77 C-PROG-NAME                  PIC X(8) VALUE 'DACSCLS1'.
       77 C-TABATFI                    PIC X(8) VALUE 'TABATFI'.
       77 C-SGFACONN                   PIC X(8) VALUE 'SGFACONN'.
       
       01 W-TAB-CLS.
          02 W-TAB-IND        PIC 9999 COMP.
          02 W-TAB-CODRET     PIC X(2).
          02 W-TAB-DATA     OCCURS 57.
            03 W-DEV        PIC X(3).
            03 W-FILLER-01  PIC X.
            03 W-CPTY       PIC X(8).
            03 W-FILLER-02  PIC X.
            03 W-LIBELLE    PIC X(47).
       
      *--- FLAGS -------------------------------------------------------
       01 FL-DISPLAY                   PIC X(2).
          88 FL-DISPLAY-OK                 VALUE '1'.
          88 FL-DISPLAY-KO                 VALUE '0'.
       
       01 FL-CTRL-DEV                   PIC X(2).
          88 FL-CTRL-DEV-OK                VALUE '1'.
          88 FL-CTRL-DEV-KO                VALUE '0'.
       
      *--- CODES FONCTIONS ACCESSEURS ----------------------------------
       01 W-COD-FCT                    PIC X(5).
          88 W-COD-FCT-S0500                VALUE 'S0500'.
       
      *--- COPYS -------------------------------------------------------
      *----- Paramètres SGFACONN (Connexion à la base de donnees)
           COPY CCONDBAV.
           COPY CGIDENVV.
      *----- Paramètres TABATFI (Accesseur F_TABLES)
           COPY LTABTFIE.
           COPY LTABTFIS.
           COPY CTABENVV.
       
       LINKAGE SECTION.
       01 XPM-PARAM.
         05 XPM-DEV-I      PIC X(3).
         05 XPM-CPTY-O      PIC X(8).
         05 XPM-LIBELLE-O   PIC X(47).
         05 XPM-CODRET-O    PIC X(2).
       
      ******************************************************************
       PROCEDURE DIVISION USING BY REFERENCE XPM-PARAM.
      ******************************************************************
       
           SET FL-DISPLAY-OK TO TRUE
      *    SET FL-DISPLAY-KO TO TRUE
       
           DISPLAY 'LCO - >>>>>>>> ENTREE dans dacscls1.cbl <<<<<<<<<<' 
       
           PERFORM 1000-INITIALISATION
           PERFORM 9999-FIN-PROG

           DISPLAY 'LCO - >>>>>>>> SORTIE de dacscls1.cbl <<<<<<<<<<'

           EXIT PROGRAM
           GOBACK
           .
       
      *-----------------------------------------------------------------
       1000-INITIALISATION SECTION.
      *-----------------------------------------------------------------
      *     DISPLAY '1000-INITIALISATION'
       
           MOVE 0 TO W-TAB-IND
       
      *--- Connexion à la base de donnee
       
      * LCO - !!!! Genere une ERREUR lors de l execution !!!!!
      * LCO - !!!! Genere une ERREUR lors de l execution !!!!!
      * LCO - !!!! Genere une ERREUR lors de l execution !!!!!
      *     PERFORM 1010-INIT-DB
       
           PERFORM 1100-TRAITEMENT
           .
       
      *-----------------------------------------------------------------
       1010-INIT-DB SECTION.
      *-----------------------------------------------------------------
      *     DISPLAY '1010-INIT-DB'
           PERFORM 9000-SGFACONN
      
           IF CCONDBAV-S-CODRET <> 0
             DISPLAY 'SECTION     : 1010-INIT-DB'
           ELSE
             DISPLAY '   Connection DB OK'
           END-IF
           .
       
      *-----------------------------------------------------------------
       1100-TRAITEMENT SECTION.
      *-----------------------------------------------------------------
      *     DISPLAY '1100-TRAITEMENT'
           PERFORM 9270-TABATFI-S0500
           
           MOVE LTABTFIS-S0500-TFI-VAL-4   TO W-TAB-DATA(1)
           MOVE LTABTFIS-S0500-TFI-VAL-5   TO W-TAB-DATA(2)
           MOVE LTABTFIS-S0500-TFI-VAL-6   TO W-TAB-DATA(3)
           MOVE LTABTFIS-S0500-TFI-VAL-7   TO W-TAB-DATA(4)
           MOVE LTABTFIS-S0500-TFI-VAL-8   TO W-TAB-DATA(5)
           MOVE LTABTFIS-S0500-TFI-VAL-9   TO W-TAB-DATA(6)
           MOVE LTABTFIS-S0500-TFI-VAL-10  TO W-TAB-DATA(7)
           MOVE LTABTFIS-S0500-TFI-VAL-11  TO W-TAB-DATA(8)
           MOVE LTABTFIS-S0500-TFI-VAL-12  TO W-TAB-DATA(9)
           MOVE LTABTFIS-S0500-TFI-VAL-13  TO W-TAB-DATA(10)
           MOVE LTABTFIS-S0500-TFI-VAL-14  TO W-TAB-DATA(11)
           MOVE LTABTFIS-S0500-TFI-VAL-15  TO W-TAB-DATA(12)
           MOVE LTABTFIS-S0500-TFI-VAL-16  TO W-TAB-DATA(13)
           MOVE LTABTFIS-S0500-TFI-VAL-17  TO W-TAB-DATA(14)
           MOVE LTABTFIS-S0500-TFI-VAL-18  TO W-TAB-DATA(15)
           MOVE LTABTFIS-S0500-TFI-VAL-19  TO W-TAB-DATA(16)
           MOVE LTABTFIS-S0500-TFI-VAL-20  TO W-TAB-DATA(17)
           MOVE LTABTFIS-S0500-TFI-VAL-21  TO W-TAB-DATA(18)
           MOVE LTABTFIS-S0500-TFI-VAL-22  TO W-TAB-DATA(19)
           MOVE LTABTFIS-S0500-TFI-VAL-23  TO W-TAB-DATA(20)
           MOVE LTABTFIS-S0500-TFI-VAL-24  TO W-TAB-DATA(21)
           MOVE LTABTFIS-S0500-TFI-VAL-25  TO W-TAB-DATA(22)
           MOVE LTABTFIS-S0500-TFI-VAL-26  TO W-TAB-DATA(23)
           MOVE LTABTFIS-S0500-TFI-VAL-27  TO W-TAB-DATA(24)
           MOVE LTABTFIS-S0500-TFI-VAL-28  TO W-TAB-DATA(25)
           MOVE LTABTFIS-S0500-TFI-VAL-29  TO W-TAB-DATA(26)
           MOVE LTABTFIS-S0500-TFI-VAL-30  TO W-TAB-DATA(27)
           MOVE LTABTFIS-S0500-TFI-VAL-31  TO W-TAB-DATA(28)
           MOVE LTABTFIS-S0500-TFI-VAL-32  TO W-TAB-DATA(29)
           MOVE LTABTFIS-S0500-TFI-VAL-33  TO W-TAB-DATA(30)
           MOVE LTABTFIS-S0500-TFI-VAL-34  TO W-TAB-DATA(31)
           MOVE LTABTFIS-S0500-TFI-VAL-35  TO W-TAB-DATA(32)
           MOVE LTABTFIS-S0500-TFI-VAL-36  TO W-TAB-DATA(33)
           MOVE LTABTFIS-S0500-TFI-VAL-37  TO W-TAB-DATA(34)
           MOVE LTABTFIS-S0500-TFI-VAL-38  TO W-TAB-DATA(35)
           MOVE LTABTFIS-S0500-TFI-VAL-39  TO W-TAB-DATA(36)
           MOVE LTABTFIS-S0500-TFI-VAL-40  TO W-TAB-DATA(37)
           MOVE LTABTFIS-S0500-TFI-VAL-41  TO W-TAB-DATA(38)
           MOVE LTABTFIS-S0500-TFI-VAL-42  TO W-TAB-DATA(39)
           MOVE LTABTFIS-S0500-TFI-VAL-43  TO W-TAB-DATA(40)
           MOVE LTABTFIS-S0500-TFI-VAL-44  TO W-TAB-DATA(41)
           MOVE LTABTFIS-S0500-TFI-VAL-45  TO W-TAB-DATA(42)
           MOVE LTABTFIS-S0500-TFI-VAL-46  TO W-TAB-DATA(43)
           MOVE LTABTFIS-S0500-TFI-VAL-47  TO W-TAB-DATA(44)
           MOVE LTABTFIS-S0500-TFI-VAL-48  TO W-TAB-DATA(45)
           MOVE LTABTFIS-S0500-TFI-VAL-49  TO W-TAB-DATA(46)
           MOVE LTABTFIS-S0500-TFI-VAL-50  TO W-TAB-DATA(47)
           MOVE LTABTFIS-S0500-TFI-VAL-51  TO W-TAB-DATA(48)
           MOVE LTABTFIS-S0500-TFI-VAL-52  TO W-TAB-DATA(49)
           MOVE LTABTFIS-S0500-TFI-VAL-53  TO W-TAB-DATA(50)
           MOVE LTABTFIS-S0500-TFI-VAL-54  TO W-TAB-DATA(51)
           MOVE LTABTFIS-S0500-TFI-VAL-55  TO W-TAB-DATA(52)
           MOVE LTABTFIS-S0500-TFI-VAL-56  TO W-TAB-DATA(53)
           MOVE LTABTFIS-S0500-TFI-VAL-57  TO W-TAB-DATA(54)
           MOVE LTABTFIS-S0500-TFI-VAL-58  TO W-TAB-DATA(55)
           MOVE LTABTFIS-S0500-TFI-VAL-59  TO W-TAB-DATA(56)
           MOVE LTABTFIS-S0500-TFI-VAL-60  TO W-TAB-DATA(57)
           
           PERFORM 6000-CTRL-DEV
           
           .
       
      *-----------------------------------------------------------------
       6000-CTRL-DEV SECTION.
      *-----------------------------------------------------------------
       
           SET FL-CTRL-DEV-KO  TO TRUE
       
           MOVE 1 TO W-TAB-IND
           PERFORM UNTIL W-TAB-IND > 57
             IF W-TAB-DATA(W-TAB-IND) <> ' '
      
                CONTINUE
      
      *         DISPLAY 'W-DEV : |' W-DEV(W-TAB-IND) '|'
      *         DISPLAY 'W-CPTY : |' W-CPTY(W-TAB-IND) '|'
      *         DISPLAY 'W-LIBELLE : |' W-LIBELLE(W-TAB-IND) '|'
      *         DISPLAY ' '
      
             END-IF
             
             IF W-DEV(W-TAB-IND) = XPM-DEV-I
               MOVE W-CPTY(W-TAB-IND)      TO XPM-CPTY-O
               MOVE W-LIBELLE(W-TAB-IND)   TO XPM-LIBELLE-O
               SET FL-CTRL-DEV-OK          TO TRUE
             END-IF
       
             ADD 1 TO W-TAB-IND
           END-PERFORM
       
           IF FL-CTRL-DEV-OK
             MOVE 0 TO XPM-CODRET-O
           ELSE
             MOVE 8 TO XPM-CODRET-O
           END-IF
           .
       
      *-----------------------------------------------------------------
       9000-SGFACONN SECTION.
      *-----------------------------------------------------------------
      *--- Connexion à la base de donnees  
      *     DISPLAY '9000-SGFACONN'
           CALL C-SGFACONN USING CCONDBAV
       
           IF CCONDBAV-S-CODRET > CGIDENVV-CODRET 
              MOVE CCONDBAV-S-CODRET   TO CGIDENVV-CODRET
           END-IF
           .
       
      *-----------------------------------------------------------------
       9270-TABATFI-S0500 SECTION.
      *-----------------------------------------------------------------
      *     DISPLAY '9270-TABATFI-S0500'
           INITIALIZE LTABTFIE LTABTFIS CTABENVV
       
           SET CTABENVV-INTLECREC  TO TRUE
           SET W-COD-FCT-S0500     TO TRUE
           MOVE W-COD-FCT          TO CTABENVV-FCTTAB-CODTEC
           MOVE 'SREGL'            TO LTABTFIE-S0500-TFI-NOM
           MOVE 'CL'               TO LTABTFIE-S0500-TFI-CLE
       
           CALL C-TABATFI USING LTABTFIE LTABTFIS CTABENVV
           
           IF CTABENVV-CODRET NOT = 0
              DISPLAY  'ERREUR RECHERCHE F_TABLE : CODE RETOUR = ' 
                       CTABENVV-CODRET
                       ' | SQL CODE : '
                       CTABENVV-CODSQL
           END-IF
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
       
       END PROGRAM DACSCLS1.