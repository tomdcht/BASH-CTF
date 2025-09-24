# Solution – BASH-CTF (corrigé pas-à-pas)

## Étape 1 : Lancer le challenge

```bash
./start
```

## Étape 2 : Identifier le dossier spécial (Hulk)

Lister les permissions des dossiers :

```bash
ls -ld ~/challenge/*
```

Observation : un seul dossier (Hulk) est en **rwxr-x--- (750)**.
Entrer dedans :

```bash
cd ~/challenge/Hulk
cat funfact.txt
```

Contenu :
```
Le trésor n’est pas accessible aux simples curieux.
Seuls les pirates peuvent ouvrir la voie.
```

→ Conclusion : il faut utiliser un **compte pirate** pour progresser.

---

## Étape 3 : Piste d’Anne Bonny
Lire le fichier d’Anne Bonny :
```bash
cat ~/challenge/Anne_Bonny/funfact.txt
```

Contenu :
```
Récupère ton chapeau de paille et trouve ton drapeau sur ton bateau.
```

→ Allusion directe à **Luffy (chapeau de paille)**.
Il faut aller dans `/home/luffy/`.

---

## Étape 4 : Explorer le home de Luffy
```bash
cd /home/luffy
ls
```

Contenu :
* `README.txt`
* `script.sh`

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
chmod +x script.sh
./script.sh
```

Résultat :
```
Erreur : variable d’environnement manquante !
Indice : Le secret circule déjà dans les veines de ton système.
Cherche dans ce qui vit en mémoire…
```

→ Le script a besoin d’une clé (mais laquelle ?).

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
CLE=cybercorsaire
```

---

## Étape 7 : Définir la variable manquante
Ajouter la variable dans l’environnement :

```bash
export CLE=cybercorsaire
```

---

## Étape 8 : Relancer le script
```bash
./script.sh
```

Résultat :
```
Félicitations moussaillon !
Voici ton trésor :

FLAG{Tresor_Pirate_2025}
```

---

## Flag final
```
FLAG{Tresor_Pirate_2025}
```
