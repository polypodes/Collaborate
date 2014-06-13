# Prérequis pour l’hébergement d’applications web

*Résumé* : Ce document liste les pré-requis de l'Agence Les Polypodes pour réaliser un déploiement d'application Symfony2 sur un serveur web. Ce document reprend la documentation officielle de Symfony2 concernant les prérequis techniques, et détaille une configuration optimale pour l'industrialisation du déploiement. Ces éléments sont non exhaustifs : la configuration définitive est laissée à l’appréciation de l’Hébergeur qui maintient ce serveur et du Client qui reste le donneur d'ordre final.

* version : 1.1
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

* OS Linux, dernière version stable (LTS optionnel, pas formellement demandée). Préférence de l'équipe pour Debian ou Ubuntu, nous laissons l’Hébergeur juger de la meilleure distribution à utiliser.
* Dual Core *minimum* + 8 Giga RAM *minimum*
* architecture 64 bits
* un accès FTP
* un accès SSH, idéalement `sudoer` (pas obligatoire), pour un utilisateur linux `polypodes` avec des droits suffisant pour recharger la configuration d'Apache2 (`reload`) et éditer une crontab ; ajouter si possible cet utilisateur au `usergroup` utilisé par Apache2 (`:www-data`)
* une stack LAMP tel que décrite ci-dessous

## 5. PHP

PHP 5.4.x, dernière version table.

PHP (apache2 et cli)

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

## 6. MySQL

L'Hébergeur est responsable de la backup des bases de données et de la bonne configuration des ressources allouées à MySQL.

* Création d'une base de preproduction et d'une base de production
* Mise en place d'un utilisateur MySQL auquel on permettra les actions suivantes :

```SQL
SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, 
INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES
```

## 7. Apache2 

Créer un vhost par environnement (preproduction et production), avec la directive `AllowOverride All`

Mods d'Apache à activer :

```
rewrite
headers
deflate
expires
setenvif
```

## 8. Logiciels utiles au bon déploiement

Dans le cadre d'un accès SSH, logiciels à installer :

Obligatoire si accès SSH :

```
git vim curl
```

Optionnels (utiles pour le bon déploiement)

```
imagemagick rsync tig tree lynx ack-grep most exuberant-ctags manpages-fr manpages-fr-extra manpages-dev nodejs npm
```

NodeJs n'est pas utilisé ici en tant que serveur web mais en tant qu'utilitaire CLI uniquement.


Applications à installer :

* *phpmyadmin* : L'Hébergeur est responsable de la bonne protection de l'accès à PhpMyAdmin (choix du mode de protection de l’accès à PhpMyAdmin laissé au jugement de l’Hébergeur)

## 9. Livrables

Livrables obligatoires attendues par l'Agence :

* Accès FTP, SSH, URL de Phpmyadmin, et leurs différents identifiants d'accès
* URL de pré-production
* URL de production

Livrable optionnels :

Configuration Puppet de l'environnement de production, qui sera utilisée par l'équipe de développement avec `vagrant`.

## 10. Limites, conseil et assistance

En-dehors des points indiqués comme optionnels, tous ces points sont importants et peuvent devenir bloquants pour le succès du déploiement de l’application web. Sur ces points, l'Agence Les Polypodes demande a être prévenue dès qu'une incompréhension ou un doute survient du côté du Client ou de l'Hébergeur qui doit livrer l’hébergement et éventuellement assurer l’infogérance de l’application, et se tient prête à expliquer le détail et la raison de chaque pré-requis. 

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’hébergeur et l'Agence pour la bonne conduite et le succès du projet. 

L'Agence Les Polypodes se tient prêt à planifier des jours supplémentaires de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'une prestation de régie de XXX € jour / homme, frais de déplacement non inclus.


