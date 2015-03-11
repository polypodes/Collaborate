![#Les Polypodes](header.png)

# Audit de service pour l'infogérance d’applications web basées sur un serveur dédié

*Résumé* : Ce document liste les pré-requis de l'Agence [Les Polypodes](http://lespolypodes.com/) pour évaluer une infogérance d'application Symfony2 sur un serveur web. Ces éléments sont non exhaustifs : la configuration définitive est laissée à l’appréciation du Client, à la lumière de ces propres exigences. Il reste le donneur d'ordre final.

* version : 1.0.1
* auteurs : [Ronan Guilloux](mailto:ronan@lespolypodes.com), [Les Polypodes](http://lespolypodes.com/) SARL (Nantes, France)
* licence : [CC by-sa 3.0 fr](http://creativecommons.org/licenses/by-sa/3.0/fr/)
* [Ce document libre et ouvert est téléchargeable en ligne](https://github.com/polypodes/Collaborate)

## 1. Contexte

Pour l'infogérance de sites web ou d’applications web basées sur le stack LAMP,
l'agence [Les Polypodes](http://lespolypodes.com/) propose un document non exhaustif de questions à l’intention de l’Hébergeur/Infogéreur retenu par le Client.

Ce document se veut une base de dialogue cordial, un outil de référence pour une coopération réussie entre l'Agence, le Client et l'Hébergeur/Infogéreur, dans l'esprit du mouvement [__devops__](http://fr.wikipedia.org/wiki/Devops).

## 2. But

Le but de ce document est de donner au Client une information claire et complète sur les garanties de services que propose l'Infogéreur qu'il a retenu, et d'évaluer si ces garanties rencontrent bien les attentes du Client en terme de disponibilité de service et de réactivité.

## 3. Rôles et vocabulaire 

* L'Agence [Les Polypodes](http://lespolypodes.com/) est l’agence qui conçoit l’application web, et qui le cas échéant la déploie et/ou en assure la maintenance ;
* l’Hébergeur/Infogéreur est responsable de l’hébergement et/ou de l’infogérance : il assure la sécurité, de la mise à jour et de la surveillance des logiciels serveurs : la pile LAMP (OS GNU/Linux, PHP, Apache2, MySQL), et tous les autres logiciels nécessaires installés sur le serveur. Sauf indications contraires, il n'assure pas l'infogérance de l'application web ;
* le Client final est l'entité qui réalise la commande et la recette de l’application et de son hébergement.

## 4. Éléments à proposer et à faire préciser au prestataire d’hébergement / infogérance

Chacun des points suivants est directement lié à l’infrastructure nécessaire pour le fonctionnement des sites, et donne des garantie de continuité de service pour les utilisateurs des sites web, clients internautes et administrateurs :

### Garantie de service :

- Où trouver le document descriptif des niveaux d'infogérance et niveaux d'alerte
- Les niveaux de SA et de SI sont-ils bien accessibles sur Linux ?
- les prestations d'intervention sont-elle facturées au temps passé ou bien sont-elles forfaitaires ?
- Quel est le tarif (€ht/heure) des prestations d'intervention en HO ? en HNO ?
- Quels sont les conditions et limite du service d'infogérance ? (ex: 1 heure par ticket d’1/4 d’heure d’infogérance /mois/service souscrit). Les tickets sont-ils cumulables (plusieurs questions simultanées possibles) ?

### Livraison du serveur :

- Quelles garanties et quels livrables concernant l’installation et la configuration initiale du serveur

### Garantie d'infrastructure :

- Quelles garanties et quels modes de test concernant le débit de connexions montantes et descendantes des interfaces réseaux
- Quels niveau de supervision propose le prestataire, avec quelles garanties
- Quelles garanties de type “Garantie du Temps de Rétablissement” (GTR), et “Garantie du Temps d’Intervention” (GTI), sur quels horaires et dans quels délais

### Sécurité et garantie sur les mises à jour des logiciels serveurs
- Quelle politique de mise à jour de sécurité et quels moyens se donne l'hébergeur
- Quels délais avant ces interventions de mises à jour de sécurité 
- Quel mode de mise en maintenance des sites web durant ces phases de mise à jour de sécurité
- Quels scénarios et quels modes de communication auprès du Client pour annoncer /réaliser / conclure ces mises à jour de serveur

### Maintenance courante

- Quel niveau de Service infogérance permettrait d’installer de nouveaux paquets nécessaires
- Quelles garanties sur la configuration de la sécurité sur ce serveur : configuration et sécurité des serveurs web, de MySQL, de PHP, configuration firewall, banissement des IP indésirables, conditions d'accès SSH, etc.
- Est-il possible de s'accorder sur un test de ping pour valider que les applicatifs clients (les sites web) sont en bonne état de marche ? ex : *plusieurs*  URLs http (port 80) vers des pages web des sites faisant appels à la base de donnée, à Apache2/Nginx, à PHP, à des services tiers, etc.

### Facilité de dialogue entre l'Agence et l'Hébergeur

- l'Agence a-t-elle la possibilité d'ouvrir elle-même des tickets de demande d'intervention auprès de l'Hébergeur
- Quelle autonomie ou quel mode opératoire pour l’Agence responsable de la maintenance applicative, lorsqu’elle a besoin des opérations suivantes : créer un nouveau vhost, une nouvelle base de donnée, consulter les logs d’accès et d’erreurs d’Apache et/ou de Nginx

### Garantie sur les sauvegardes

- Quelle fréquence de snapshots serveur
- Hors snapshot serveur, quels sont les autres modes de sauvegardes journalières éventuels, le quota de ces sauvegardes, la durée de rétention et les conditions de mise en oeuvre de ces sauvegardes
- Quel est le plan de sauvegarde *et de rétablissement* proposé par l'hébergeur
- Quel est le scénario proposé par le prestataire au sujet de l’utilisation des snapshots serveur ou l’utilisation des sauvegardes des applications et bases de données pour rétablir le service
- Les scénarios de rétablissement sur backups éventuellement proposés par l'Hébergeur font-il l'objet d'un test de crash (conditions réelles de production)
- Quelle procédure et quelle garanties sont données par l'Hébergeur sur le temps de rétablissement, lorsque le Client demande l’utilisation d’un snapshot

### Exemple de tableau décrivant les niveaux d'infogérance et d'alerte attendus :

|Caractéristiques | NIVEAUX D'INFOGERANCE | NIVEAUX D'ALERTE 24/7|
|---|:---:|:---:|
|Maintien opérationnel de l'équipement (disque, ram, proc, alim) | SI0 / SI1 / SI2 / SI3 / SI4 |
|Reboot Electrique Distant ou Local (DC) On Demand auprès du service technique | SI1 / SI2 / SI3 / SI4 |
|Mise à jour des patchs SYSTÈME MINEUR | SI1 / SI2 / SI3 / SI4 |
|Intervention HO | SI1 / SI2 / SI3 / SI4 |
|Intervention HNO | SI3 / SI4 |
|Accès Administrateur Système | SI0 / SI2 / SI4 |
|Redémarrage de services (Apache, mysql, ftp, …) | SI1 / SI2 / SI3 / SI4 |
|Surveillance des ressources matériels (proc ram disque) | SI1 / SI2 / SI3 / SI4 |
|Surveillance joignabilité serveur (Ping) | SI1 / SI2 / SI3 / SI4 | SA1 / SA2 / SA3 |
|Surveillance des services (TCP http, smtp, …) | SI1 / SI2 / SI3 / SI4 | SA2 / SA3 |
|Surveillance des applications (valeur de contrôle) | | SA3 |
|Alertes SMS + E-mail  | | SA1 / SA2 / SA3 |
|Sauvegarde | Souscription de service nécessaire |
|Mise à disposition de la Sauvegarde | Si souscription de service |
|Sorry service (isolation machine) | SI1 / SI2 / SI3 / SI4 |


Prestations ponctuelles pouvant être proposées par l'Hébergeur :

- Prestations / Gestes de proximité Datacenter
- Mise à jour des patchs SYSTÈME MAJEUR
- Mise à jour des patchs SYSTÈME MINEUR (SI 0)
- Restauration de sauvegarde*
- Diagnostic (Attaques, surcharges service, faille, logs, …)
- Reboot Electrique Distant ou Local (DC) On Demand auprès du service technique (SI0)
- Intervention en HO (SI 0)
- Intervention en HNO (SI 0 / SI 1 / SI 2)

(*: Restauration de sauvegarde : 30 mn offertes/mois/VM-SV physique)

- HO : Lundi au Vendredi : 9h00 12h30 / 14h00 18h00 (Hors jours fériés et week-end)
- HNO : Heures Non Ouvrées 24/7
- GTI : Garantie du Temps d'Intervention < 4 heures

## 5. Limites, conseil et assistance

A la lumière des réponses qui lui sont apportées, il revient au Client Final de détailler à l'Hébergeur/Infogéreur les exigences et les attentes qui n'auraient pas encore été satisfaites.

Il revient au Client Final de créer les conditions et les occasions de dialogues entre l’hébergeur et l'Agence pour la bonne conduite et le succès du projet.

L'Agence Les Polypodes se tient prêt à planifier des jours supplémentaires de conseils et d'assistance à maîtrise d'ouvrage pour aider le Client Final dans la conduite de ce projet, sur la base d'une prestation de régie de XXX € jour / homme, frais de déplacement non inclus.


