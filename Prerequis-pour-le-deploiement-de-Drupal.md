# Prérequis pour l’hébergement et de déploiement de Drupal 

Éléments non exhaustifs ; configuration définitive laissée à l’appréciation de l’Hébergeur

* version : 1.1
* auteurs : [Ronan Guilloux](mailto:ronan@lespolypodes.com), Les Polypodes SARL (Nantes, France)
* licence : [CC by-sa 3.0](http://creativecommons.org/licenses/by-sa/3.0/fr/)
* [Ce document libre et ouvert est téléchargeable en ligne](https://github.com/polypodes/Collaborate/blob/master/Prerequis-pour-le-deploiement-de-Drupal.md)


## 1. But


Pour l’hébergement de sites web ou d’’applications web basées sur le CMS Drupal version 7.x, l'agence Les Polypodes propose un document non exhaustif de pré-requis techniques, à l’intention de l’Hébergeur retenu par le Client.

## 2. Rôles et vocabulaire 

* L'Agence Les Polypodes est l’agence qui conçoit l’application web,
* l’Hébergeur est responsable de l’hébergement et de l’infogérance éventuelle de l’application livrée,
* le Client final est l'entité qui réalise la commande et la recette de l’application et de son hébergement.

## 3. Prérequis généraux liés à l'OS : 

* OS Linux, dernière version stable (LTS optionnel, pas formellement demandée). Préférence de l'équipe pour Debian ou Ubuntu, nous laissons l’Hébergeur juger de la meilleure distribution à utiliser.
* Dual Core *minimum* + 8 Giga RAM *minimum*
* architecture 64 bits
* un accès FTP
* un accès SSH, idéalement `sudoer` (pas obligatoire), pour  utilisateur linux `polypodes` avec des droits suffisant pour recharger la configuration d'Apache2 (`reload`) et éditer une crontab ; ajouter si possible cet utilisateur au `usergroup` utilisé par Apache2 (`:www-data`)
* une stack LAMP tel que décrite ci-dessous

## 4. Configuration générale du serveur

La date et l'heure du serveur doivent être configurées sur le fuseau “Europe/Paris”

Version et configuration d'Apache2, PHP et MySQL : La configuration de PHP doit se conformer en tout point aux pré-requis du CMS Drupal version 7.x, dernière version stable de la version 7, y compris tous les pré-requis optionnels. Pour cela, suivre les indications des URL suivantes, en retenant les solutions Linux, Apache2, PHP et MySQL :

* [https://drupal.org/requirements](https://drupal.org/requirements)
* [https://drupal.org/requirements/webserver](https://drupal.org/requirements/webserver)
* [https://drupal.org/requirements/php](https://drupal.org/requirements/php)
* [https://drupal.org/requirements/database](https://drupal.org/requirements/database)
* [https://drupal.org/requirements/pdo](https://drupal.org/requirements/pdo)

Configuration complémentaire de PHP : (pour *apache2* et pour *cli*)

```
#/etc/php5/apache2/php.ini et /etc/php5/cli/php.ini
(...)
date.timezone=Europe/Paris
```

Attention à bien achever la *configuration* de certains modules comme APC pour la production, si ces modules ont été installés.

## 5. MySQL

L'Hébergeur est responsable de la backup des bases de données et de la bonne configuration des ressources allouées à MySQL.

Prévoir la création et la bonne configuration des droits pour un utilisateur MySQL dédié à Drupal

## 6. Apache2 

Créer un vhost par environnement (production), en permettant la ré-écriture d'URL (`mode_rewrite`) et en incluant la directive `AllowOverride All`.

## 7. Logiciels utiles au bon déploiement

Dans le cadre d'un accès SSH, logiciels à installer :

Obligatoire si accès SSH :

```
git vim curl
```

Optionnels (utiles pour le bon déploiement)

```
imagemagick rsync tig tree lynx ack-grep most exuberant-ctags manpages-fr manpages-fr-extra manpages-dev
```

Applications à installer :

* *phpmyadmin* : L'Hébergeur est responsable de la bonne protection de l'accès à PhpMyAdmin (choix du mode de protection de l’accès à PhpMyAdmin laissé au jugement de l’Hébergeur)


## 8. Livrables

Livrables obligatoires attendues par l'Agence :

* Accès FTP, SSH, URL de Phpmyadmin, et leurs différents identifiants d'accès
* URL de pré-production
* URL de production

Livrable optionnels :

Configuration Puppet de l'environnement de production, qui sera utilisée par l'équipe de développement avec `vagrant`.

## 9. Limites, conseil et assistance

En-dehors des points indiqués comme optionnels, tous ces points sont importants et peuvent devenir bloquants pour le succès du déploiement de l’application web basée sur le CMS Drupal 7.x. Sur ces points, l'Agence Les Polypodes demande a être prévenue dès qu'une incompréhension ou un doute survient du côté du Client ou de l'Hébergeur qui doit livrer l’hébergement et éventuellement assurer l’infogérance de l’application, et se tient prête à expliquer le détail et la raison de chaque pré-requis. 

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’hébergeur et l'Agence pour la bonne conduite et le succès du projet. 

L'Agence Les Polypodes se tient prêt à planifier des jours supplémentaires de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'une prestation de régie de XXX € jour / homme, frais de déplacement non inclus.
