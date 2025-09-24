# Solution – BASH-CTF

## Étape 1 : Lancer le challenge

```bash
./start
```
Un fichier **README.md** est déjà présent à la racine de `~/challenge/`.
Son rôle est d’introduire le contexte, mais il sert aussi de premier indice :
*Va voir chez les super-héros : un d’entre eux porte un signe distinctif* soit aller dans le groupe `superheros` et regarder les permissions des dossiers.

---

## Étape 2 : Identifier le dossier spécial (Hulk)
Lister les permissions des dossiers :
```bash
ls -ld ~/challenge/*
```

Observation : un seul dossier se distingue par ses droits :
* `superheros/Hulk` → rwxr-xr-- (754)

Entrer dedans :
```bash
cd ~/challenge/superheros/Hulk
cat funfact.txt
```

Contenu :
```bash
Le trésor n’est pas accessible aux simples curieux.
Seuls les pirates peuvent ouvrir la voie.
```
→ Conclusion : il faut appartenir au groupe **pirates** pour progresser.

Action nécessaire : changer de groupe
```bash
sudo usermod -aG pirates $USER
newgrp pirates
```
---

## Étape 3 : Piste d’Anne Bonny
En explorant les dossiers pirates :

```bash
ls ~/challenge/pirates
cd ~/challenge/pirates/Anne_Bonny
cat funfact.txt
```

Message trouvé :

```
Un vrai pirate garde toujours son drapeau dans sa propre cale.
Retourne à ton logis et hisse-le haut.
```
→ Cela suggère de se tourner vers le **compte luffy** dans `/home/` pour poursuivre l’aventure.

---

## Étape 4 : Explorer le home de Luffy
```bash
cd /home/luffy
ls
```
Contenu :
* `README.txt`
* `flag.sh`

Lire le `README` :
```bash
cat README.txt
```

Indique :
```
Exécute le script pour poursuivre ta quête.
```

---

## Étape 5 : Exécuter le script
```bash
chmod +x flag.sh
./flag.sh
```

Résultat :
```
Erreur : variable d’environnement manquante !
Indice : Le secret circule déjà dans les veines de ton système.
Cherche dans ce qui vit en mémoire…
```

---

## Étape 6 : Analyse des processus
Lister les processus liés au script :
```bash
ps aux | grep script
```

Récupérer le PID du script, puis examiner son environnement :
```bash
strings /proc/<PID>/environ
```

On y trouve :
```
Key=cybercorsaire
```

---

## Étape 7 : Définir la variable manquante
Ajouter la variable dans l’environnement :
```bash
export Key=cybercorsaire
```

---

## Étape 8 : Relancer le script
```bash
./flag.sh
```

Résultat :
```
Déchiffrement en cours avec la clé: cybercorsaire
Message déchiffré: FLAG{Tresor_Pirate_Cyber}
```

---

## Flag final
```
FLAG{Tresor_Pirate_Cyber}
```
