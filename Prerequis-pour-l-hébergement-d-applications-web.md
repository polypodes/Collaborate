Prérequis pour l’hébergement d’applications web
===============================================

Éléments non exhaustifs, configuration définitive laissée à l’appréciation de l’Hébergeur

* version : 1.0
* auteurs : Ronan Guilloux, Les Polypodes SARL (Nantes, France)
* licence : http://creativecommons.org/licenses/by-sa/3.0/fr/ 


Contexte
--------

Pour l’hébergement de sites web ou d’’applications web basées sur le framework Symfony2,
l'agence Les Polypodes propose un document non exhaustif de prérequis techniques,
à l’intention de l’Hébergeur retenu par le Client.

But
---

Le but de ce document est de donner les éléments minimaux pour l'hébergement d'applications PHP basés sur

* Symfony 2.*
* Silex 1.*
* Drupal 7 et 8


Rôles et vocabulaire 
--------------------

* L'Agence Les Polypodes est l’agence qui conçoit l’application web,
* l’Hébergeur est responsable de l’hébergement et de l’infogérance éventuelle de l’application livrée,
* le Client final est l'entité qui réalise la commande et la recette l’application et son hébergement.


1. Prérequis généraux : 
-----------------------

* OS Linux, dernière version stable (LTS optionnel, pas formellement demandée). Préférence de l'équipe pour Debian ou Ubuntu, nous laissons l’Hébergeur juger de la meilleure distribution à utiliser.
* 1 Core + 4 Giga RAM minimum
* architecture 64 bits
* PHP 5.4.* ou supérieure, stable 
* Apache 2.2.* ou supérieure, stable
* MySQL 5.5.* ou supérieure, stable
* 1 utilisateur linux "polypodes" avec des droits nécessaires pour reloader Apache2 et éditer uen crontab ; rendre si possible cet utilisateur membre du même que celui utilisé par Apache2 (:www-data)


Configuration du serveur
------------------------

PHP (apache2 et cli)

```
#/etc/php5/apache2/php.ini et /etc/php5/cli/php.ini

server datetime = “Europe/Paris”

error_reporting = E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT

date.timezone=Europe/Paris

[Phar]
phar.readonly = Off
phar.require_hash = Off
detect_unicode = Off
```

Extensions de PHP à installer :

```
php-apc php5-mysql php5-cli php5-curl php-pear php5-gd php5-imagick php5-imap php5-xsl php5-common php5-mcrypt php5-ps php5-pspell php5-recode php5-snmp php5-tidy php5-intl
```

Attention à bien achever la *configuration* de certains modules comme APC pour la production.

Par ailleurs la configuration de PHP doit se conformer aux pré-requis du framework Symfony 2.* (dernière version stable) : http://symfony.com/doc/current/reference/requirements.html, y compris tous les pré-requis optionnels.


“Some systems don't support chmod +a, but do support another utility calledsetfacl. You may need to enable ACL support on your partition and install setfacl before using it (as is the case with Ubuntu)”

MySQL
-----

L'Hébergeur est responsable de la backup des bases de données et de la bonne configuration des ressources allouées à MySQl.

* Création d'une base de preproduction et d'une base de production
* Mise en place d'un utilisateur MySQL auquel on permettra les actions suivantes :

SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES

Logiciels en ligne de commande utiles aux développeurs
------------------------------------------------------

Logiciels à installer :

```
imagemagick rsync git vim curl tree lynx ack-grep pandoc most exuberant-ctags linux-headers-generic build-essential manpages-fr manpages-fr-extra manpages-dev nodejs npm
```

Pour nodejs, utiliser le dépot PPA `ppa:chris-lea/node.js`. NodeJs n'est pas utilisé ici en tant que serveur web mais en tant qu'utilitaire CLI uniquement.


Logiciels web utiles aux développeurs
-------------------------------------

Applications à installer :

* phpmyadmin: Merci de protéger l'accès à PhpMyAdmin (choix du mode de protection de l’accès à PhpMyAdmin laissé au jugement de l’Hébergeur)
* WKHTML2PDF version 0.11 RC ou supérieure à installer : http://code.google.com/p/wkhtmltopdf/downloads/list. Les prérequis sont listés ici : http://code.google.com/p/wkhtmltopdf/wiki/compilation


Apache2 
-------

Créer un vhost par environnement (preprod et prod), avec la directive `AllowOverride All`

Mods d'Apache à activer :

```
rewrite
headers
deflate
expires
setenvif
```



2. Limites, conseil et assistance
---------------------------------

En-dehors des points indiqués comme optionnels, tous ces points sont importants et peuvent devenir bloquants pour le succès du déploiement de l’application web baséee. Sur ces points, l'Agence Les Polypodes demande a être prévenue dès qu'une incompréhension ou un doute survient du côté de l'Hébergeur qui doit livrer l’hébergement et éventuellement assurer l’infogérance de l’application, et se tient prête à expliquer le détail et la raison de chaque pré-requis. 

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’hébergeur et l'Agence pour la bonne conduite et le succès du projet. 

L'Agence Les Polypodes se tient prêt à planifier des jours de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'un forfait de régie de XXX € jour / homme, frais de déplacement non inclus.


