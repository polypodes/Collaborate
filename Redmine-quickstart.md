# Prise en main rapide de Redmine

Ce guide décrit les usages les plus courants de l’outil Redmine.  Nous n’aborderons pas l’administration ou la configuration des projets, des utilisateurs… etc

**C’est un guide de prise en main rapide pour une utilisation quotidienne de l’outil**.


## Définition de l’outil

Redmine est dédié à la gestion de projet et permet d’améliorer le suivi d’un projet en centralisant beaucoup d’aspects de la gestion d’un projet et de limiter les échanges par d’autres canaux de communication (Email, tchats, téléphone…)

Redmine gère donc les nombreux aspects d’un projet :

* **Des membres**, les personnes agissant au sein d’un projet;
* **Des demandes**, les tâches à effectuer par les membres du projet;
* **Des annonces**, un outil permettant de suivre l’actualité du projet;
* **Des documents**, comme son nom l’indique, un espace dédié au stockage de documents;
* **Un wiki**, permettant de renseigner un projet, les infos de connexion, les spécificités du projet, etc;
* **Une roadmap**, l’organisation des demandes selon des cycles de vie du projet;

Ce sont les outils de Redmine dès son installation mais certains plugins peuvent lui ajouter des nouvelles fonctionnalités.

## Prise en main
### 1. S’identifier

(Les images présentées peuvent varier selon votre installation de Redmine ou le thème attaché à votre profil utilisateur.)

Rendez-vous sur l’adresse de votre Redmine.

![ident]

Saisissez vos identifiant et mot de passe. Sélectionnez la case à cocher *Rester connecté* pour éviter de voir cet écran à chacune de vos connexion.

### 2. L’accueil

Vous arrivez alors sur un écran vous présentant les dernières annonces et une liste des projets ayant été mis à jour récemment.

Une barre de navigation située en haut vous permet d’accéder à *Accueil, Ma page, Projets et Aide*.

**Accueil** : La page d’accueil de Redmine (la page courante)
**Ma page** : Une page listant plusieurs infos vous concernant
**Projets** : La liste de vos projets
**Aide** : Un lien vers la documentation officielle de Redmine en Anglais.

### 3. Page *Ma page*

Rendez-vous sur le lien *Ma page* (Situé en haut à droite). Par défaut cette espace vous propose :

* **les demandes** qui vous sont directement assignées;
* **Un calendrier** vous proposant une disposition calendaire des infos de vos projets;
* **Un résumé du temps passé** sur les demandes liées à vos projets;
* **Annonces**, une reprise des dernières annonces déjà présentes sur la page d’accueil.

Cette page est personnalisable et vous permet d’ajouter et supprimer des outils complémentaires tout simplement en cliquant sur le lien situé en haut à droite *Personnaliser cette page*.

Essayez de modifier cette espace personnel selon vos besoins.

### 4. Page *Projets*

**Permet d’avoir une liste des projets présents dans Redmine. De cet écran il est possible**.

* D’accéder à la page d’un projet particulier;
* De créer un nouveau projet;
* De lister toutes les demandes;
* D’avoir un aperçu du temps passé sur ces projets;
* et une page listant l’activité globale sur l’application.


### 5. Page du projet (Aperçu)

À partir de la page *Projets* sélectionnez un projet.

L’écran affiché vous présente une navigation liée au projet (*Aperçu, activité, Roadmap, Demandes*…) et le tableau de bord de votre projet composé de plusieurs outils :

#### 5.0 Onglet *Aperçu*

* **Suivi des demandes** : Un aperçu sur l’ensemble des demandes du projet;
* **Membres** : La liste des utilisateurs présents dans le projet selon leur profils;
* **Dernières annonces** : Les derniers messages de l’onglet *Annonces* du projet;
* **Des outils complémentaires**, permettant de saisir des temps sur le projet, de créer un nouveau sous-projet ou de fermer le projet en cours.

#### 5.1 Onglet *Activités*

Tous les événements qui se sont déroulés sur le projet (Annonces, nouvelles demandes…).

#### 5.2 Onglet *Roadmap*

Permet de gérer des versions du projet, de voir l’avancée de ces versions et les demandes qui y sont rattachées.

#### 5.3 Onglet *Demandes*

La liste des demandes liées à un projet.

Au-dessus de la liste des demandes **un filtre plus complet** permettant de lister les demandes selon des critères poussés. À noter qu’il est possible d’enregistrer ces filtres afin de pouvoir les utiliser par la suite (ils sont alors présents dans la colonne de droite de l’écran).

Sur la droite de l’écran, des filtres pré-enregistrés permettant de limiter la liste des demandes aux critères proposés.

##### 5.3.1 Une demande 

En cliquant sur une des demandes de la liste des demandes on arrive sur l’écran de détail de la demande permettant d’avoir une vue complète de la demande, ses infos de status, de priorité, d’assignation, les échanges qui y sont attachés, etc.

Une demande à un numéro d’identification indiqué par le symbole # suivi d’un numéro unique. (Ex. #3821)

Une barre d’outil est présente au-dessus de la fiche demande et permet d’effectuer plusieurs tâches.

![sc03]

L’essentiel de l’échange au sein d’un tâche se fait par le biais du bouton *Modifier* qui propose l’écran suivant :

![sc043]

Les éléments essentiels à comprendre de cet écran :

* **Le sujet**, l’intitulé de la demande;
* **La description** permet de fournir plus d’information à une demande en particulier;
* **Le statut** est l’état de la demande (ce qui peut être différent selon votre propre outil);
* **Priorité** définit une urgence particulière pour la demande;
* **Assigné à** permet d’attacher une demande à un membre du projet et de l’alerter par email de la mise à jour de cette tâche;
* **Catégorie** permet de donner un thème à la tâche: développement, intégration, graphisme, SEO… (ces options sont aussi variables selon votre installation de Redmine);
* **% réalisé** le niveau d’avancement de la tâche;
* **Temps passé**, simple à comprendre, permet d’ajouter du temps sur la tâche;
* **Notes**, un espace permettant de commenter la modification que l’on fait sur la demande;
* **Fichiers**, permet d’attacher des documents à la demande.




## FAQ

**Qu’est-ce qu’une demande** ?

Dans l’idéal une demande désigne une tâche à effectuer et devrait commencer par un verbe évoquant cette action.
*Ex. Valider la proposition graphique de la bannière, Corriger la couleur des liens…*.
Les verbes couramment rencontrés : Ajouter, supprimer, corriger, valider, renseigner, saisir, modifier…

Une demande fonctionne sur le principe d’un message que l’on transmet en l’assignant à quelqu’un, cette assignation est importante car elle permet au destinataire de la demande d’être notifié de cette modification.

**Je viens de recevoir une demande**

Vous venez de recevoir un email avec une demande. Suivez simplement le lien fourni dans l’email pour la consulter.

**Je souhaite effectuer cette demande**

Selon ce qui est demandé dans la tâche vous pouvez renseigner différents champs répondant à la demande: 

* **Répondre** simplement en saisissant une info dans l’espace *Notes*;
* **Fournir un document** en utilisant le formulaire *Fichiers*;
* **Changer le statut** d’une tâche, pour la fermer, la rejeter… (selon les statuts proposés dans votre Redmine);

**Une fois la demande effectuée vous pouvez assigner cette tâche à l’émetteur pour qu’il en soit informé**.

**Je souhaite créer une tâche**

Il vous faut aller dans le bon projet et tout simplement cliquer sur l’onglet *Nouvelle demande* et l’assigner par exemple à la personne en charge de votre projet.




[ident]: redmine-qs-images/sc01.png
[sc02]: redmine-qs-images/sc02.png
[sc03]: redmine-qs-images/sc03.png
[sc043]: redmine-qs-images/sc04.png





