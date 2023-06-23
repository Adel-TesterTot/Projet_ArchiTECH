<?php

// Constante contenant le titre de mon site
define("TITLE", 'Solution ArchiTEC');

// Constante contenant le titre du backOffice
define("TITLE_BACK", 'Bienvenue Administrateur dans notre monde Back-Office');
    
// Constante contenant le titre de la page home (frontOffice)
define("HOME", 'ArchiTEC');

// Constante contenant le titre de la page bureau
define("BUREAU", 'ArchiTEC <br> & Design global');

// Constante contenant le titre de la page contact
define("CONTACT", 'Contact');

// Constante contenant la DB_HOST
define("DB_HOST", 'db.3wa.io');

// Constante contenant la DB
define("DB_NAME", 'adelrahim_ArchiTEC');

// Constante contenant le nom d'utilisateur de la BDD
define("DB_USER", 'adelrahim');

// Constante contenant le mot de passe de la BDD
define("DB_PASS", '7d1b34136ae0964cb840aee290f2c7ac');

/**
* @var FILE_EXT_IMG  extensions acceptées pour les images
*/
const FILE_EXT_IMG = ['jpg','jpeg','gif','png','JPG','PNG'];

/**
* @var FILE_EXT_IMG  extensions acceptées pour les fichiers
*/
const FILE_EXT_DOC = ['pdf','odt','PDF'];

/**
* @var BASE_DIR Répertoire de base du blog sur le disque du serveur
*/
define('BASE_DIR', realpath(dirname(__FILE__) . "/../"));

/**
* @var UPLOADS_DIR Répertoire ou seront uploadés les fichiers
*/
const UPLOADS_DIR = BASE_DIR.'/';

/**
* @var NO_PICTURE  image par defaut 
*/
const NO_PICTURE = 'noProjet.PNG';


