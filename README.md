# Mastermind_Project
Mastermind project in Linux (Debian)

    Prérequis
Un système d'exploitation Linux ou Unix (comme macOS) ainsi qu'un interpréteur de commandes Bash

    Installation
Clonez le dépôt dans votre environnement local en utilisant la commande suivante :
git clone https://github.com/gonicolas12/Mastermind_Project.git

    Comment Jouer ?
Lancez le script en utilisant la commande suivante :
./main.bash
Le jeu commencera et vous demandera d'abord de saisir le code secret. Ensuite, une proposition de 4 chiffres vous sera demandée.
Le script vous indiquera pour chaque chiffre si vous avez deviné correctement ou non.
Continuez à faire des propositions jusqu'à ce que vous deviniez le code secret ou que vous atteigniez le nombre maximum de tentatives.

    Règles du Jeu
Le code secret est composé de quatre chiffres distincts.
Après chaque tentative, le jeu vous indiquera pour chaque chiffre si vous avez trouvé le bon chiffre et à la bonne position.
Vous avez un nombre limité de tentatives pour deviner le code secret.

    Personnalisation
Vous pouvez modifier le script pour changer le nombre de tentatives autorisées en modifiant la variable tentatives_max dans le script.
