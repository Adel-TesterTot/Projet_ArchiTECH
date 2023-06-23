'use strict';
console.clear();

/**
  * Fonction qui gère l'affichage de la NAV qui 
  * prend toute la largeur de la fenêtre 
  * @param {void}
  */
function openNav() {
    document.getElementById("mySidenav").style.width = "100%";
}

/**
  * Fonction qui gère le hide de la NAV 
  * @param {void}
  */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

/**
  * Fonction qui affiche un sliderSHOW en jQuery
  * @param {void}
  */
$(function() {
    setInterval(function() {
    	$(".slideshow ul").animate({ marginLeft: -350 }, 1000, function() {
        	$(this).css({ marginLeft: 0 }).find("li:last").after($(this).find("li:first"));
        });
    }, 3800);
});

/** récuprer le button de scroll to top **/
let mybutton = document.getElementById("myBtn");
 
/** Affichage du button après scroll de 2000px 
  * du haut de la page 
  */
window.onscroll = function() {scrollFunction()};

/**
  * Fonction qui gère l'affichage du button go to top 
  * aprés un scroll de 2000px de la hauteur de la page
  * @param {void}
  */
function scrollFunction() {
    if (document.body.scrollTop > 2000 || document.documentElement.scrollTop > 2000) 
    {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

/**
  * Fonction qui gère le scroll automatique vers le haut de la page
  * au click sur le button
  * @param {void}
  */
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

/** récuprer le button de la redirection **/
let close = document.querySelector('#myBtn1');

/**
  * Fonction flèche qui gère la redirection 
  * vers la page PROJETS 
  * au click sur le button fermer
  * @param {void}
  */
close.addEventListener('click',()=> {
    event.preventDefault();
    document.location.href="https://adelrahim.sites.3wa.io/PROJECT%20FINAL.1/src/frontOffice/projets.php";
});

//Get the button to bottom
let myBtnBottom = document.getElementById("myBtnBottom1");

//Get the button to bottom
let myBtnBottom1 = document.getElementById("myBtnBottom2");

/**
  * Fonction qui gère le scroll automatique vers le bas du DOM
  * au click sur le button
  * @param {void}
  */
function bottomFunction() {
    window.scrollTo(0, document.body.scrollHeight);
}




