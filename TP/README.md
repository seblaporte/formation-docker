![](logo_apside.png)


# TP Docker

## Pré-requis

Docker & Docker-compose sous Linux de préférence

Les sources nécessaires à la réalisation du TP sont à récupérer sur GitHub :

```bash
git clone https://github.com/seblaporte/formation-docker.git
```

## Partie 1

Dans cette première partie du TP, l'objectif est de prendre en main Docker et Docker-compose en déployant un site web statique au moyen d'un serveur Nginx.

__Exigences__ :

- Le service doit être accessible sur le port TCP 8080 de la machine hôte
- Les sources du site web doivent être embarquées dans le conteneur Docker
- Image à utiliser : `ubuntu`

### Étape 1 : Déploiement avec Docker

Pour cette première étape, il est démandé d'utiliser uniquement Docker pour déployer le service Nginx.

### Étape 2 : Déploiement avec Docker-compose

En reprenant le travail effectué à l'étape 1, utilisez Docker-compose pour déployer le serveur Nginx. 

## Partie 2

Application à déployer :

- Langage : Node.JS
- Description : API REST permettant d'obtenir des informations sur un utilisateur et son mot de passe de connexion. Documentation de l'API disponible dans les sources, dossier `doc`.

Image à utiliser : Dans cette seconde partie, il est demandé d'utiliser un build multi-stage pour limiter la taille du livrable.

### Informations sur l'application

L'API permet de récupérer des informations au moyen d'une base de données MySQL.

L'application est paramètrable au moyen de variables d'environnement :

- ENV : Si cette variable d'environnement a pour valeur `dev`, les logs permettent le debug de l'application.
- DB_HOST : Nom d'hôte de la base de données
- DB_USER : Nom d'utilisateur pour la connexion à la BDD
- DB_PASSWORD : Mot de passe pour la connexion à la BDD
- DB_DATABASE : Nom de la base pour la connexion à la BDD
- DB_PORT : Port TCP utilisé par l'application

### Objectif

- Permettre le déploiement d'une API Node.JS et de sa base de données avec Docker
- Disposer d'un déploiement pour un poste de développeur et un déploiement de production
- Poste de développement : Modification du code source avec prise en compte à chaud des modifications dans le conteneur (voir [nodemon](https://github.com/remy/nodemon))
- Proposer une solution à la définition du mot de passe de la base de données (Ne doit pas être stocké dans les sources)

### Étape 1 : Déploiement avec Docker-compose

L'objectif dans cette première étape est de déployer l'application en utilisant Docker et en automatisant avec Docker-compose.

### Étape 2 : Création d'une version permettant 2 types de déploiement

Cette seconde étape a pour o Ressources

- Image officielle Alpine Linux : [https://hub.docker.com/_/alpine/](https://hub.docker.com/_/alpine/)
- Image officielle MySQL : [https://hub.docker.com/_/mysql/](https://hub.docker.com/_/mysql/)
- Hot-reload Node.JS : [https://github.com/remy/nodemon](https://github.com/remy/nodemon)