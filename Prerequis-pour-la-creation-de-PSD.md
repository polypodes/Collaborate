![#Les Polypodes](header.png)

# Prérequis pour la création de fichiers PSD en vue d’une intégration  HTML 5 / CSS 3 incluant des objectifs de responsive design.

* auteurs : [Samuel Frémondière](https://github.com/samcome) (TOOG) ([found here](https://github.com/toog/Collaboration)), [Gaëtan Ark](https://github.com/shinze) ([Les Polypodes](http://lespolypodes.com/)), [Ronan Guilloux](https://github.com/ronanguilloux) ([Les Polypodes](http://lespolypodes.com/))
* version : 1.1.0
* licence : [CC by-sa 3.0 fr](http://creativecommons.org/licenses/by-sa/3.0/fr/)
* [Ce document libre et ouvert est téléchargeable en ligne](https://github.com/polypodes/Collaborate/blob/master/Prerequis-pour-la-creation-de-PSD.md) ([version PDF](https://gitprint.com/polypodes/Collaborate/blob/master/Prerequis-pour-la-creation-de-PSD.md))

## Contexte

Pour l'intégration HTML d'un nouveau site, L'agence [Les Polypodes](http://lespolypodes.com/) utilise des frameworks HTML et CSS qui accélèrent et encadrent le travail d'intégration et la pérennité du projet.

Notre framework HTML / CSS est actuellement Twitter Bootstrap version 3. C’est un projet communautaire robuste, fiable et qui est pour l'instant un standard de facto. 

Rôles et vocabulaire : LES POLYPODES est l’agence qui reçoit le PSD, l’Agence Créative est l’agence qui crée et livre le PSD, le client final est celui qui recette l’intégration HTML.


## 1. Prérequis généraux :

Voici la liste des pré-requis qui permettront à LES POLYPODES d’effectuer la recette et de valider la livraison d'un fichier PSD (Fichier issu de Adobe Photoshop), en vue de son intégration en HTML / CSS :

1. Le livrable est constitué d'un seul fichier PSD;
2. Résolution : 72 dpi;
3. Ce fichier contient un calque de grilles et la création graphique respecte ce système de grille (cf. ci-dessous);
4. Fournir un PSD organisé et ré-utilisable (cf. ci-dessous);
5. Utiliser préférablement des fontes libres plutôt que des fontes propriétaires. Cf. celles de [Google](http://www.google.com/fonts) ou autres fontes compatibles Creative Common 3.0;
6. Si des fontes propriétaires sont un pré-requis de la charte graphique, vérifier la disponibilité de la polices de caractères sur [TypeKit](http://www.typekit.com) : 
6. Les icônes fournies et présentes dans le fichier final seront vectorielles;
7. Il revient au Client Final (celui qui effectue la recette de l’intégration HTML) de déterminer par avance et de communiquer le détail de ses objectifs de responsive design : smartphone et / ou iPad et / ou écran PC et / ou WebTV, etc., et de détailler la taille d’écran min/max de chaque type d’écran visé.

Tailles d’écrans et responsive design : L’intégration HTML finale en responsive design ne visera pas exactement un rendu sur Apple iPhone 3G version iOS 4.2.1 qui a une largeur d’écran (mode portrait) de 640px ou sur un Apple iPhone 3GS iOS 5.1.1 Stock Browser qui a une largeur d’écran (mode portrait) de 320px : Sur mobiles et tablettes, comme sur tout autre type d’écran, l’intégration HTML et le mécanisme de responsive design se basent uniquement sur des standards du W3C (HTML5/CSS) et sur des plages de largeurs d’écrans en pixels par exemple de 0 à 320px, de 320px à 1024px, au-delà de 1024px, etc, et non sur des marques de smartphone ou de tablette, ni des versions d’OS. Le navigateur du smartphone ou de tablette pris en compte est celui livré par défaut par l’éditeur de l’OS et du SDK (ex: Webkit pour Android, Safari pour pour iPhone).


## 2. Architecture de page basée sur une grille compatible pour le responsive design

La créa graphique doit se faire sur la base d'une grille d'une largeur de 1170px à priori, détaillée comme suit :

1. Largeur totale de 1200px (cf. variantes ci-dessous)
2. C'est à dire 1170px de largeur utile + deux gouttières extérieures de 15px;
3. Les 1170px se composent de 12 colonnes de 95px, séparées de gouttières intermédiaires de 30px;
4. Outils existants : un template de PSD ou cet autre template PSD équivalent (avec la version Ai en plus), compatible Bootstrap lui aussi.

Variantes possibles : 1170px est la largeur utilisée par LES POLYPODES, 980px est une  autre largeur possible conseillée : d'autres largeurs de grilles sont possibles. Si le choix de largeur est différent de celui conseillé ici, LES POLYPODES devra d'abord en valider que cette autre largeur soit compatible avec les objectifs de responsive design (smartphone ? tablette ? PC ? TV ?) à définir par le client final, et avec le framework Twitter Bootstrap v3 utilisé par LES POLYPODES.



## 3. Organisation interne du PSD

L'agence [Les Polypodes](http://lespolypodes.com/) attend un seul fichier PSD organisé en dossiers et en calques, utilisable par l'intégrateur HTML. Cela implique les points suivants :

1. Organiser impérativement les calques en dossier : header / content / footer
2.	Pour chaque élément (liens, boutons, mégamenu, etc.), lorsqu'il possède plusieurs états (ex : bouton enfoncé ou non) : fournir chaque état dans une structure de calques organisés : chaque état est proposé séparément.


## 4. Limites, conseil et assistance

Tous ces points sont importants et peuvent devenir bloquants.

Sur ces points, l'agence [Les Polypodes](http://lespolypodes.com/) demande a être prévenus dès qu'une incompréhension ou un doute survient du côté de l'Agence Créative qui doit livrer le PSD, et se tient prête à expliquer le détail et la raison de chaque pré-requis. 

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’Agence Créative réalisant le PSD et l'agence [Les Polypodes](http://lespolypodes.com/) réalisant l'intégration pour la bonne conduite du projet. 

L'agence [Les Polypodes](http://lespolypodes.com/) se tient prêt à planifier des jours de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'un forfait de régie de XXX € jour / homme, frais de transport non inclus.


