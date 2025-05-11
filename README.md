# Rush00

   ***Quiz Terminal***  

**🎯 Description du Projet**  
Ce script Bash est un **jeu de quiz interactif en terminal** qui teste vos connaissances sur **les commandes Unix (niveau C00)**, la **culture nigérienne**, et des **énigmes logiques**. Le jeu sélectionne aléatoirement **5 questions** parmi une banque de 20, avec un système de **points de vie (PV)** et de **score**.  

**✨ Fonctionnalités**  
- ✅ **5 questions par partie** (choisies aléatoirement parmi 20)  
- ❤️ **Gestion des PV** (100 PV initiaux, -20 PV par erreur)  
- 🏆 **Calcul du score** (+20 points par bonne réponse)  
- 🎨 **Interface colorée** pour une meilleure expérience utilisateur  
- 🔍 **Validation intelligente** (insensible à la casse et aux espaces)
   
- 📊 **Résultats détaillés** à la fin du jeu  

**📚 Thèmes des Questions**  

1. ***Commandes Unix (C00)*** : `echo`, `mkdir`, `ls`, `date`, etc.
  
3. ***Culture nigérienne***
   
5. ***Géographie, histoire, traditions***
   
7. **Énigmes** : Devinettes logiques et jeux de mots  

***Comment Utiliser ?***  
```bash
chmod +x quiz_terminal.sh  # Rend le script exécutable
./quiz_terminal.sh         # Lance le jeu
```

***🛠️Structure du Code*** 

- **Configuration** : Variables pour personnaliser le jeu (PV, nombre de questions, etc.)
  
- **Banque de questions** : Un tableau Bash avec des questions/réponses au format `"Question|Réponse"`
  
- **Boucle principale** : Gère le déroulement du jeu, vérifie les réponses et met à jour le score

- **Affichage dynamique** : Messages colorés et feedback immédiat  

**📦 Personnalisation**  
- **Ajouter des questions** : Modifiez le tableau `questions` dans le script.  
- **Changer la difficulté** : Ajustez `PV_INITIAL`, `PERTE_PV` ou `GAIN_POINTS`.  

**🌟 Pourquoi ce Projet ?**  
- Idéal pour **réviser les commandes Unix** de manière ludique  
- Parfait pour un **projet d'équipe** (ajout de questions collaboratif)  
- Correspond aux **exigences du Rush "Terminal Hero"** (script Bash, gestion des erreurs, interactivité)  

***Exemple de Sortie**  
```
🌟 QUIZ TERMINAL 🌟  
Question 1: Comment créer un dossier 'test' ?  
> mkdir test  
✅ Correct! (+20 points)  
PV: 100/100 | Score: 20  
[...]  
=== RESULTATS ===  
Score final : 80/100  
PV restants : 60/100  
👍 Bon travail !  
```  

**🔗 Licence**  
Libre d'utilisation et de modification (projet éducatif).  
