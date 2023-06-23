-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db.3wa.io
-- Généré le : lun. 28 mars 2022 à 20:54
-- Version du serveur :  5.7.33-0ubuntu0.18.04.1-log
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `adelrahim_ArchiTEC`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualities`
--

CREATE TABLE `actualities` (
  `act_id` int(11) NOT NULL,
  `act_title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `act_description` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `actualities`
--

INSERT INTO `actualities` (`act_id`, `act_title`, `act_description`) VALUES
(1, 'TENDANCE ', 'NOS ÉQUIPES SE SONT RENDUES SUR LE SALON MAISON & OBJET, L’UN DES PLUS GRANDS SALONS D’EUROPE CONSACRÉ À LA DÉCORATION ET À L’ART DE VIVRE. DÉCOUVREZ NOTRE SÉLECTION D\'OBJETS ET DE MATIÈRES...'),
(2, 'INSPIRATION', 'CES SEPT BÂTIMENTS PRENNENT VIE ... CAPTIVANT !'),
(3, 'INSPIRATION', 'INSOLITES, DÉCOUVREZ CES RESTAURANTS DU BOUT DU MONDE AUX ARCHITECTURES UNIQUES...'),
(4, 'PROJET ', 'DESIGN D’UNE SALLE DE BAIN TOUT EN MARBRE : NOIR ET BLANC, UNE DUALITÉ COMPLÉMENTAIRE ! ?? ?'),
(5, 'FETE', 'TOUTE L\'ÉQUIPE ARCHITECH VOUS SOUHAITE DE BONNES FÊTES DE FIN D\'ANNÉE ! ?\r\n\r\nA L\'ANNÉE PROCHAINE ! ?'),
(6, 'REMERCIEMENT', 'TOUTE L’ÉQUIPE ARCHITEC VOUS REMERCIE DE VOTRE CONFIANCE ET VOUS PRÉSENTE SES MEILLEURS VŒUX POUR L’ANNÉE 2022\r\nUNE NOUVELLE ANNÉE, DE NOUVEAUX HORIZONS…\r\nPUISSE NOTRE COLLABORATION VOUS APPORTER, CETTE ANNÉE ENCORE, LA PLUS GRANDE SATISFACTION. ?');

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `arc_id` int(11) NOT NULL,
  `arc_lastname` varchar(150) CHARACTER SET utf8 NOT NULL,
  `arc_firstname` varchar(150) CHARACTER SET utf8 NOT NULL,
  `arc_mail` varchar(150) CHARACTER SET utf8 NOT NULL,
  `arc_password` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `arc_role` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT 'ADMIN',
  `avatar_admin` varchar(150) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`arc_id`, `arc_lastname`, `arc_firstname`, `arc_mail`, `arc_password`, `arc_role`, `avatar_admin`) VALUES
(1, 'RAHIM', 'Adel', 'jury@3wa.io', '$2y$10$9lkxLmLZydUL6T4dZW.k1u9fm1fjiO6GXEi.rRMzIIrXQxKoGZKx6', 'ADMIN', '6239047969f3a-python.png'),
(2, 'MICKE', 'Roger', 'live@live.fr', '$2y$10$roOBtHGFa4Hwgl2okmageexWmb3tA.5NCBjRuLzzTwzrNFfiyc6OK', 'ADMIN', '623ea05e8a6ba-IMG_20200415_115106_611.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cat_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cat_img` varchar(150) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`cat_id`, `cat_title`, `cat_description`, `cat_img`) VALUES
(1, 'Architecture intérieure ', 'Transformation et aménagement intérieure avec décoration en proposant de nouvelles couleurs, des matériaux, et des meubles assortis.', 'cat_interieure.jpg'),
(2, 'Architecture', 'La construction et la réalisation sur le terrain, urbanisation et travaux de rénovation en respectant des règles de construction empiriques ou scientifiques, ainsi que des concepts esthétiques, classiques ou nouveaux', 'cat_architecture.jpg'),
(3, 'Conception 3D', 'Conception des projets en 3 dimensions , en conception assistée par ordinateur(CAO et DAO) et réalisation des maquettes de votre projet', 'cat_conception3D.jpg'),
(4, 'Graphisme', 'La conception des projets en 2D, toute sorte de plans avec animation d\'une grande curiosité et créativité de l\'univers artistique.', 'cat_graphisme.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

CREATE TABLE `cv` (
  `cv_id` int(11) NOT NULL,
  `cv_lastname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cv_firstname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cv_doc` varchar(250) CHARACTER SET utf8 NOT NULL,
  `cv_poste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv`
--

INSERT INTO `cv` (`cv_id`, `cv_lastname`, `cv_firstname`, `cv_doc`, `cv_poste`) VALUES
(1, 'ROGER', 'Micke', '621633648d8a9-attest-signed.pdf', 2),
(2, 'ROGER', 'Micke', '621ce5cf80c0d-BON_COMMANDE.pdf', 1),
(3, 'JE SISCS', 'Ufusbdud', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `photo_id` int(11) NOT NULL,
  `photo_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `photo_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`photo_id`, `photo_name`, `photo_projet`) VALUES
(1, 'flog1.jpg', 10),
(2, 'flog2.jpg', 10),
(3, 'flog3.jpg', 10),
(4, 'flog4.jpg', 10),
(5, 'lunette1.jpg', 1),
(6, 'lunette2.jpg', 1),
(7, 'lunette3.jpg', 1),
(8, 'lunette4.jpg', 1),
(9, 'table1.jpg', 4),
(10, 'table2.jpg', 4),
(11, 'table3.jpg', 4),
(12, 'table4.jpg', 4),
(13, 'maison1.jpg', 3),
(14, 'maison2.jpg', 3),
(15, 'maison3.jpg', 3),
(16, 'maison4.jpg', 3),
(17, 'studio1.jpg', 5),
(18, 'studio2.jpg', 5),
(19, 'studio3.jpg', 5),
(20, 'studio4.jpg', 5),
(21, 'sdb1.jpg', 6),
(22, 'sdb2.jpg', 6),
(23, 'sdb3.jpg', 6),
(24, 'sdb4.jpg', 6),
(25, 'concept1.jpg', 16),
(26, 'concept2.jpg', 16),
(27, 'concept3.jpg', 16),
(28, 'concept4.jpg', 16),
(29, 'graph1.jpg', 15),
(30, 'graph2.jpg', 15),
(31, 'graph3.jpg', 15),
(32, 'graph4.jpg', 15),
(33, 'enfant1.jpg', 2),
(34, 'enfant2.jpg', 2),
(35, 'enfant3.jpg', 2),
(36, 'enfant4.jpg', 2),
(37, 'bois1.jpg', 7),
(38, 'bois2.jpg', 7),
(39, 'immeuble1.jpg', 8),
(40, 'immeuble2.jpg', 8),
(41, 'immeuble3.jpg', 8),
(42, '3D.1.jpg ', 9),
(43, '3D.2.jpg', 9),
(44, '3D.3.jpg', 9),
(45, '3D.4.jpg ', 9),
(46, 'archi.bureaux1.jpg', 11),
(47, 'archi.bureaux2.jpg', 11),
(48, 'archi.bureaux3.jpg', 11),
(49, 'vertBleu1.jpg', 12),
(50, 'vertBleu2.jpg', 12),
(51, 'vertBleu3.jpg', 12),
(52, 'vertBleu4.jpg', 12),
(53, 'medico1.jpg', 13),
(54, 'medico2.jpg', 13),
(55, 'medico3.jpg', 13),
(56, 'comble1.jpg', 14),
(57, 'comble2.jpg', 14),
(58, 'comble3.jpg', 14),
(59, 'comble4.jpg', 14),
(60, 'amenagement1.jpg', 17),
(61, 'amenagement2.jpg', 17),
(62, 'amenagement3.jpg', 17),
(63, 'amenagement4.jpg', 17),
(64, 'bois3.jpg', 7);

-- --------------------------------------------------------

--
-- Structure de la table `postes`
--

CREATE TABLE `postes` (
  `post_id` int(11) NOT NULL,
  `post_name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `post_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `post_conditions` varchar(255) CHARACTER SET utf8 NOT NULL,
  `post_contrat` varchar(50) CHARACTER SET utf8 NOT NULL,
  `post_salary` varchar(250) CHARACTER SET utf8 NOT NULL,
  `post_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `postes`
--

INSERT INTO `postes` (`post_id`, `post_name`, `post_description`, `post_conditions`, `post_contrat`, `post_salary`, `post_category`) VALUES
(1, 'un-e Architecte ', 'Nous recherchons un profil polyvalent, capable de s\'adapter aux différents types de projets de l\'agence : mission en architecture, en aménagement intérieur, design et décoration pour tous types de projets en neuf ou en rénovation.', 'Avoir au minimum 2 ans d\'expérience, Avoir un minimum d\'autonomie dans la conception architecturale, Maîtriser les logiciels REVIT et AUTOCAD, Maîtriser les outils 3D (SketchUp, ArchiCAD ou équivalent)Être créatif motivé, rigoureux, avoir l’esprit', 'CDI', 'Rémunération selon profil', 2),
(2, 'un-e Architecte d\'intérieur', 'Vous travaillerez sur la conception de projet de typologies différentes en neuf ou rénovation : Aménagement de logement, plateau de bureaux, boutiques, restaurants, etc…', 'Savoir faire des rendus 3D de qualité, Avoir un bon relationnel client, Connaître la réalisation des autorisations d’urbanisme (PC, DP, ERP…), Avoir de bonnes connaissances techniques', 'CDD de 6 mois', 'rémunération selon profil', 1),
(3, 'une graphiste', 'Vous serez amené à designer du mobilier, préparer les dossiers de présentation, réaliser tous les documents graphiques nécessaires et adaptés au projet (croquis, plans, coupes, détails, 3D, …), faire les préconisations (mobilier, matériaux)', 'Maîtriser le logiciel AUTOCAD, Savoir utiliser REVIT est un plus, Savoir réaliser des croquis de qualité à la main, Savoir faire des rendus 3D de qualité, maquettes et projets personnels a présentés', 'CDI de 2 ans', 'Non communiqué', 4);

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `pro_id` int(11) NOT NULL,
  `pro_title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `pro_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `img_name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `pro_date` date NOT NULL,
  `pro_owner` varchar(150) CHARACTER SET utf8 NOT NULL,
  `pro_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`pro_id`, `pro_title`, `pro_description`, `img_name`, `pro_date`, `pro_owner`, `pro_category`) VALUES
(1, 'La lunetterie', 'Une décoration sur mesure pour mettre en scène des lunettes de création originale', 'laLunette.jpg', '2019-05-08', 'Privé', 1),
(2, 'Aménagement chambre d\'enfant', 'Un espace pour vivre de belles histoires a vos enfants ', 'amenagementEnfant.jpg', '2020-03-16', 'particulier', 1),
(3, 'Rénovation intérieure d\'une maison familiale', 'Ouvrir les espaces et laisser entrer la lumière', 'renovationMaison.jpg', '2018-01-26', 'Privé', 1),
(4, 'La table des écrivains', 'Palette et bois brut : une décoration DO IT YOURSELF', 'tableEcrivain.jpg', '2019-05-11', 'La régie des écrivains', 1),
(5, 'Création d\'un studio de tournage', 'Une cuisine pratique à vos fourneaux , un background fonctionnel  ', 'studioInterieure.jpg', '2019-02-11', 'société food', 1),
(6, 'SDB en 3D', 'Conception d\'une salle de bain tout en marbre', 'SDB3.jpg', '2018-04-08', 'Privé', 3),
(7, 'Le bois secret', 'Conception d\'un immeuble de 19 logements au milieu des des champs', 'bois.jpg', '2017-09-19', 'privé', 3),
(8, 'L\'immeuble 22', 'Construction d\'un immeuble de 7 logements situé en plein centre ville', 'immeuble22.jpg', '2018-01-14', 'Privé', 2),
(9, 'le 22 en 3D', 'Conception d\'un bâtiment 22 de 7 logements en 3 Dimensions ', 'le22.3D.jpg', '2019-10-28', 'Société privée', 3),
(10, 'Loft des Jardiniers', 'Transformation et extention d\'un ancien restaurant en LOFT', 'loftArchi.jpg', '2021-12-07', 'Société privée', 2),
(11, 'Immeuble bureaux', 'Une rénovation lourde et contrastée pour cette immeuble de bureaux', 'archi.bureaux.jpg', '2019-01-10', 'Société Edifice ', 2),
(12, 'Entre vert et Bleu', 'Construction d\'un immeuble de 25 logements au bord du canal', 'vertBleu.jpg', '2021-07-30', 'Privé', 2),
(13, 'Réhabilitation d\'un hôtel ', 'Réhabilitation et extension d\'un hôtel en établissements médicosociaux ', 'medico.jpg', '2020-09-12', 'Etat', 2),
(14, 'Conception d\'un comble', 'Création d\'une mezzanine dans le comble pour optimiser l\'espace', 'comble.jpg', '2017-11-20', 'Particulier', 3),
(15, 'Conception 2D d\'un projet immobilier maison', 'Conception des plans en 2 dimensions d\'une maison   ', 'design.jpg', '2021-08-17', 'Privé', 4),
(16, 'conception de Plan de masse 2D d\'un projet maison ', 'Réalisations des plans 2 de tous les étages d\'une maison ', 'concept.jpg', '2022-01-09', 'Privé', 4),
(17, 'Conception d\'aménagement intérieure d\'un appartement', 'un nouveau LOOK de cet appartement et création de meubles sur mesure ..', 'amenagement.jpg', '2018-02-22', 'Particulier', 3);

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE `rdv` (
  `app_id` int(11) NOT NULL,
  `app_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `app_lastname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `app_mail` varchar(150) CHARACTER SET utf8 NOT NULL,
  `app_date` datetime NOT NULL,
  `app_message` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`app_id`, `app_name`, `app_lastname`, `app_mail`, `app_date`, `app_message`) VALUES
(1, 'ROGER', 'Micke', 'argon71@hotmail.fr', '2022-03-26 17:28:00', 'Si possible d\'avoir un RDV'),
(2, 'RAHIM', 'Adel', 'adeeelo22@live.com', '2022-01-06 00:00:00', 'je suis developpeur web je veux prendre un rendez vous samedi matin svp'),
(3, 'AFETF', 'Ezrgzerg', 'zergez@live.fr', '2022-03-31 15:19:00', 'je voudrais prendre un rdv la semaine prochaine'),
(4, 'AFETF', 'Ezrgzerg', 'zergez@live.fr', '2022-03-31 15:19:00', 'je voudrais prendre un rdv la semaine prochaine'),
(5, 'AFETF', 'Ezrgzerg', 'zergez@live.fr', '2022-03-31 15:19:00', 'je voudrais prendre un rdv la semaine prochaine'),
(6, 'AFETF', 'Ezrgzerg', 'zergez@live.fr', '2022-03-31 15:19:00', 'je voudrais prendre un rdv la semaine prochaine'),
(7, 'AFETF', 'Ezrgzerg', 'zergez@live.fr', '2022-03-31 15:19:00', 'je voudrais prendre un rdv la semaine prochaine'),
(8, 'UETW', 'Jd7dvw', 'jets@live.fr', '2022-03-30 15:20:00', 'Bdievdys');

-- --------------------------------------------------------

--
-- Structure de la table `recupMdp`
--

CREATE TABLE `recupMdp` (
  `recup_id` int(11) NOT NULL,
  `recup_mail` varchar(150) CHARACTER SET utf8 NOT NULL,
  `recup_code` varchar(150) CHARACTER SET utf8 NOT NULL,
  `dateTimeEnd` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actualities`
--
ALTER TABLE `actualities`
  ADD PRIMARY KEY (`act_id`);

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`arc_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Index pour la table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`cv_id`),
  ADD KEY `cv_poste` (`cv_poste`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `photo_projet` (`photo_projet`);

--
-- Index pour la table `postes`
--
ALTER TABLE `postes`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_category` (`post_category`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `pro_category` (`pro_category`);

--
-- Index pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`app_id`);

--
-- Index pour la table `recupMdp`
--
ALTER TABLE `recupMdp`
  ADD PRIMARY KEY (`recup_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actualities`
--
ALTER TABLE `actualities`
  MODIFY `act_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `arc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `cv`
--
ALTER TABLE `cv`
  MODIFY `cv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `postes`
--
ALTER TABLE `postes`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `recupMdp`
--
ALTER TABLE `recupMdp`
  MODIFY `recup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`cv_poste`) REFERENCES `postes` (`post_id`);

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`photo_projet`) REFERENCES `projets` (`pro_id`);

--
-- Contraintes pour la table `postes`
--
ALTER TABLE `postes`
  ADD CONSTRAINT `postes_ibfk_1` FOREIGN KEY (`post_category`) REFERENCES `category` (`cat_id`);

--
-- Contraintes pour la table `projets`
--
ALTER TABLE `projets`
  ADD CONSTRAINT `projets_ibfk_1` FOREIGN KEY (`pro_category`) REFERENCES `category` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
