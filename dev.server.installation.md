# LAMP GNU/Linux server Installation documentation

## Summary

This document describes a basic LAMP (GNU/Linux, Apache2, MySQL, PHP) + GIT server installation, based on a Ubuntu 14.04 GNU/Linux distro. MySQL Databases are backuped locally, the whole server is backup via daily snapshots, as configured by the Client himself while he bought the server.

- This server configuration **do not include any monitoring**.
- This document is f*cking **confidential** (after you started to fill logins / passwords)

## Meta

- **version**: 0.9 - June 11th, 2014.
- **licence** : http://creativecommons.org/licenses/by-sa/3.0/fr/
- **author**: Ronan GUILLOUX (<ronan@lespolypodes.com>), [Les Polypodes](http://lespolyodes.com)
- [This free/open document is available online here](https://github.com/polypodes/Collaborate/blob/master/dev.server.installation.md)

## Remote access summary

- `ssh root@IP.ADDRESS` / `ThePassWord`
- `ssh lespolypodes@IP.ADDRESS ` / `ThePassWord`
- MySQL `root` password: `ThePassWord`
- PhpMyAdmin 'obfuscated' access is: [http://IP.ADDRESS/VeryVerySecretPhpMyAdmin](http://IP.ADDRESS/VeryVerySecretPhpMyAdmin)
- PhpMyAdmin `root` password: `ThePassWord`
- Client MySQL connection (database/login/password) : `TheClient_prod` / `TheClient_prod` / `ThePassWord` 

## Server hardware configuration memo

This is **not a valid hardware recommandation**, consider it only as an example:

- OVH VPS Cloud 4 or GANDI custom VPS Server or WhateverCloudProvider VPS
- vCores: 2
- RAM: 2 Go
- HD: 10 Go 
- OS : GNU/Linux
- Distribution : Ubuntu
- Version : 14.04
- Locale : fr_FR.UTF-8

### Interface

- bandwidth: 100 Mb
- Reverse DNS : `myServer.myProvider.com`/ `IP.ADDRESS `

## SSH remote connection

root can connect remotely :

```bash
ssh root@IP.ADDRESS
```

[Les Polypodes] **ALWAYS** use a different Linux (sudoer) user:

```bash
ssh lespolypodes@IP.ADDRESS
```

## Adding French locales

```bash
locale-gen fr_FR.UTF-8
```


## Creating a dedicated Linux user `lespolypodes`, then adding it to sudoers

```bash
adduser lespolypodes
adduser lespolypodes sudo
```

Password for `lespolypodes` : `ThePassword`

## Server softwares installation

(we use newlines in snippets here because of the f*cking PDF generation of this original markdown document, via [LightPaper](http://clockworkengine.com/lightpaper-mac/))

### Update `apt` sources:

```bash
apt-get update
apt-get upgrade
apt-get dist-upgrade
```

### Basic Shell enhancements

```bash
apt-get install vim zsh curl ngrep tree htop sysstat di
apt-get install discus pydf hardinfo lynx ack-grep pandoc
apt-get install most exuberant-ctags
apt-get install linux-headers-generic build-essential
apt-get install manpages-fr manpages-fr-extra
apt-get install manpages-dev silversearcher-ag
```

### LAMP - the bases

```bash
apt-get install apache2 apache2-mpm-prefork
apt-get install libapache2-mod-php5 apache2-utils php5
apt-get install mysql-server imagemagick
apt-get install php5-dev phpmyadmin
```

### MySQL`root` password: `ThePassword`

"(...) configuring PhpMyAdmin with dbconfig-common?":  `yes` then `apache2`

### LAMP - extensions

```bash
apt-get install php-apc php5-mysql php5-sqlite php5-cli
apt-get install php5-curl php5-gd php5-imagick
apt-get install php5-imap php5-xsl php5-common
apt-get install php5-mcrypt php5-memcache
apt-get install php5-ps php5-intl php5-mcrypt
```

Then for some unclear reasons, PhpMyAdmin asked later to install /activate `mcrypt`. Extension is already installed, but just have to run this command:

```bash
sudo php5enmod mcrypt
```

NodeJs

```bash
apt-get install python-software-properties 
apt-get install python g++ make
apt-get install software-properties-common
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install nodejs
npm cache clear
```

Other CLI-related tools

```bash
apt-get install tidy markdown git git-core git-doc
apt-get install git-svn git-email tig
```

Current `lespolypodes` Linux user becomes an Apacher

```bash
adduser lespolypodes www-data
```

Adding `TheClient` as ServerName to Apache2 in `/etc/apache2/apache2.conf`

```bash
vim /etc/apache2/apache2.conf
```

Enabling Apache2 mods

```bash
a2enmod rewrite
a2enmod headers
a2enmod deflate
a2enmod expires
a2enmod setenvif
service apache2 restart
```

### PHP

Configuring php.ini (php-cli & apache2): 

```bash
vim /etc/php5/apache2/php.ini /etc/php5/cli/php.ini -p
```

```
[Date]
date.timezone = Europe/Paris
```

`.phar` PHP archives need special options:

```
[Phar]
; http://php.net/phar.readonly
phar.readonly = Off

; http://php.net/phar.require-hash
phar.require_hash = Off

detect_unicode = Off
suhosin.executor.include.whitelist = phar
```

## ZSH

```bash
curl -L http://install.ohmyz.sh | sh
chsh 
```

- Login shell to indicates : `/bin/zsh`

[Composer](http://getcomposer.org) (dependency manager for PHP) :

```bash
cd /usr/local/bin
sudo su
curl -s http://getcomposer.org/installer | php
mv composer.phar composer
chmod a+x composer
```

## Fail2ban

Configuration:

- [http://doc.ubuntu-fr.org/fail2ban](http://doc.ubuntu-fr.org/fail2ban)

```bash
sudo cp  /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo vim /etc/fail2ban/jail.local
```

- Add a /etc/fail2ban/filter.d/apache-w00tw00t.conf
- `[DEFAULT] > ignoreip` : add Les Polypodes IP address

# PhpMyAdmin

Configuring PhpMyAdmin: Modify ServerAlias `phpmyadmin` into `VeryVerySecretPhpMyAdmin` in `/etc/apache2/conf-enabled/phpmyadmin.conf`

```bash
vim /etc/apache2/conf-enabled/phpmyadmin.conf
service apache2 reload
```

Creating a dedicated Client SQL User + production database: `TheClient_prod` / `TheClient_prod` / `ThePassword`)

# Creating & configuring a simple local MySQL backup

Backups archives are generated in `/var/backups/mysql` every night at 01:00 via `root` crontab. Backup script uses the `/root/.my.cnf` configuration file to connect into mysql.

Create a `/root/.my.cnf` file:

```
[client]
user=root
pass=ThePassWord
```

Give it appropriate permissions

```bash
chmod 700 /root/.my.cnf
chown root:root /root/.my.cnf
```

Fetch a copy of the backup script onto the server:

```bash
sudo mkdir /var/backups/mysql
sudo chown lespolypodes:root /var/backups/mysql -R
cd /usr/local/bin
sudo curl https://gist.githubusercontent.com/ronanguilloux/1595563/raw/mysqlBackup.sh > automysqlbackup.sh
vim automysqlbackup.sh
```

Configure backup engine, `automysqlbackup.sh` with these options:

- `MYNCF=true`
- `MAILADDR="technical@lespolypodes.com"`
- `LATEST=yes`


## Nightly backups configuration:

(as `root`):

```bash
su
mv automysqlbackup.sh automysqlbackup
chmod a+x automysqlbackup
crontab -e
```

Crontab configuration:
```
# m h  dom mon dow   command
0 1 * * * automysqlbackup
```

Backup manual test (as `root`): 
```bash
cd
automysqlbackup
tree /var/backup/mysql
```

## Appendix

Bash function to generate passwords

```bash
# usage: 
# $~:  genpassword 12
genpasswd() {
    local l=$1
    [ "$l" == "" ] && l=16
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
```

