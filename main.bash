#!/bin/bash

tentatives_max=10
tentatives=${1:-0}  # Prend la valeur du premier argument, 0 si non spécifié
code_secret=${2:-""} # Prend la valeur du second argument, vide si non spécifié

# Définitions des couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Pas de Couleur

# Demander le code secret seulement s'il n'est pas déjà fourni
[[ ${#code_secret} -eq 0 ]] && { echo "Veuillez entrer le code secret (4 chiffres) : "; read -s code_secret; echo; }

# Vérifier le code secret et relancer le script si non valide
[[ ${#code_secret} -eq 4 && $code_secret =~ ^[0-9]+$ ]] || { echo -e "${RED}Erreur : Le code secret doit être de 4 chiffres.${NC}"; exec $0 $tentatives; }

[ $tentatives -eq 0 ] && echo -e "${BLUE}Bienvenue au jeu Mastermind !${NC}"

echo "Tentative $((tentatives+1)) sur $tentatives_max"
read -p "Entrez votre proposition (4 chiffres) : " proposition

longueur=${#proposition}
[[ $longueur -eq 4 && $proposition =~ ^[0-9]+$ ]] || { echo -e "${RED}Erreur : Vous devez entrer exactement 4 chiffres.${NC}"; exec $0 $tentatives "$code_secret"; }

etat_chiffres=""

# Première position
[[ "${proposition:0:1}" == "${code_secret:0:1}" ]] && echo -e "${GREEN}1 correct${NC}" || { [[ $code_secret == *${proposition:0:1}* ]] && echo -e "${YELLOW}1 correct mais mal placé${NC}" || echo -e "${RED}1 incorrect${NC}"; }

# Deuxième position
[[ "${proposition:1:1}" == "${code_secret:1:1}" ]] && echo -e "${GREEN}2 correct${NC}" || { [[ $code_secret == *${proposition:1:1}* ]] && echo -e "${YELLOW}2 correct mais mal placé${NC}" || echo -e "${RED}2 incorrect${NC}"; }

# Troisième position
[[ "${proposition:2:1}" == "${code_secret:2:1}" ]] && echo -e "${GREEN}3 correct${NC}" || { [[ $code_secret == *${proposition:2:1}* ]] && echo -e "${YELLOW}3 correct mais mal placé${NC}" || echo -e "${RED}3 incorrect${NC}"; }

# Quatrième position
[[ "${proposition:3:1}" == "${code_secret:3:1}" ]] && echo -e "${GREEN}4 correct${NC}" || { [[ $code_secret == *${proposition:3:1}* ]] && echo -e "${YELLOW}4 correct mais mal placé${NC}" || echo -e "${RED}4 incorrect${NC}"; }

echo "$etat_chiffres"

[ "$proposition" == "$code_secret" ] && { echo -e "${GREEN}Félicitations, vous avez deviné le code secret qui était $code_secret !${NC}"; exit 0; }

[ $((tentatives+1)) -ge $tentatives_max ] && { echo -e "${RED}Perdu ! Vous avez atteint le nombre maximum de tentatives. Le code secret était : $code_secret.${NC}"; exit 1; }

# Appel récursif
exec $0 $((tentatives+1)) "$code_secret"