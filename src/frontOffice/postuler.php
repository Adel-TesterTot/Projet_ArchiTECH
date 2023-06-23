<?php
session_start();

require('../../lib/bdd.php');
require('../../config/config.php');
    
const LAYOUT = "postuler";
    
//Connexion à la BDD
$dbh = dbConnexion();
   
//Requête sur la table postes pour afficher tous les postes disponible :
$jobs = dbSelectAll($dbh, "SELECT postes.*, category.cat_id, category.cat_img
                FROM `postes`
	            JOIN `category`
                    ON postes.post_category = category.cat_id
                ORDER BY `post_id` ASC"); 

$errors = [];//Stocker la liste des erreurs commises dans le remplissage du formulaire
$valids = [];//Stocker le ou les messages de validation

$addCv = [
            'addNom'                => '',
            'addPrenom'             => '',
            'addDoc'                => '',
            'addPoste'              => ''
        ];
        
try{
    
    if(array_key_exists('cv_lastname', $_POST) &&
        array_key_exists('cv_firstname', $_POST) &&
        array_key_exists('cv_poste', $_POST)){
         
        $addCv = [
                    'addNom'        => htmlspecialchars(trim(strtoupper($_POST['cv_lastname']))),
                    'addPrenom'     => htmlspecialchars(trim(ucfirst($_POST['cv_firstname']))),
                    'addDoc'        => '',
                    'addPoste'      => htmlspecialchars(trim($_POST['cv_poste']))
                ];  
        
        if($addCv['addNom'] == '') 
            $errors[] = "Veuillez remplir le champ<span> 'Nom' !</span> ";
    
        if($addCv['addPrenom'] == '')
            $errors[] = "Veuillez remplir le champ <span> 'Prénom' !</span> ";
            
        if($addCv['addPoste'] == 'error' || $addCv['addPoste'] == '')
            $errors[] = "Veuillez choisir un <span> 'poste' !</span> ";

        if(count($errors) == 0) {
            
            // Enregistrer les données
            if(isset($_FILES['cv_doc']) &&  $_FILES['cv_doc']['name'] !== '' ){
                $addCv['addDoc'] = uploadFile($_FILES['cv_doc'], $errors, UPLOADS_DIR.'uploads/fichier_cv/', FILE_EXT_DOC);
            }

            // Enregistrer les données
            $sth = $dbh->prepare("INSERT INTO `cv` (
                                                    cv_lastname,
                                                    cv_firstname,
                                                    cv_doc,
                                                    cv_poste
                                                    ) 
                                    VALUES ( 
                                            :lastname,
                                            :firstname,
                                            :document,
                                            :poste
                                             )");
                                             
            $sth->bindValue('lastname', $addCv['addNom'], PDO::PARAM_STR);
            $sth->bindValue('firstname', $addCv['addPrenom'], PDO::PARAM_STR);
            $sth->bindValue('document', $addCv['addDoc'], PDO::PARAM_STR);
            $sth->bindValue('poste', $addCv['addPoste'], PDO::PARAM_STR);

            //Execute la requete UPDATE    
            $sth->execute();
            
            $valids[] = "Votre candidature a bien été transmise.";

            $addCv = [
                        'addNom'                => '',
                        'addPrenom'             => '',
                        'addDoc'                => '',
                        'addPoste'              => ''
                    ];
        }
    }
}
catch(PDOException $e)
{
    $view = 'error';
    $errors[] = 'Une erreur de connexion a eu lieu :'.$e->getMessage();
}

include('../../views/frontOffice/'. LAYOUT . '.phtml');
     
