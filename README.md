Bienvenue sur la mini app Arenametrix !

Après avoir `git clone` le projet et `cd` dedans, pensez à `bundle` puis à `rails db:create db:migrate`.

Vous pouvez dès à présent aller sur la page upload, puis allez chercher l'excel dédié à cet exercice dans vos dossier.

Une fois cette étape réalisée, vous pouvez aller sur la page statistique constater que les datas ont bien été uploadés. 

La logique de l'import a été extraite du controller statistique vers un service dédié. 

L'analyse des datas à mené à l'architecture suivante : 

<img width="778" alt="Capture d’écran 2024-04-17 à 03 59 54" src="https://github.com/JonathanPreminger/Arena/assets/43544014/5e368654-6444-4ea9-b464-dad9311084f5">

Certains champs ont été définis comme unique afin garantir l'absence de doublons au sein de la base de donnée (exemple: last_name sur la table user). 
L'unicité porte généralement sur l'email dans le cas d'un user, on aurait pu appliquer cette logique.

Le recours au scope a permis d'éviter la répétition de code. 

Pour une meilleure performance sur le rendu de la page statistiques on a utilisé l'appel par batch (find_each) de 1000 (valeur par default) sur l'affichage des Representation et de leur prix moyen. Pour tendre vers une performance encore meilleure, l'utilisation d'`includes` aurait permis de faire de grandes économies de requête.

Les fonctionalités de base de l'exercice ont été réalisés et une fonctionalité optionnel à été rajouté, à savoir la possibilité d'avoir des datas sur un spectacle précis. 
À ce sujet la logique de calcul des différentes données aurait pu être extraite vers un service dédié. 

L'ajout de la fonctionalité `dependent: :destroy` entre les parents et enfants a été écarté, on veut parfois conserver la data même si un utilisateur se désinscrit (à ce moment on peut l'archiver par exemple, ainsi que ses réservations).

Je vous remercie pour votre attention, et à bientôt !



