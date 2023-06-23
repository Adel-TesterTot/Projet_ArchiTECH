'use strict';
console.clear();
/* *************************
 * Requete AJAX pour affiner
 * la recherche des projets
 * ***********************/

/**
  * Génère un projet saisi dans le champs recherche
  * de la bdd
  * @param oneProjet - un seul projet
  * @return - projet 
  */
function afficherOneProjet(oneProjet){
    
    //Vider la div d'affichage 
    $("#divAjax").empty();
    for(let i=0;i<oneProjet.length;i++){
        if($('#nomProjet').val() == '') {
            $("#divAjax").empty();   
        }
        else {
            $("#divAjax").append("<li><a href='infoProjet.php?id="+oneProjet[i]["pro_id"]+"'><img alt='image resultat de recherche' src='../../assets/images/image_principale/"+oneProjet[i]["img_name"]+"'>"+oneProjet[i]["pro_title"]+"<a/></li>")
        }
    }
}

/**
  * Fonction qui gère l'affichage de projet
  * selon son titre
  * @param {void}
  */
function onSaisiAjax(){
    
    let nom = $('#nomProjet').val();
    $.getJSON("oneProjet.php","param="+nom,afficherOneProjet);
    
}

/** Code principale **/ 
$(function(){
    $("#nomProjet").on("input",onSaisiAjax);
})
