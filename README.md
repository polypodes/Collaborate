Collaboration
=============


Ce dépôt conserve divers documents libres, ouverts et collaboratifs, partagés avec nos partenaires, dans un esprit et une démarche [_devops_](http://fr.wikipedia.org/wiki/Devops). Les contributions y sont plus que bienvenues !


### A l'intention de votre Hébergeur / Infogéreur :

Le but principal de ce document est de mettre en place un environnement serveur permettant d'automatiser et d'accélerer le processus de livraison en production des versions successives de l'application, pour répondre aux objectifs de réactivité de notre Client commun.

* [Prérequis pour l’hébergement d’applications web](Prerequis-pour-l-hebergement-d-applications-web.md) modernes basées sur PHP (Symfony2, etc.)
* [Prérequis pour l’hébergement et de déploiement de Drupal](Prerequis-pour-le-deploiement-de-Drupal.md) spécifiquement
* [Audit de service pour l'infogérance d’applications web basées sur LAMP](Audit-de-service-pour-l-infogerance-d-application-web.md) : Permet de faire le point sur les garanties de services proposées par ub hébergeur / infogéreur.
* [Checking this server against Drupal 7 requirements](scripts/Drupal/Makefile): PHP required version, extensions & configuration, required Apache2 modules, etc. based on [Drupal official documentation](https://www.drupal.org/requirements).

### A l'intention de votre Directeur Artistique / Agence Créative

Le but principal de ce document est de s'assurer que la création au format PSD livrée par votre Directeur Artistique sera compatible avec les objectifs de Responsive Design de notre Client commun.

* [Prérequis pour la création de fichiers PSD en vue d’une intégration HTML 5 / CSS 3 incluant des objectifs de responsive design](Prerequis-pour-la-creation-de-PSD.md).
 
### Autres documents

* Modèle de courrier pour [valider un environnement de production](Demande-Details-Configuration-De-Production.md) déjà existant, dépourvu d'accès SSH, et devant accueillir une nouvelle application web développée par nous.
* Modèle de [configuration serveur LAMP pour un environnement de développement](LAMP-Server-Installation-Documentation.md)


### Exports

*HTML*:

```bash
[brew/apt-get] install pandoc
make
```

*PDF*: Use [GitPrint](http://gitprint.com) (browser extension or bookmarklet) and go to https://github.com/polypodes/Collaborate.


### Licence

The MIT License (MIT) - Copyright (c) 2013-2014 Les Polypodes - see [LICENSE](LICENSE) file.

