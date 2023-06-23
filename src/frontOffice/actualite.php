<?php
session_start();

require('../../lib/bdd.php');
require('../../config/config.php');
    
const LAYOUT = "actualite";
    
//Connexion à la BDD
$dbh = dbConnexion();

//Requête pour afficher les 4 dernières actualités  
$actualities = dbSelectAll($dbh, "SELECT *
                                FROM actualities
                                    ORDER BY `act_id` DESC
                                LIMIT 6"); 

//Pour servir le design à l'affichage de l'interface client                        
$actualitie1 = $actualities[0];
$actualitie2 = $actualities[1];
$actualitie3 = $actualities[2];
$actualitie4 = $actualities[3];

include('../../views/frontOffice/'. LAYOUT . '.phtml');