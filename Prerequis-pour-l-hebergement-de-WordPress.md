![#Les Polypodes](header.png)

# Prérequis pour l’hébergement de WordPress

*Résumé* : Ce document liste les pré-requis de l'Agence [Les Polypodes](http://lespolypodes.com/)
pour réaliser un déploiement d'une instance de WordPress sur un serveur web.
Ce document reprend la documentation officielle de WordPress concernant les prérequis techniques,
et détaille une configuration optimale pour l'industrialisation du déploiement.
Ces éléments sont non exhaustifs : la configuration définitive est laissée à l’appréciation de l’Hébergeur
qui maintient ce serveur et du Client qui reste le donneur d'ordre final.

* version : 1.0.0
* auteurs : [Ronan Guilloux](mailto:ronan@lespolypodes.com), [Les Polypodes](http://lespolypodes.com/) SARL (Nantes, France)
* licence : [CC by-sa 3.0 fr](http://creativecommons.org/licenses/by-sa/3.0/fr/)
* [Ce document libre et ouvert est téléchargeable en ligne](https://github.com/polypodes/Collaborate/blob/master/Prerequis-pour-l-hebergement-de-WordPress.md.md)
([version PDF](https://gitprint.com/polypodes/Collaborate/blob/master/Prerequis-pour-l-hebergement-de-WordPress.md))

## 1. Contexte

Pour l’hébergement de sites web basés sur WordPress et sur le stack LAMP,
l'agence [Les Polypodes](http://lespolypodes.com/) propose un document non exhaustif de prérequis techniques,
à l’intention de l’Hébergeur retenu par le Client.

Les prérequis détaillés dans ce document sont compatibles :

- avec un **hébergement mutualisé**
- avec un **hébergement sur serveur dédié**
- dans un *Cloud* (Heroku, etc.)

du moment que cet hébergement permette :

- un accès SSH pour mettre en place un déploiement automatisé 
- ou un déploiement automatisé prévu par l'hébergeur, idéalement via Git 

Ce document se veut une base de dialogue cordial,
un outil de référence pour une coopération réussie entre l'Agence et l'Hébergeur,
dans l'esprit du mouvement [__devops__](http://fr.wikipedia.org/wiki/Devops).

## 2. But

Le but de ce document est de donner les éléments minimaux pour l'hébergement
de site web basés sur WordPress basée sur PHP 5.x, dernière version stable.

## 3. Rôles et vocabulaire 

* L'Agence [Les Polypodes](http://lespolypodes.com/) est l’agence qui conçoit l’application web, et qui le cas échéant la déploie et/ou en assure la maintenance ;
* l’Hébergeur/Infogéreur est responsable de l’hébergement et/ou de l’infogérance : il assure la sécurité, de la mise à jour et de la surveillance des logiciels serveurs : la pile LAMP (OS GNU/Linux, PHP, Apache2, MySQL), et tous les autres logiciels nécessaires installés sur le serveur. Sauf indications contraires, il n'assure pas l'infogérance de l'application web ;
* le Client final est l'entité qui réalise la commande et la recette de l’application et de son hébergement.

## 4. Prérequis généraux liés à l'OS : 

* OS Linux, dernière version stable (LTS optionnel, pas formellement demandée). Préférence de l'équipe pour GNU/Linux Debian ou Ubuntu LTS dans leurs dernières version stables ;
* 1 Coeur *minimum* + 1 Giga RAM *minimum* ;
* architecture 64 bits ;
* un accès SSH avec un compte utilisateur Unix/Linux (cf. plus loin), ou à défaut un déploiement possible via Git;
* une stack LAMP tel que décrite ci-dessous.

## 5. Prérequis généraux liés aux rôles et droits Unix/Linux :

Pour automatiser le déploiement du site et des correction / évolution, l'Agence a besoin 

- soit un accès SSH : L'accès SSH permet notamment le bon déploiement, via GIT, des mises à jours et évolutions du site, et est rendu obligatoire par l'utilisation en ligne de commande d'outils de déploiement ou de build (git, make, grunt, gulp, etc.).
- soit, à défaut, un déploiement possible via Git (type Heroku);

**Un accès FTP uniquement ne suffit pas** à automatiser le déploiement successif
des corrections ou évolutions, notamment lors de la recette.

Le compte SSH utilisé par l'Agence Les Polypodes n'a pas besoin d'être `sudoer`.

## 6. Apache2 

Mods d'Apache à activer :

```
rewrite (obligatoire)
deflate (optionnel)
expires (optionnel)
setenvif (optionnel)
```

Un hébergement annoncé compatible avec WordPress comporte en général déjà le _mod_ `rewrite` obligatoire.

## 7. PHP

PHP 5, version stable

L'Editeur de WordPress, jusqu'à la version 4.2.2, requiert a minima PHP [5.2.4](https://wordpress.org/about/requirements)
mais cette version est obsolète et ne bénéficie plus d'aucune mise à jour de sécurtié.
L'Editeur de WordPress recommande d'utiliser plutôt une version récente, PHP 5.4 ou supérieure, stable 

Aucune extension de PHP autres que celles livrées avec PHP par défaut n'est obligatoire

Sur serveur dédié, la configuration de PHP doit comporter l'information de la `timezone` : (pour *apache2* et pour *cli*)

```
#/etc/php5/apache2/php.ini et /etc/php5/cli/php.ini
(...)
date.timezone=Europe/Paris
```

### (serveur dédié uniquement) Caches d'OpCode et accélérateurs pour PHP

Jusqu'à PHP 5.4.x inclus, l'Agence recommande d'ajouter un accélérateur permettant de gérer le cache d'OpCode pour PHP, en particulier [APC](http://php.net/manual/en/book.apc.php).

À partir de PHP 5.5.x, PHP intègre son propre moteur de cache d'Opcode, [Zend Opcache](http://en.wikipedia.org/wiki/List_of_PHP_accelerators#Zend_Opcache_.28ex._Zend_Optimizer.2B.29). Dès lors, il n'est pas requis d'installer un autre accélérateur.

## 8. MySQL

L'Editeur de WordPress, jusqu'à la version 4.2.2, requiert a minima MySQL en version 5.0 
et recommande MySQL 5.5 ou supérieure stable

L'Hébergeur est responsable de la backup des bases de données et de la bonne configuration des
ressources allouées à MySQL.

* Création d'une base de preproduction et d'une base de production
* Mise en place d'un utilisateur MySQL auquel on permettra les actions suivantes :

```SQL
SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, 
INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES
```

L'installation de NodeJs et NPM dernières versions stables est [très simple à réaliser en utilisant un PPA](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server#HowToInstallUsingaPPA).
NodeJs n'est pas utilisé ici en tant que serveur web mais en tant qu'utilitaire CLI uniquement.

## 9. Livrables

Livrables de l'hébergeur attendues par l'Agence pour pouvoir déployer le site en préproduction ou en production :

* accès SSH :
* accès MySQL ;
* URL de pré-production ;
* URL de production.

(serveur dédié uniquement) Livrable optionnels :

Eventuellement, si l'hébergeur utilise ces outils suivant, il peut fournir la configuration de l'environnement de production, dans un format

- Chef
- Puppet 
- ou une image Docker
 
Ces éléments de configuration pourraient alors être utilisés par l'équipe de développement pour reproduire en local l'environnement de production.

## 10. Limites, conseil et assistance

En-dehors des points indiqués comme optionnels, tous ces points sont importants et peuvent devenir bloquants pour le succès du déploiement de l’application web. Sur ces points, l'Agence Les Polypodes demande a être prévenue dès qu'une incompréhension ou un doute survient du côté du Client ou de l'Hébergeur qui doit livrer l’hébergement et éventuellement assurer l’infogérance de l’application, et se tient prête à expliquer le détail et la raison de chaque pré-requis. 

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’hébergeur et l'Agence pour la bonne conduite et le succès du projet. 

L'Agence Les Polypodes se tient prêt à planifier des jours supplémentaires de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'une prestation de régie de XXX € jour / homme, frais de déplacement non inclus.


