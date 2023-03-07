# EyeTracker

Ce projet vise à développer un assistant de communication pour les personnes atteintes de handicaps moteurs. L'utilisateur pourra sélectionner une des réponses proposées sur un écran en utilisant son regard. L'application est basée sur la technologie Tobii Eye Tracker, qui détecte l'emplacement du regard sur une interface graphique.

L'application permet également à un aidant d'enregistrer un ensemble de questions et de leurs réponses associées dans une base de données pour une utilisation ultérieure. Deux interfaces graphiques ont été réalisées en Python, l'une plus ergonomique qui est l'interface finale, l'autre plus simple qui sert à effectuer les tests de l'application. 

# Architecture
Les interfaces se trouvent respectivement dans les dossiers "projecteyetracker" et "ProjectEyeTracker2". Ces dossiers contiennent un fichier "assets" qui contient les images, les données, la licence et les pages de QML pour la seconde interface.

Le dossier "src" contient les scripts Python de l'application. Les fichiers sont organisés de la manière suivante :

"main.py" : lance l'application
"reader_csv.py" : gère la base de données des questions et des réponses

Pour lancer la premier il faut appeler la commande :
python projecteyetracker/src/main.py

Pour la seconde :
python ProjectEyeTracker2/src/main.py

##### Voici les bibliothèques et frameworks à installer pour chaque interface :

Pour la première interface :

Tkinter est inclus dans la distribution standard de Python, il n'est donc pas nécessaire de l'installer.
(" pip install tk" )
Pour la seconde interface :
Qt, le framework d'interface graphique, doit être installé : "pip install PyQt5"

PySide2, la bibliothèque Python pour l'utilisation de Qt, doit être installée en utilisant la commande suivante : "pip install PySide2"

# Docker