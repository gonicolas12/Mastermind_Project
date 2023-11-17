#!/bin/bash
 
code_secret="7632"
tentatives_max=10
tentatives=${1:-0}  # Prend la valeur du premier argument, 0 si non spécifié
 
[ $tentatives -eq 0 ] && echo "Bienvenue au jeu Mastermind !"
 
echo "Tentative $((tentatives+1)) sur $tentatives_max"
 
read -p "Entrez votre proposition (4 chiffres) : " proposition
 
# Vérifier que la saisie est de 4 chiffres exactement
longueur=${#proposition}
[[ $longueur -eq 4 && $proposition =~ ^[0-9]+$ ]] || { echo "Erreur : Vous devez entrer exactement 4 chiffres."; exec $0 $tentatives; }
 
etat_chiffres=""
 
# Première position
[[ "${proposition:0:1}" == "${code_secret:0:1}" ]] && etat_chiffres+="1 correct. " || { [[ $code_secret == *${proposition:0:1}* ]] && etat_chiffres+="1 correct mais mal placé. " || etat_chiffres+="1 incorrect. "; }
 
# Deuxième position
[[ "${proposition:1:1}" == "${code_secret:1:1}" ]] && etat_chiffres+="2 correct. " || { [[ $code_secret == *${proposition:1:1}* ]] && etat_chiffres+="2 correct mais mal placé. " || etat_chiffres+="2 incorrect. "; }
 
# Troisième position
[[ "${proposition:2:1}" == "${code_secret:2:1}" ]] && etat_chiffres+="3 correct. " || { [[ $code_secret == *${proposition:2:1}* ]] && etat_chiffres+="3 correct mais mal placé. " || etat_chiffres+="3 incorrect. "; }
 
# Quatrième position
[[ "${proposition:3:1}" == "${code_secret:3:1}" ]] && etat_chiffres+="4 correct. " || { [[ $code_secret == *${proposition:3:1}* ]] && etat_chiffres+="4 correct mais mal placé. " || etat_chiffres+="4 incorrect. "; }
 
echo "$etat_chiffres"
 
[ "$proposition" == "$code_secret" ] && { echo "Félicitations, vous avez deviné le code secret : $code_secret !"; exit 0; }
 
[ $((tentatives+1)) -ge $tentatives_max ] && { echo "Désolé, vous avez atteint le nombre maximum de tentatives. Le code secret était : $code_secret."; exit 1; }
 
# Relancer le script pour une nouvelle tentative avec le compteur de tentatives mis à jour
exec $0 $((tentatives+1))