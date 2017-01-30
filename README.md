# Galactic Empire

## Projet d'application Web - 2ème semestre

### Technologies utilisées:

* Ruby on Rails

### Auteurs:

* Guillaume Petitpierre
* Cyril Ruedin
* Nicolas Sommer

### Comment lancer ?

Premièrement, il faut vous assurer que Docker et Docker Compose soient installés sur votre machine, et soient mis à jour. (Docker v1.13.0 et Docker Compose v1.10.0 fonctionnent)

Ensuite, il suffit de construire l'environnement, à l'aide de la commande `docker-compose build`. Cette commande devra être executée après chaque modification dans les fichiers `Dockerfile` et `Gemfile`.

Dès que les machines ont été créées, il suffit de les lancer avec la commande `docker-compose up`.

Si la base de données n'a pas été créée, il faut le faire avec la commande `docker-compose run web rails db:create` pendant que l'environnement tourne. De manière générale, toutes les commandes `rails` peuvent être exécutées de la sorte. Par exemple, pour générer un controlleur _Home_ avec une action _index_, il suffit de taper `docker-compose run web rails generate controller Home index`.

#### Petite astuce

Si vous travaillez sous Linux, la commande `docker-compose run ...` peut être longue à taper. Pensez à faire un alias !
