#!/bin/bash

tentatives_max=10
tentatives=${1:-0}  # Prend la valeur du premier argument, 0 si non spécifié
code_secret=${2:-""} # Prend la valeur du second argument, vide si non spécifié

# Demander le code secret seulement s'il n'est pas déjà fourni
[[ ${#code_secret} -eq 0 ]] && { echo "Veuillez entrer le code secret (4 chiffres) : "; read -s code_secret; echo; }

# Vérifier le code secret et relancer le script si non valide
[[ ${#code_secret} -eq 4 && $code_secret =~ ^[0-9]+$ ]] || { echo "Erreur : Le code secret doit être de 4 chiffres."; exec $0 $tentatives; }

[ $tentatives -eq 0 ] && echo "Bienvenue au jeu Mastermind !"

echo "Tentative $((tentatives+1)) sur $tentatives_max"
read -p "Entrez votre proposition (4 chiffres) : " proposition

longueur=${#proposition}
[[ $longueur -eq 4 && $proposition =~ ^[0-9]+$ ]] || { echo "Erreur : Vous devez entrer exactement 4 chiffres."; exec $0 $tentatives "$code_secret"; }

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

[ "$proposition" == "$code_secret" ] && { echo "Félicitations, vous avez deviné le code secret qui était $code_secret !"; exit 0; }

[ $((tentatives+1)) -ge $tentatives_max ] && { echo "Désolé, vous avez atteint le nombre maximum de tentatives. Le code secret était : $code_secret."; exit 1; }

# Appel récursif
exec $0 $((tentatives+1)) "$code_secret"