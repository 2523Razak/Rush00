#!/bin/bash

# Jeu de devinette - Nombre Mystère (Version Définitivement Corrigée)
# Problème identifié et résolu

# Génération du nombre mystère
nombre_mystere=$((RANDOM % 100 + 1))
essais=0

echo "Bienvenue dans le jeu du Nombre Mystère !"
echo "J'ai choisi un nombre entre 1 et 100."
echo ""

while true; do
    read -p "Votre proposition : " proposition
    
    # Validation de l'entrée
    if ! [[ "$proposition" =~ ^[0-9]+$ ]] || [ "$proposition" -lt 1 ] || [ "$proposition" -gt 100 ]; then
        echo "Erreur : entrez un nombre entre 1 et 100"
        continue
    fi
    
    ((essais++))
    
    # CORRECTION DÉFINITIVE (le problème était ici)
    if [ "$proposition" -eq "$nombre_mystere" ]; then
        echo "Bravo ! Vous avez trouvé en $essais essais !"
        break
    elif [ "$proposition" -lt "$nombre_mystere" ]; then
        echo "C'est PLUS GRAND que $proposition"  # Si proposition < mystère
    else
        echo "C'est PLUS PETIT que $proposition"  # Si proposition > mystère
    fi
done
