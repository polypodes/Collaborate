# Prérequis pour l’hébergement d’applications web basées sur LAMP

*Résumé* : Ce document liste les pré-requis de l'Agence Les Polypodes pour réaliser un déploiement d'application Symfony2 sur un serveur web. Ce document reprend la documentation officielle de Symfony2 concernant les prérequis techniques, et détaille une configuration optimale pour l'industrialisation du déploiement. Ces éléments sont non exhaustifs : la configuration définitive est laissée à l’appréciation de l’Hébergeur qui maintient ce serveur et du Client qui reste le donneur d'ordre final.

* version : 1.4
* auteurs : [Ronan Guilloux](mailto:ronan@lespolypodes.com), Les Polypodes SARL (Nantes, France)
* licence : http://creativecommons.org/licenses/by-sa/3.0/fr/ 
* [Ce document libre et ouvert est téléchargeable en ligne](https://github.com/polypodes/Collaborate/blob/master/Prerequis-pour-l-hebergement-d-applications-web.md)

## 1. Contexte

Pour l’hébergement de sites web ou d’’applications web basées sur le stack LAMP,
l'agence Les Polypodes propose un document non exhaustif de prérequis techniques,
à l’intention de l’Hébergeur retenu par le Client.

## 2. But

Le but de ce document est de donner les éléments minimaux pour l'hébergement d'applications PHP basées sur Symfony 2.x, Silex 1.x ou toute application PHP métier basée sur PHP 5.4.


## 3. Rôles et vocabulaire 

* L'Agence Les Polypodes est l’agence qui conçoit l’application web,
* l’Hébergeur est responsable de l’hébergement et de l’infogérance éventuelle de l’application livrée,
* le Client final est l'entité qui réalise la commande et la recette de l’application et de son hébergement.

## 4. Prérequis généraux liés à l'OS : 

* OS Linux, dernière version stable (LTS optionnel, pas formellement demandée). Préférence de l'équipe pour Debian ou Ubuntu, nous laissons l’Hébergeur juger de la meilleure distribution à utiliser. GNU/Linux Ubuntu 14.04 64 bits LTS est un choix idéal.
* Dual Core *minimum* + 4 Giga RAM *minimum*
* architecture 64 bits
* un accès SSH avec un compte utilisateur Unix/Linux (cf. plus loin)
* une stack LAMP tel que décrite ci-dessous

## 5. Prérequis généraux liés aux rôles et droits Unix/Linux :

Dans l'utilisation des accès SSH au serveur web, le comptes utilisateur Linux utilisé par l'Agence Les Polypodes n'a pas besoin d'être `sudoer`, à partir du moment où un sysadmin est responsable de la maintenance et du monitoring de ce serveur.

L'Agence demande 
- un accès linux avec un compte `polypodes`
- des droits suffisant pour éditer une crontab, 
- des droits suffisant pour écrire dans un répertoire dédié au projet.
- des droits suffisant pour lire le log Apache2 du site web (accès et erreurs)
- un répertoire `home` permettant de stocker la configuration de _dotfiles_ (`.bashrc`, `.bash_history`, etc.)
- l'accès à un shell fonctionnel : `bash`, ou idéalement `zsh`.
- il est utile que cet utilisateur appartiennt au `usergroup` utilisé par Apache2 (`:www-data`)

Le répertoire d'hébergement du site web à déployer (par exemple /var/www/NomDuProjet/[RacineDuSiteWeb]) devra être accessible en écriture pour l'utilisateur linux `polypodes`. Suggestion: `chown www-data:www-data` + `chmod 775`, l'utilisateur linux polypodes étant déjà membre du groupe `:www-data`.

L'accès SSH permet notamment le bon déploiement, via GIT ou rsync, des mises à jours et évolutions du site, et est rendu obligatoire par l'utilisation en ligne de commande d'outils de build (make, grunt, gulp, drush, etc.).

## 6. Préparation des déploiements successifs (releases majeures, correctifs, etc.)

Le process de mise en (pre-)production de l'Agence se base sur une structure en `releases`, avec un `DocRoot` d'Apache2 pointant vers la dernière release courante, via un mécanisme de liens symbolique :

```bash
➜  myServer  tree
.
├── [me  2237]  Makefile
├── [me    55]  current -> releases/2014-07-04     <- Apache2 vhost DocRoot
├── [me    55]  old -> releases/2014-07-01         <- rollback-able recent release
├── [me   170]  releases                           <- all releases
└── [me   170]  uploads                            <- shared, cross-releases folder
➜  myServer
```

Ce mécanisme de mise en (pre-)production basé sur des releases est courant (cf. [Capistrano](http://capistranorb.com) par exemple) - il est [présenté en détail ici](https://github.com/polypodes/Build-and-Deploy/tree/master/deploy)

Du point de vue de l'hébegement, se mécanisme nécessite simplement que le `DocRoot` du vhost d'Apache2 soit connu de l'Agence, et que la directive `Options FollowSymLinks` y soit présente. 

## 7. PHP

PHP 5.4.x ou supérieure, dernière version stable, versions apache2 et cli

Extensions de PHP à installer :

```
php5-dev php-apc php5-mysql php5-cli
php5-curl php5-gd php5-imagick
php5-imap php5-xsl php5-common
php5-mcrypt php5-memcache
php5-ps php5-intl php5-mcrypt
```

Configuration complémentaire de PHP : (pour *apache2* et pour *cli*)

```
#/etc/php5/apache2/php.ini et /etc/php5/cli/php.ini
(...)
date.timezone=Europe/Paris
(…)
[Phar]
phar.readonly = Off
phar.require_hash = Off
detect_unicode = Off
```

Par ailleurs la configuration de PHP doit se conformer aux pré-requis du framework Symfony 2.* (dernière version stable) : http://symfony.com/doc/current/reference/requirements.html, y compris tous les pré-requis optionnels.


“Some systems don't support chmod +a, but do support another utility calledsetfacl. You may need to enable ACL support on your partition and install setfacl before using it (as is the case with Ubuntu)”

Attention à bien achever la *configuration* de certains modules comme APC pour la production, si ces modules ont été installés.

## 8. MySQL

L'Hébergeur est responsable de la backup des bases de données et de la bonne configuration des ressources allouées à MySQL.

* Création d'une base de preproduction et d'une base de production
* Mise en place d'un utilisateur MySQL auquel on permettra les actions suivantes :

```SQL
SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, 
INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES
```

## 9. Apache2 

Créer un vhost par environnement (preproduction et production), avec la directive `AllowOverride All`

Mods d'Apache à activer :

```
rewrite
headers
deflate
expires
setenvif
```

## 10. Logiciels utiles au bon déploiement

Dans le cadre d'un accès SSH, logiciels à installer :

Obligatoire si accès SSH :

```
git vim curl nodejs npm
```

L'installation de NodeJs et NPM dernières versions stables est [très simple à réaliser en utilisant un PPA](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server#HowToInstallUsingaPPA). NodeJs n'est pas utilisé ici en tant que serveur web mais en tant qu'utilitaire CLI uniquement.

Optionnels (utiles pour le bon déploiement)

```
imagemagick rsync tig tree manpages-fr manpages-fr-extra manpages-dev 
```

Applications à installer :

* *phpmyadmin* : L'Hébergeur est responsable de la bonne protection de l'accès à PhpMyAdmin (choix du mode de protection de l’accès à PhpMyAdmin laissé au jugement de l’Hébergeur)

## 11. Livrables

Livrables obligatoires attendues par l'Agence :

* Accès SSH, URL de Phpmyadmin, et leurs différents identifiants d'accès
* URL de pré-production
* URL de production

Livrable optionnels :

Configuration Puppet de l'environnement de production, qui sera utilisée par l'équipe de développement avec `vagrant`.

## 12. Limites, conseil et assistance

En-dehors des points indiqués comme optionnels, tous ces points sont importants et peuvent devenir bloquants pour le succès du déploiement de l’application web. Sur ces points, l'Agence Les Polypodes demande a être prévenue dès qu'une incompréhension ou un doute survient du côté du Client ou de l'Hébergeur qui doit livrer l’hébergement et éventuellement assurer l’infogérance de l’application, et se tient prête à expliquer le détail et la raison de chaque pré-requis. 

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’hébergeur et l'Agence pour la bonne conduite et le succès du projet. 

L'Agence Les Polypodes se tient prêt à planifier des jours supplémentaires de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'une prestation de régie de XXX € jour / homme, frais de déplacement non inclus.


