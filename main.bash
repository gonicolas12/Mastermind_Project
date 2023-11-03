#!/bin/bash
 
code_secret="7632"
 
echo "Bienvenue au jeu Mastermind !"
echo "Entrez votre proposition (4 chiffres) :"
read proposition
 
# Vérifie chaque chiffre de la proposition avec le code secret
[ "${proposition:0:1}" == "${code_secret:0:1}" ] && echo "Chiffre 1 correct." || echo "Chiffre 1 incorrect."
[ "${proposition:1:1}" == "${code_secret:1:1}" ] && echo "Chiffre 2 correct." || echo "Chiffre 2 incorrect."
[ "${proposition:2:1}" == "${code_secret:2:1}" ] && echo "Chiffre 3 correct." || echo "Chiffre 3 incorrect."
[ "${proposition:3:1}" == "${code_secret:3:1}" ] && echo "Chiffre 4 correct." || echo "Chiffre 4 incorrect."
 
# Vérifie si la proposition est correcte
[ "$proposition" == "$code_secret" ] && echo "Félicitations, vous avez deviné le code secret : $code_secret !" || echo "Désolé, vous n'avez pas réussi à deviner le code secret : $code_secret."