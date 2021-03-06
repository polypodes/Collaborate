![#Les Polypodes](header.png)

# Prérequis pour l’hébergement et de déploiement de Drupal 

Éléments non exhaustifs ; configuration définitive laissée à l’appréciation de l’Hébergeur

* version : 1.5.3
* auteurs : [Ronan Guilloux](mailto:ronan@lespolypodes.com), [Les Polypodes](http://lespolypodes.com/) SARL (Nantes, France)
* licence : [CC by-sa 3.0 fr](http://creativecommons.org/licenses/by-sa/3.0/fr/)
* [Ce document libre et ouvert est téléchargeable en ligne](https://github.com/polypodes/Collaborate/blob/master/Prerequis-pour-le-deploiement-de-Drupal.md)


## 1. But

Pour l’hébergement de sites web ou d’applications web basées sur le CMS Drupal version 7.x et 8.x, l'agence [Les Polypodes](http://lespolypodes.com/) propose un document non exhaustif de pré-requis techniques, à l’intention de l’Hébergeur retenu par le Client.

Ce document se veut une base de dialogue cordial, un outil de référence pour une coopération réussie entre l'Agence et l'Hébergeur, dans l'esprit du mouvement [__devops__](http://fr.wikipedia.org/wiki/Devops).


## 2. Rôles et vocabulaire 

* L'Agence [Les Polypodes](http://lespolypodes.com/) est l’agence qui conçoit l’application web, et qui le cas échéant la déploie et/ou en assure la maintenance ;
* l’Hébergeur/Infogéreur est responsable de l’hébergement et/ou de l’infogérance : il assure la sécurité, de la mise à jour et de la surveillance des logiciels serveurs : la pile LAMP (OS GNU/Linux, PHP, Apache2, MySQL), et tous les autres logiciels nécessaires installés sur le serveur. Sauf indications contraires, il n'assure pas l'infogérance de l'application web ;
* le Client final est l'entité qui réalise la commande et la recette de l’application et de son hébergement.

## 3. Prérequis généraux liés à l'OS : 

* OS Linux, dernière version stable (LTS optionnel, pas formellement demandée).
* Distribution Debian ou Ubuntu - nous laissons l’Hébergeur juger de la meilleure distribution à utiliser et consulter les pré-requis de Drupal ci-dessous.
* 2 Giga RAM *minimum*
* architecture 64 bits
* 10 Giga d'espace disque (backup non compris)
* une stack LAMP tel que décrite ci-dessous
* un accès SSH avec un compte utilisateur Unix/Linux (cf. plus loin)

Tests :

```bash
ssh root@server
root@server:/# cat /etc/issue
root@server:/# cat /etc/debian_version
root@server:/# uname -a
root@server:~# free -m
root@server:~# grep 'model name' /proc/cpuinfo | wc -l
root@server:~# df -h
root@server:~# ip link show
root@server:~# netstat -i
```

## 4. Prérequis généraux liés aux rôles et droits Unix/Linux :

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

L'accès SSH permet notamment le bon déploiement, via GIT ou rsync, des mises à jours et évolutions du site. Il est rendu obligatoire par l'utilisation en ligne de commande de l'outil [Drush](https://github.com/drush-ops/drush), proposé par Drupal et l'utilisation en ligne de commande d'outils de build (make, grunt, gulp, etc.).


## 5. Configuration générale du serveur

La date et l'heure du serveur doivent être configurées sur le fuseau “Europe/Paris”

Version et configuration d'Apache2, PHP et MySQL : La configuration de PHP doit se conformer en tout point aux pré-requis du CMS Drupal version 7.x et 8.x, y compris tous les pré-requis optionnels. Pour cela, suivre les indications des URL suivantes, en retenant les solutions Linux, Apache2, PHP et MySQL :

* [https://drupal.org/requirements](https://drupal.org/requirements)
* [https://drupal.org/requirements/webserver](https://drupal.org/requirements/webserver)
* [https://drupal.org/requirements/php](https://drupal.org/requirements/php) : PHP 5.4 minimum, dernière version stable de PHP 5.x recommandée
* [https://drupal.org/requirements/database](https://drupal.org/requirements/database)
* [https://drupal.org/requirements/pdo](https://drupal.org/requirements/pdo)

Tests :

```bash
ssh root@server
root@server:/# date
root@server:~# php -v
root@server:~# php -i
```

Configuration complémentaire de PHP : (pour *apache2* **et pour *cli* **)

Exemple de tests pour `apache2` :

```bash
root@server:/# cd /etc/php5/apache2/
root@server:/# cat php.ini | grep 'session.cache_limiter'
root@server:/# cat php.ini | grep 'session.auto_start'
root@server:/# cat php.ini | grep 'magic_quotes_gpc'
root@server:/# cat php.ini | grep 'register_globals'
root@server:/# cat php.ini | grep 'memory_limit'
root@server:/# php -i | grep 'xml'
root@server:/# ll /etc/php5/apache2/conf.d/ | grep 'gd'
root@server:/# php -i | grep 'json'
root@server:/# php -i | grep 'hash'
root@server:/# cat php.ini | grep 'expose_php'
root@server:/# php -i | grep 'allow_url_fopen'
root@server:/# cat php.ini | grep 'display_errors'
root@server:/# cat php.ini | grep 'date.timezone'
```

Attention à bien achever la *configuration* de certains modules de PHP pour l'environnement de production.

### Mémoire allouée à PHP

A titre d'information uniquement, les préconisations de mémoire limite allouable (directive `memory_limit` de `php.ini`) sont de (128M pour Drupal](https://www.drupal.org/requirements/php#memory) et de [`256M` pour Symfony2 (dont Drupal utilise des composants)](https://www.google.fr/?q=site:symfony.com+%22memory_limit%22#q=site:symfony.com+%22memory_limit%22).

### Caches d'OpCode et accélérateurs pour PHP

Jusqu'à PHP 5.4.x inclus, l'Agence recommande d'ajouter un accélérateur permettant de gérer le cache d'OpCode pour PHP, en particulier [APC](http://php.net/manual/en/book.apc.php).

À partir de PHP 5.5, PHP intègre son propre moteur de cache d'Opcode, [Zend Opcache](http://en.wikipedia.org/wiki/List_of_PHP_accelerators#Zend_Opcache_.28ex._Zend_Optimizer.2B.29). Dès lors, il n'est pas requis d'installer un autre accélérateur.

### Sécurité et mise à jour des logiciels côté serveur

A titre d'information, pour évaluer la présence de vulnérabilités critiques éventuelle dans la version de PHP installée, l'Agence utilise [versionscan](https://github.com/psecio/versionscan).

## 6. MySQL

L'Hébergeur est responsable de la bonne configuration des ressources allouées à MySQL, du plan de *backup* des bases de données, de la mise en oeuvre de ces sauvegardes et de leur restauration à la demande du Client final ou de l'Agence.

Tests :

```bash
root@server:/# mysql -V
root@server:/# php -i | grep 'PDO'
```

Prévoir la création et la bonne configuration des droits pour un utilisateur MySQL dédié à Drupal, à créer par l'Hébergeur et à transmettre à l'Agence.

## 7. Apache2 

Créer un vhost par environnement (production), en permettant la ré-écriture d'URL (`mode_rewrite`) et en incluant la directive `AllowOverride All`.

Tests : 

```bash
root@server:/# apache2 -l
root@server:/# apache2 -V
root@server:/# ls -l /etc/apache2/mods-enabled
```

Mods d'Apache à activer :

```
rewrite
headers
deflate
expires
setenvif
```

Vérifier que pour le site courant la directive `AllowOverride` à `ALL`:

> The Apache Virtualhost configuration must contain the directive AllowOverride All to allow Drupal's .htaccess file to be used.

Vérifier la présence du 'mod_rewrite': 

```php
<?
echo "<pre>";
var_export(apache_get_modules());
```

## 8. Préparation des déploiements successifs (releases majeures, correctifs, etc.)

Le process de mise en (pré-)production de l'Agence se base sur une structure en `releases`, avec un `DocumentRoot` du *vhost* d'Apache2 pointant vers la dernière release courante, via un mécanisme de liens symbolique :

```bash
➜  myServer  tree
.
├── [me  2237]  Makefile
├── [me      55]  current -> releases/2014-07-04
├── [me      55]  old -> releases/2014-07-01
├── [me    170]  releases
└── [me    170]  uploads 
➜  myServer
```

- `current` est le `DocumentRoot` du *virtualhost* dans Apache2
- `old` est une release précédente, sur lequel on peut faire un *rollback*
- `releases` est le répertoire contenant toutes les *releases*
- `uploads` est un répertoire partagé entre toutes les *releases*, contenant les fichiers et médias envoyés par le webmaster sur le serveur (images, sons, vidéos, PDFs, etc.). Un lien symbolique rend disponible ce répertoire dans le dossier de chaque *release*.

Ce mécanisme de mise en (pre-)production basé sur des **releases** est courant (cf. [Capistrano](http://capistranorb.com) ou [Chef](https://docs.getchef.com/resource_deploy.html) par exemple) - il est [présenté en détail ici](https://github.com/polypodes/Build-and-Deploy/tree/master/deploy) :

```bash
➜  myServer  tree releases
.
└── [me            170]  releases
    ├── [me            340]  2014-07-01--11-10-50                <-- "old"
    ├── [me            340]  2014-06-21--13-21-27
    ├── [me            340]  2014-05-13--18-34-42
    ├── [me            340]  2014-05-02--14-25-51
    └── [me            340]  2014-07-04--16-23-10                <-- "current"
        ├── [me            68]  src
        └── [me           136]  web
            └── [me          1289]  index.php
            └── [me            16]  uploads -> ../../../uploads  <-- a symlink
            
➜  myServer
```

Du point de vue de l'hébergement, se mécanisme nécessite simplement que le dossier parent du `DocumentRoot` du *vhost* d'Apache2 soit accessible en écriture pour l'Agence, et que la directive `Options FollowSymLinks` y soit présente. 


## 9. Logiciels utiles au bon déploiement

Obligatoire avec l'accès SSH :

```
git vim rsync curl imagemagick 
```

Optionnels (utiles pour le bon déploiement)

```
tig tree lynx ack-grep 
manpages-fr manpages-fr-extra manpages-dev
```

Applications à installer :

* *phpmyadmin* : L'Hébergeur est responsable de la bonne protection de l'accès à PhpMyAdmin (choix du mode de protection de l’accès à PhpMyAdmin laissé au jugement de l’Hébergeur)

Tests : 

Pour chacun des logiciels listés dans cette section : 

```bash
root@server:/# whereis [nom_du_logiciel]
```

## 10. Livrables

Livrables obligatoires attendues par l'Agence :

* Accès SSH, URL de Phpmyadmin, et leurs différents identifiants d'accès
* URL de production

Livrable optionnels :

Si l'hébergeur utilise Puppet pour provisionner l'environnement de production, cette configuration sera appréciée par l'équipe de développement avec `vagrant`.


## 11. Limites, conseil et assistance

Les points ci-dessus sont soit un rappel des pré-requis serveur de Drupal proposé par l'éditeur de ce CMS, soit des éléments permettant le bon déploiement des livrables de l'Agence. L'Hébergeur/l'infogéreur reste le seul interlocuteur du Client pour la mise en place effective de ces pré-requis. Dans le cas ou cela a été prévu, l'Agence peut jouer un rôle d'Assistance à Maitrise d'Ouvrage auprès du client pour l'aider à valider que ces pré-requis ont bien été installés.

En-dehors des points indiqués comme optionnels, tous ces points sont importants et peuvent devenir bloquants pour le succès du déploiement de l’application web basée sur le CMS Drupal 7.x et 8.x. Sur ces points, l'Agence Les Polypodes demande a être prévenue dès qu'une incompréhension ou un doute survient du côté du Client ou de l'Hébergeur qui doit livrer l’hébergement et éventuellement assurer l’infogérance de l’application, et se tient prête à expliquer le détail et la raison de chaque pré-requis. 

Il revient à l'Hébergeur de réaliser l'installation et la configuration des pré-requis de Drupal, et de s'assurer que ces pré-requis de Drupal ne mettent pas en cause l'intégrité, la disponibilité et la performances de l'infrastrucutre existante (en cas de ré-utilisation d'un serveur de production en particulier). 

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’hébergeur et l'Agence pour la bonne conduite et le succès du projet. 

L'Agence Les Polypodes se tient prêt à planifier des jours supplémentaires de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'une prestation de régie de XXX € jour / homme, frais de déplacement non inclus.
