<?php
session_start();

require('../../lib/bdd.php');
require('../../config/config.php');

//Récupérer le param envoyé via la requete Ajax 
if(array_key_exists('param',$_GET)){ 
    $nom = $_GET['param'];
}

try{
    
    //Connexion à la BDD
    $bdd= dbConnexion();

    //Préparer la requête 
    $query = $bdd -> prepare("SELECT `pro_id`, `pro_title`, `img_name`
                                FROM `projets`
    	                            WHERE `pro_title` LIKE ?");
    //Exécuter la requete 
    $query -> execute([$nom.'%']);
    
    //la liste de touts les projets 
    $oneProjet = $query -> fetchAll();
    
    //Envoyer la liste des projets vers l'appel ajax 
    echo json_encode($oneProjet);//tableau php --> json 
}

catch (Exception $e){
    die('Erreur:'.$e->getMessage());
}