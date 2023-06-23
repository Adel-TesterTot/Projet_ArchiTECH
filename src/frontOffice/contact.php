<?php
session_start();

require('../../lib/bdd.php');
require('../../config/config.php');

const LAYOUT = "contact";

$errors = [];// table errors
$valids = [];// table valids 


//Gestion des RDV avec min, max pour pouvoir prendre un rendez vous :
$dt = new DateTime();
$dt= $dt->format('Y-m-d\TH:i'); 

//La date minimale disponible de prendre rendez-vous 
$dt_min = new DateTime('+5 days');
$dt_min= $dt_min->format('Y-m-d\TH:i'); 

//La date maximale autorisé de 2 mois et 10 jours pour prendre rendez-vous
$dt_max = new  DateTime('+2 month 10 days');  
$dt_max= $dt_max->format('Y-m-d\TH:i'); 

//Empty Form 
$addcontact = [
                'addNom'                => '',
                'addPrenom'             => '',
                'addEmail'              => '',
                'addDate'               => '',
                'addMessage'            => ''
            ];
              
try{
    
    if(array_key_exists('rdv_name', $_POST) && 
        array_key_exists('rdv_lastName', $_POST) &&
        array_key_exists('rdv_mail', $_POST) &&
        array_key_exists('rdv_date', $_POST) &&
        array_key_exists('rdv_message', $_POST)){
         
        $addcontact = [
                        'addNom'                => htmlspecialchars(trim(strtoupper($_POST['rdv_name']))),
                        'addPrenom'             => htmlspecialchars(trim(ucfirst($_POST['rdv_lastName']))),
                        'addEmail'              => htmlspecialchars(trim(strtolower($_POST['rdv_mail']))),
                        'addDate'               => htmlspecialchars(trim($_POST['rdv_date'])),
                        'addMessage'            => htmlspecialchars(trim($_POST['rdv_message']))
                    ];
                    
        if($addcontact['addNom'] == '') 
            $errors[] = "Veuillez remplir le champ <span>'Nom' !</span>";
    
        if($addcontact['addPrenom'] == '')
            $errors[] = "Veuillez remplir le champ <span>'Prénom' !</span>";
            
        if(!filter_var($addcontact['addEmail'], FILTER_VALIDATE_EMAIL))
            $errors[] =  'Veuillez renseigner un <span>email valide SVP !</span>'; 

        if($addcontact['addDate'] == '') 
            $errors[] = "Veuillez remplir le champ <span>'Date' !</span>";    
            
        if($addcontact['addMessage'] == '') 
            $errors[] = "Veuillez remplir le champ <span>'Message' !</span>";

        if(count($errors) == 0) {
            
            //Connexion à la BDD
            $dbh = dbConnexion();
            
            //Requête pour insérer les informations du RDV 
            $sth = $dbh->prepare("INSERT INTO `rdv` (
                                                    app_name,
                                                    app_lastname,
                                                    app_mail,
                                                    app_date,
                                                    app_message
                                                    
                                                    ) 
                                            VALUES ( 
                                                    :name,
                                                    :lastname,
                                                    :mail,
                                                    :date,
                                                    :message
                                                    
                                                    )");
            //Bind les informations du RDV
            $sth->bindValue('name', $addcontact['addNom'], PDO::PARAM_STR);
            $sth->bindValue('lastname', $addcontact['addPrenom'], PDO::PARAM_STR);
            $sth->bindValue('mail', $addcontact['addEmail'], PDO::PARAM_STR);
            $sth->bindValue('date', $addcontact['addDate'], PDO::PARAM_STR);
            $sth->bindValue('message', $addcontact['addMessage'], PDO::PARAM_STR);
            // execute the insert into  
            $sth->execute();
            
            $valids[] = "Votre demande a bien été transmise";
            
            //Another add of informations after previous user
            $addcontact = [
                            'addNom'                => '',
                            'addPrenom'             => '',
                            'addEmail'              => '',
                            'addDate'               => '',
                            'addMessage'            => ''
                            ];
        }
    }
}  

//Display error if try doesn't work 
catch(PDOException $e) {
    $view = 'error';
    $errors[] = 'Une erreur de connexion a eu lieu :'.$e->getMessage();
} 

include('../../views/frontOffice/'. LAYOUT . '.phtml');
    