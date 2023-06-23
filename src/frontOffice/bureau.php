<?php
session_start();
    
require('../../lib/bdd.php');
require('../../config/config.php');

const LAYOUT = "bureau";
//La page de présentation du bureau
    
    
    
    
    
include('../../views/frontOffice/'. LAYOUT . '.phtml');

