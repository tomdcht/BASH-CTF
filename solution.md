# Solution 

**Étape 1 : Découverte de l’arborescence**
Lancer le challenge :
```bash
./start
```
Explorer le dossier `~/treasure/` :
```bash
ls ~/treasure/
```
Observation : plusieurs dossiers au nom de pirates (Barbe_Noire, Anne_Bonny, Mary_Read, …). Chaque dossier contient un fichier `funfact.txt`.

-----------------------------
**Étape 2 : Lecture des indices**

Parcourir les fichiers :
`cat Charles_Vane/funfact.txt`

Contenu :
`Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie.`
→ Indice que seuls les membres du groupe pirates pourront progresser.

Vérifier les permissions spéciales :

ls -ld Anne_Bonny


→ rwxr-x--- (750), accessible uniquement par le groupe pirates.

Étape 3 : Rejoindre le groupe pirates

Ajouter l’utilisateur courant au groupe pirates :

sudo usermod -aG pirates $USER
newgrp pirates


→ Permet maintenant d’entrer dans Anne_Bonny/.

Étape 4 : Trouver le script caché

Lire le fichier funfact.txt de Anne_Bonny :

cat Anne_Bonny/funfact.txt


Contenu :

script a exécuter


Lister le contenu :

ls Anne_Bonny/


→ Le script est présent (ex. script.sh).

Étape 5 : Exécuter le script

Rendre le script exécutable et l’exécuter :

chmod +x Anne_Bonny/script.sh
./Anne_Bonny/script.sh


Le script lance un processus en arrière-plan contenant le flag.

Étape 6 : Analyser les processus

Lister les processus liés au script :

ps aux | grep script


ou

ps -ef | grep Anne_Bonny


Observation : un processus contient en mémoire le flag.

Étape 7 : Récupérer le flag dans le processus

Examiner la mémoire ou la commande lancée :

ps -ef | grep FLAG


ou, si besoin, utiliser strings sur /proc/<PID>/environ ou /proc/<PID>/cmdline :

strings /proc/<PID>/environ | grep FLAG


Résultat attendu :

FLAG{mot_de_passe_du_pirate}

Flag final
FLAG{Tresor_Pirate_2025}
