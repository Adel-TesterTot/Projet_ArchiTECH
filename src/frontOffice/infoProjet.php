<?php
session_start();

require('../../lib/bdd.php');
require('../../config/config.php');

const LAYOUT = "infoProjet";

$errors = [];//tableau des erreurs 

if(!isset($_GET['id'])) {
    header("Location: index.php");
    exit();
}

$idProjet = $_GET['id'];

//Connexion a la BDD
$dbh = dbConnexion();

//Requête pour afficher le projet de la table 'projets' 
$Projet = dbSelectOne($dbh ,"SELECT projets.*, category.cat_title, category.cat_description
                        FROM `projets`
                            JOIN `category`
                        ON projets.pro_category = category.cat_id   
                            WHERE `pro_id` = :id", ['id' => $idProjet]);

//Requête pour afficher pour chaque projet une image principale de la réalisation et rand_array() pour afficher 3 photos aléatoires parmi les photos de chaque projet a chaque actualisation de la page
$photos = dbSelectAll($dbh, "SELECT photos.*, photos.photo_name
                                FROM `photos`
                                    JOIN `projets`
            	                ON photos.photo_projet = projets.pro_id 
                                    WHERE `pro_id` = :id", ['id' => $idProjet]); 

//Affichage aléatoire des photos projet dans slider 

if(!isset($photo1) && !isset($photo2) && !isset($photo3)) {
    $photo1 = $photos[0];
    $photo2 = $photos[1];
    $photo3 = $photos[2];
}

include('../../views/frontOffice/'. LAYOUT . '.phtml');
