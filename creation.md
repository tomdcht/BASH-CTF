# Méthode de création du CTF *BASH-CTF*

## Objectif
Construire un environnement de type CTF dans `~/treasure/` avec 3 univers (pirates, ninjas, superhéros), des permissions/pièges (chmod, ACL, groupes) et un script final nécessitant une variable d’environnement pour révéler le flag.

---

## Étape 1 : Préparation
Créer la racine du projet et les sous-dossiers :
```bash
mkdir -p ~/treasure/{pirates,ninjas,superheros}
```

---

## Étape 2 : Groupes et permissions
Créer les groupes nécessaires :
```bash
sudo groupadd pirates
sudo groupadd ninjas
sudo groupadd superheros
```

Restreindre certains accès :

```bash
sudo chown root:pirates ~/treasure/pirates/Anne_Bonny
sudo setfacl -m g:lecteurs:r-x ~/treasure/pirates/Anne_Bonny
sudo chmod 754 ~/treasure/superheros/Hulk
```

---

## Étape 3 : Dossiers Pirates
Créer les répertoires :
```bash
cd ~/treasure/pirates
mkdir Barbe_Noire Anne_Bonny Mary_Read Samuel_Bellamy Bartholomew_Roberts \
     Calico_Jack Charles_Vane Benjamin_Hornigold Stede_Bonnet
```

Contenu principal :
```bash
echo "Blackbeard était célèbre pour attacher des mèches enflammées sous son chapeau pour effrayer ses ennemis." > Barbe_Noire/funfact.txt
echo "Un vrai pirate garde toujours son drapeau dans sa propre cale. Retourne à ton logis et hisse-le haut." > Anne_Bonny/funfact.txt
echo "Mary Read se déguisa souvent en homme..." > Mary_Read/funfact.txt
echo "Samuel Bellamy était connu comme le 'Prince des Pirates'..." > Samuel_Bellamy/funfact.txt
echo "Bartholomew Roberts captura plus de 470 navires..." > Bartholomew_Roberts/funfact.txt
echo "Calico Jack est à l'origine du Jolly Roger..." > Calico_Jack/funfact.txt
echo "Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie." > Charles_Vane/funfact.txt
echo "Benjamin Hornigold a formé une alliance avec Barbe Noire..." > Benjamin_Hornigold/funfact.txt
echo "Stede Bonnet, riche planteur devenu pirate..." > Stede_Bonnet/funfact.txt
```

---

## Étape 4 : Dossiers Ninjas
Créer les répertoires :
```bash
cd ~/treasure/ninjas
mkdir Hattori_Hanzo Momochi_Sandayu Katou_Danzo Ishikawa_Goemon \
     Kirigakure_Saizo Fujibayashi_Nagato Mochizuki_Chiyome Fuma_Kotaro \
     Koga_Shushin Jinichi_Kawakami
```

Exemples de contenus :
```bash
echo "Hattori Hanzo, ninja célèbre pour avoir sauvé Tokugawa Ieyasu." > Hattori_Hanzo/funfact.txt
echo "Momochi Sandayu, maître ninja et chef du clan Momochi." > Momochi_Sandayu/funfact.txt
...
echo "Jinichi Kawakami est considéré comme l'un des derniers véritables ninjas." > Jinichi_Kawakami/funfact.txt
```

---

## Étape 5 : Dossiers Superhéros
Créer les répertoires :
```bash
cd ~/treasure/superheros
mkdir Spider_Man Iron_Man Captain_America Thor Hulk Black_Widow \
     Captain_Marvel Doctor_Strange Black_Panther Ant_Man
```

Exemples de contenus :
```bash
echo "Spider-Man, alias Peter Parker, mordu par une araignée radioactive." > Spider_Man/funfact.txt
echo "Iron Man, Tony Stark, génie inventeur..." > Iron_Man/funfact.txt
echo "Captain America, Steve Rogers, super-soldat..." > Captain_America/funfact.txt
echo "Thor, dieu nordique du tonnerre, porteur de Mjolnir." > Thor/funfact.txt
echo "Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie." > Hulk/funfact.txt
...
```

---
## Étape 6 : Script final
Créer un script Bash dans `~/challenge` :
```bash
cat << 'EOF' > ~/treasure/decrypt.sh
#!/bin/bash
# Script de déchiffrement Vigenère

ENCRYPTED_MESSAGE="HJBK{Ktsjgr_Xzvcrf_Gpdsi}"

if [[ -z "$Decrypt_Key" ]]; then
  echo "Variable d'environnement 'Decrypt_Key' non définie."
  echo "Message chiffré: $ENCRYPTED_MESSAGE"
  echo "Indice: Le secret circule déjà dans les veines de ton système (regarde les processus actifs)."
  exit 1
fi

vigenere_decrypt() {
  local message="$1" key="$2" result="" key_index=0
  key=$(echo "$key" | sed 's/ //g' | tr '[:lower:]' '[:upper:]')
  local key_length=\${#key}
  for (( i=0; i<\${#message}; i++ )); do
    char="\${message:\$i:1}"
    if [[ "\$char" =~ [a-zA-Z] ]]; then
      if [[ "\$char" =~ [A-Z] ]]; then
        is_upper=true
        char_code=\$((\$(printf '%d' "'\$char") - 65))
      else
        is_upper=false
        char_code=\$((\$(printf '%d' "'\$char") - 97))
      fi
      key_char="\${key:\$((key_index % key_length)):1}"
      key_code=\$((\$(printf '%d' "'\$key_char") - 65))
      decrypted_code=\$(((char_code - key_code + 26) % 26))
      if [[ "\$is_upper" == true ]]; then
        decrypted_char=\$(printf "\\\$(printf '%03o' \$((decrypted_code + 65)))")
      else
        decrypted_char=\$(printf "\\\$(printf '%03o' \$((decrypted_code + 97)))")
      fi
      result+="\$decrypted_char"
      key_index=\$((key_index + 1))
    else
      result+="\$char"
    fi
  done
  echo "\$result"
}

echo "Déchiffrement en cours avec la clé: \$Decrypt_Key"
decrypted=\$(vigenere_decrypt "\$ENCRYPTED_MESSAGE" "\$Decrypt_Key")
echo "Message déchiffré: \$decrypted"
EOF

chmod +x ~/treasure/decrypt.sh
```

---
## Étape 7 : Vérification
* Vérifier les permissions :
```bash
ls -ld ~/treasure/superheros/Hulk
```
* Vérifier ACL :
```bash
getfacl ~/treasure/pirates/Anne_Bonny
```
* Vérifier le script (erreur attendue sans clé) :
```bash
./decrypt.sh
```
* Lancer avec la clé trouvée dans `ps aux` :
```bash
export Decrypt_Key=cybercorsaire
./decrypt.sh
```

→ Résultat attendu :
```
Message déchiffré : FLAG{Tresor_Pirate_Cyber}
```
