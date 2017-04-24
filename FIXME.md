# Le fix me

## Installation

- un docker-compose,yml top! Et le reste? assets, migrations, etc.?
    - du coup, j'ai fait `db:migrate db:seed`
    - et lancé `bundle exec sidekiq`
- bibliothèques non à jour... e.g. Rails 5.0.2
- pas de configuration basée sur les variables d'environnement (12factors)
- déploiement sur le serveur srvz qui bourre les logs... pas cool.

## Ruby

- le paradis des SELECT N+1..
- `admin_controller`?.
- spatioport, laboratory, etc. sont des types de batiment et pour chaque type, vous créez : un contrôleur, des vues, des check...
- grave problme de read-write conflict
- la tâche faite dans le worker est particulièrement bonne.
- formulaire AJAX envoyés en GET. Le problème de GET est que votre résultat peut être mis en cache.

## UX

- On ne pige rien. Que se passe-t-il?
- Il existe plein de ressources pour obtenir des images cools e.g. opengameart.org ou itch.io, on ne s'y croit pas.
- Il manque une bibliothèque JS pour aller avec bootstrap...
