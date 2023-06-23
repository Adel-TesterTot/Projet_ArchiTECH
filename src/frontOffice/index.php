<?php
session_start();

require('../../lib/bdd.php');
require('../../config/config.php');
    
const LAYOUT = "home";
    
//Connexion à la BDD : adelrahim_ArchiTEC
$dbh = dbConnexion();

//Requête pour récupérer tous les projets et rand_array() pour afficher 3 projets aléatoires de tous les projets de la BDD à chaque actualisation de la page
$accueils = dbSelectAll($dbh,"SELECT projets.*, category.cat_id
                        FROM projets
	                        JOIN category
                        ON projets.pro_category = category.cat_id"); 

$rand_keys = array_rand($accueils, 3);

//Pour afficher un slider de 3 images
$accueil1 = $accueils[$rand_keys[0]];
$accueil2 = $accueils[$rand_keys[1]];
$accueil3 = $accueils[$rand_keys[2]];

//Requête pour récupérer 1 seul projet de chaque catégorie et ce sera le dernier projet ajouté (le projet qui a l'id le plus grand)
$Projets = dbSelectAll($dbh, "SELECT projets.*, category.cat_id
                        FROM `projets`
	                        JOIN `category`
                        ON projets.pro_category = category.cat_id
                            WHERE `pro_id` IN (SELECT MAX(`pro_id`) FROM projets GROUP BY `pro_category`)
                        ORDER BY `cat_id` ASC"); 

include('../../views/frontOffice/'. LAYOUT . '.phtml');
     

     
     
