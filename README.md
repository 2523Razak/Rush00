# Rush00

# Jeu du Nombre Mystère en Bash

*Un projet de script Bash interactif avec gestion des couleurs et validation d'entrée*

## Présentation
Dans le cadre de notre projet d'équipe, nous avons développé un script Bash implémentant le jeu classique du "Nombre Mystère". Le joueur doit deviner un nombre aléatoire entre 1 et 100 en maximum 10 tentatives.

## Fonctionnalités détaillées

### Affichage en couleur
Nous utilisons des codes ANSI pour une expérience utilisateur améliorée :
```bash
RED='\033[0;31m'    # Messages d'erreur
GREEN='\033[0;32m'  # Messages de réussite
YELLOW='\033[1;33m' # Indices (plus grand/plus petit)
NC='\033[0m'        # Réinitialisation des couleurs
```

### Génération aléatoire
Le nombre mystère est généré ainsi :
```bash
nombre_mystere=$((RANDOM % 100 + 1))  # Nombre entre 1 et 100
```

### Mécanisme de jeu
- Variables clés :
  ```bash
  essais=0           # Compteur de tentatives
  essais_max=10      # Limite d'essais
  trouve=false       # Statut de la partie
  ```
- Boucle principale :
  ```bash
  while [ $essais -lt $essais_max ] && [ "$trouve" = false ]; do
    # Logique du jeu...
  done
  ```

### Validation des entrées
Le script vérifie que l'entrée est bien un nombre entre 1 et 100 :
```bash
if [[ "$proposition" =~ ^[0-9]+$ ]] && [ "$proposition" -ge 1 ] && [ "$proposition" -le 100 ]; then
    # Entrée valide
else
    echo -e "${RED}Erreur : entrez un nombre entre 1 et 100!${NC}"
fi
```

## Exemple d'exécution
```
Bienvenue dans le jeu du Nombre Mystère!
Je pense à un nombre entre 1 et 100. Saurez-vous le deviner en 10 essais maximum?

Essai n°1/10 - Entrez votre proposition (1-100) : 50
C'est plus grand!
Il vous reste 9 essai(s).

Essai n°2/10 - Entrez votre proposition (1-100) : 75
C'est plus petit!
Il vous reste 8 essai(s).

[...]

Félicitations! Vous avez trouvé le nombre mystère 73 en 7 essais!
```

## Ce que nous avons appris
Ce projet nous a permis de :
- Maîtriser davantage la syntaxe Bash
- Implémenter des structures de contrôle (boucles, conditions)
- Gérer la validation des entrées utilisateur
- Utiliser les couleurs ANSI pour l'interface
- Développer un script interactif et robuste

## Installation & Exécution
1. Rendez-le exécutable :
   ```bash
   chmod +x nombre_mystere.sh
   ```
2. Lancez le jeu :
   ```bash
   ./nombre_mystere.sh
   ```

## Auteurs
- Razak
- Hadiza
