<?php
session_start();

require('../../lib/bdd.php');
require('../../config/config.php');
    
const LAYOUT = "projets";
    
//Connexion à la BDD
$dbh = dbConnexion();

//Requête pour chercher les projets à afficher selon le click dans la page projets.php
$sql = "SELECT projets.*, category.cat_id
                        FROM `projets`
	                        JOIN `category`
                        ON projets.pro_category = category.cat_id"; 

$catProjets = dbSelectAll($dbh, $sql);

include('../../views/frontOffice/'. LAYOUT . '.phtml');
     
