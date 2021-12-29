<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>{TITRE_PAGE}</title>
        <script language="javascript" SRC="../../../../include/script/action_tableau.js"></script>
        <script language="javascript" SRC="../../../../include/script/action_accueil.js"></script>
         <link rel="stylesheet" type="text/css" href="../../../../include/style/style.css"> 
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .table_groupe_isgroup_o {
            margin-left: 12px;
            }

            .table_groupe_isgroup_n {
            margin-left: 0px;
            }
            
          
           li{
                float:left;
                width:25%;
             }

            ul {
                list-style-type: none;
            }

                li:nth-child(4n+1):nth-last-child(-n+4),
                li:nth-child(4n+1):nth-last-child(-n+4) ~ li {
                border:none;
            }
 	  </style>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
          <script type="text/javaScript">
	var set_reload_bal = "{SET_RELOAD_BAL}";
	</script>
    <script language="javascript">
            var i=0;
            var tabBal = new Array();
            var tabBalhtmlEncode = new Array();
            var tabIfBalOpen = new Array();
            var tabBalIcone = new Array();
            var tabNbRepBal = new Array();
            <!-- BEGIN BLOC_NOM_BAL -->
            tabBal[i]="{SZ_CODE_BAL}";
            tabBalhtmlEncode[i]="{SZ_CODE_BAL_HTML_ENCODE}";
            tabBalIcone[i] = "{ICONE_BAL}";
            tabNbRepBal[i] = -1;
            tabIfBalOpen[i++]={BAL_OPEN};
            <!-- END BLOC_NOM_BAL -->


        function onConsulterIndex(iNumDoc)
        {
            var szUrl = "../consultation/consulter_index.php?MODE=CONSULTATION&POS_NUM_DOC=" +iNumDoc;
            //parent.posdocument.document.location.href = szUrl;
            //parent.basculerEcran('posdocument');
            parent.center.document.location.href = szUrl;
            parent.basculerEcran('center');

        }

        function onAfficherQuestion(szCodeQuestion)
        {
            var szUrl = document.principal.URL_RESULTAT.value;
            var szUrlAttente = document.principal.URL_ATTENTE.value;
            // NB : il y a un & plutot qu'un "?" car l'url est passe en parametre de l'ecran d'attente.
            szUrl += "&TYPE_RECHERCHE=RECHERCHE_BIB&POS_QUEST_PUBLIC=1&POS_QUEST_NOM=" + escape(szCodeQuestion);
            parent.center.location.href = szUrlAttente + "?URL="+ szUrl;
            parent.basculerEcran('center');
        }

        </script>
    </head>

    <body topmargin="0" leftmargin="0" onLoad="javascript:initEcranAccueil();">
        
         <!--bloc_1-->
     <h1>
        <!-- {LIBELLE_BIENVENUE_ACCUEIL} --> MES ACTIONS    
    </h1>
    <form name="principal">
        <input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
        <input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}">
        <input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
        <input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
    </form>
   
  
       <!--bloc_2-->
      <!-- BEGIN BLOC_BAL -->
        <div class='box'>
                <div class='title'>
                    <h2>
                        <!--{POS_BAL_ENTETE}--> Rafraichir les actions &nbsp;&nbsp;<A
                            HREF="{URL_RAFRAICHISSEMENT_BAL}" title="{NOTE_RAFRAICHISSEMENT_BAL}"><IMG
                                SRC="/{NOM_APPLICATION}/images/icons/actualise.png" border=0
                                alt="{NOTE_RAFRAICHISSEMENT_BAL}"></A>
                    </h2>
        </div>
                     
        <ul  style='list-style: none;'>
            <!-- BEGIN GROUPE_BAL -->
                    
                    <!-- BEGIN BAL_SEULE -->
                        <li id="td_bal{ICPTBAL}">
                        <a title="{POS_BAL_LIBELLE_COMMENT}"
                               href="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');"   >
                                <IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}"
                                border="0" alt=""   >
                            <span id="bal{ICPTBAL}">({POS_BAL_NB_REP})</span> 
                            <span style="{STYLE_BAL}">{POS_BAL_LIBELLE}</span>
                            <span class='tab_puce'>  </span>

                        </a>
                    </li>  

                    <script>

                      
                        </script>


                    
                    <!-- END BAL_SEULE -->
            <!-- END GROUPE_BAL -->
        </ul>
               
		<!-- END BLOC_BAL -->

        <!--bloc_3-->
        <!-- BEGIN BLOC_CHANGE_PROFIL -->
			<!-- BEGIN LISTE_PROFIL -->
			<!-- END LISTE_PROFIL -->
		<!-- END BLOC_CHANGE_PROFIL -->
   
        <!--bloc_4-->
        <!-- BEGIN BLOC_BIBLIO -->
                <!-- BEGIN BLOC_BIBLIO_PUB -->
                
                    <!-- BEGIN BIBLIO_PUB -->
                        
                    <!-- END BIBLIO_PUB -->
            
                <!-- END BLOC_BIBLIO_PUB -->
                <!-- BEGIN BLOC_BIBLIO_PRIV -->
                
                    <!-- BEGIN BIBLIO_PRIV -->
                
                    <!-- END BIBLIO_PRIV -->
                    
                <!-- END BLOC_BIBLIO_PRIV -->
		<!-- END BLOC_BIBLIO -->
     
         <!--bloc_5-->
         <!-- BEGIN BLOC_AFFICHER_QUESTION -->
         
                <!-- BEGIN ENTETE -->
                <!-- END ENTETE -->
                <!-- BEGIN LISTE_REPONSES -->
                    <!-- BEGIN LR_REPONSE -->
                    <!-- END LR_REPONSE -->
                
                <!-- END LISTE_REPONSES -->
         
        <!-- END BLOC_AFFICHER_QUESTION -->

    </body>

    
</html>