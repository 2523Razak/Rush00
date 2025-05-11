#!/bin/bash

# === CONFIGURATION ===
NB_QUESTIONS_TOTAL=20
QUESTIONS_PAR_JEU=5
PV_INITIAL=100
PERTE_PV=20
GAIN_POINTS=20

# === COULEURS ===
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[1;33m'
BLEU='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

# === BANQUE DE QUESTIONS ===
questions=(
    # Unix C00
    "Quelle commande affiche 'Hello, World!'?|echo 'Hello, World!'"
    "Comment formater la date en 'AAAA-MM-JJ HH:MM:SS'?|date '+%Y-%m-%d %H:%M:%S'"
    "Commande pour lister les fichiers cachés?|ls -a"
    "Comment créer un dossier 'mon_projet'?|mkdir mon_projet"
    "Vérifier si 'fichier.txt' existe?|[ -f fichier.txt ]"
    "Comment rendre un script exécutable?|chmod +x"
    "Afficher le répertoire courant?|pwd"
    "Rediriger 'ls' vers un fichier?|ls > liste.txt"
    
    # Culture Niger
    "Capitale du Niger?|Niamey"
    "Fleuve principal du Niger?|Le Niger"
    "Désert au nord du Niger?|Le Sahara"
    "Monnaie du Niger?|Franc CFA"
    "Voisin NON frontalier du Niger?|Le Ghana"
    "Festival célèbre à Agadez?|Festival de l'Aïr"
    
    # Énigmes
    "Grand jeune, petit vieux?|Une bougie"
    "Plus on prend, plus on laisse?|Un pas"
    "A des villes mais pas de maisons?|Une carte"
    "Peut voler sans ailes?|Le temps"
    "13 cœurs mais pas d'organes?|Un jeu de cartes"
    "Plus je sèche, plus je suis mouillé?|Une serviette"
)

# === INTRODUCTION ===
clear
echo -e "${JAUNE}🌟 BIENVENUE DANS LE QUIZ TERMINAL 🌟${RESET}"
echo -e "\nCe jeu vous propose ${QUESTIONS_PAR_JEU} questions mélangeant :"
echo -e "- ${CYAN}Commandes Unix${RESET} (niveau C00)"
echo -e "- ${VERT}Culture nigérienne${RESET}"
echo -e "- ${BLEU}Énigmes logiques${RESET}"
echo -e "\nVous démarrez avec ${ROUGE}${PV_INITIAL} PV${RESET}"
echo -e "Bonne réponse : ${VERT}+${GAIN_POINTS} points${RESET}"
echo -e "Erreur : ${ROUGE}-${PERTE_PV} PV${RESET}"

# === DEMANDE DE CONFIRMATION ===
read -p $'\nVoulez-vous jouer ? (oui/non) : ' choix
if [[ "${choix,,}" != "oui" && "${choix,,}" != "o" ]]; then
    echo -e "\n${ROUGE}A bientôt !${RESET}"
    exit 0
fi

# === LANCEMENT DU JEU ===
clear
echo -e "${JAUNE}Démarrage du quiz... Bonne chance !${RESET}\n"
sleep 1

# === SÉLECTION ALÉATOIRE ===
mapfile -t questions_choisies < <(shuf -e "${questions[@]}" -n ${QUESTIONS_PAR_JEU})

# === BOUCLE DE JEU ===
score=0
pv=${PV_INITIAL}

for (( i=0; i<${QUESTIONS_PAR_JEU}; i++ )); do
    clear
    echo -e "${JAUNE}=== QUESTION $((i+1))/${QUESTIONS_PAR_JEU} ==="
    echo -e "PV: ${ROUGE}${pv}/${PV_INITIAL}${RESET} | Score: ${VERT}${score}${RESET}\n"
    
    IFS='|' read -r question reponse <<< "${questions_choisies[$i]}"
    echo -e "${BLEU}${question}${RESET}"
    read -p "> Votre réponse: " reponse_utilisateur
    
    if [ "${reponse_utilisateur,,}" = "${reponse,,}" ]; then
        echo -e "\n${VERT}✔ Correct! (+${GAIN_POINTS} points)${RESET}"
        ((score += ${GAIN_POINTS}))
    else
        echo -e "\n${ROUGE}✖ Faux! Réponse: ${reponse} (-${PERTE_PV} PV)${RESET}"
        ((pv -= ${PERTE_PV}))
    fi
    
    sleep 1
    
    if [ ${pv} -le 0 ]; then
        echo -e "\n${ROUGE}💀 PLUS DE PV ! Fin du jeu...${RESET}"
        break
    fi
done

# === RÉSULTATS ===
clear
echo -e "${JAUNE}=== RESULTATS FINAUX ==="
echo -e "Score : ${VERT}${score}/$((QUESTIONS_PAR_JEU * GAIN_POINTS))${RESET}"
echo -e "PV restants : ${ROUGE}${pv}/${PV_INITIAL}${RESET}"

if [ ${score} -eq $((QUESTIONS_PAR_JEU * GAIN_POINTS)) ]; then
    echo -e "\n${VERT}🎉 PARFAIT ! Vous êtes un champion !${RESET}"
elif [ ${score} -ge $((QUESTIONS_PAR_JEU * GAIN_POINTS / 2)) ]; then
    echo -e "\n${JAUNE}👍 Bon score ! Vous pouvez encore progresser.${RESET}"
else
    echo -e "\n${ROUGE}💪 Continuez à vous entraîner !${RESET}"
fi

echo -e "\n${CYAN}Merci d'avoir joué !${RESET}"
