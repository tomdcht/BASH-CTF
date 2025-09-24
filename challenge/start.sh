#!/bin/bash
# ================================================
# Script de mise en place du CTF - BASH-CTF
# ================================================

cat << "EOF"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣤⣤⣤⢤⣤⠄⠀⣼⠀⠠⣤⣤⣤⣤⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⣿⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⢠⣿⡆⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠿⠿⠿⠿⠟⠉⠀⠀⣀⣀⣀⣤⣾⣿⣿⣦⣀⣀⣀⠀⠀⠈⠻⠿⠿⠿⠿⢿⣷⣤⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠻⣶⣶⣶⣶⣦⣤⣄⠀⠉⠉⠉⠙⠛⠿⣿⣿⣿⠿⠛⠋⠉⠉⠉⠁⢠⣤⣴⣶⣶⣶⣶⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣻⣿⣿⣆⠀⠀⠀⠀⠀⠀⠸⣿⡏⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣷⡀⠀⠀⠀⠀⢿⠀⠀⠀⠀⠀⣼⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⡀⠀⠀⠀⢸⠀⠀⠀⠀⣾⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⡄⠀⠀⢸⠀ ⢠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣆⠀⢠ ⣠⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠦⠀⡰⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⣤⣤⣤⣤⡄⣤⣤⣤⣤⣤⠀⣤⣤⣤⣤⣤⠀⠀⠀⣤⣄⠀⠀⢠⡤⠦⢤⣤⠀⣤⠀⠀⠀⣤ ⣤⣤⣤⣤⣄ ⣤⢤⣤⣤⡤
⠀⠀⢸⡇⠀⠀⣿⣦⣤⣤⡿⠃⣿⣤⣤⣤⣤⠀⢀⣾⣃⣹⣆⠀⠹⠶⠤⢤⣤⢀⣿⠀⠀⠀⣿ ⣿⣤⣤⣤⠿⠃⣿⣤⣤⣤⣤
⠀⠀⢸⡇⠀⠀⣿ ⠀⠈⢻⡄⣿⣤⣤⣤⣤ ⣿⠉⠉⠉⢹⣦⢹⣦⣤⣤⣼⠃⢻⣦⣤⣴⡟⠀⣿⠀⠀⠈⣷⡄⣿⣤⣤⣤⣤

EOF
# Dossier du projet
PROJECT_DIR=$(pwd)/challenge

# Nettoyage préalable si besoin
if [ -d "$PROJECT_DIR" ]; then
  echo "[*] Suppression de l’ancien projet..."
  rm -rf "$PROJECT_DIR"
fi

mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit 1

echo "[*] Création de l’environnement CTF dans $PROJECT_DIR"

# ================================================
# Création des groupes
# ================================================
for grp in pirates ninjas superheros; do
  if ! getent group $grp >/dev/null; then
    sudo groupadd $grp
    echo "[+] Groupe $grp créé."
  else
    echo "[=] Groupe $grp existe déjà."
  fi
done

# ================================================
# Création des utilisateurs
# ================================================
if ! id luffy >/dev/null 2>&1; then
  sudo useradd -m -s /bin/bash -G pirates luffy
  echo "[+] Utilisateur luffy créé."
else
  echo "[=] Utilisateur luffy existe déjà."
fi

if ! id sparrow >/dev/null 2>&1; then
  sudo useradd -m -s /usr/sbin/nologin -G pirates sparrow
  echo "[+] Utilisateur sparrow créé."
else
  echo "[=] Utilisateur sparrow existe déjà."
fi

if ! id naruto >/dev/null 2>&1; then
  sudo useradd -m -s /usr/sbin/nologin -G ninjas naruto
  echo "[+] Utilisateur naruto créé."
else
  echo "[=] Utilisateur naruto existe déjà."
fi

if ! id superman >/dev/null 2>&1; then
  sudo useradd -m -s /usr/sbin/nologin -G superheros superman
  echo "[+] Utilisateur superman créé."
else
  echo "[=] Utilisateur superman existe déjà."
fi

# ================================================
# Arborescence des dossiers
# ================================================
mkdir -p pirates/{Barbe_Noire,Anne_Bonny,Mary_Read,Samuel_Bellamy,Bartholomew_Roberts,Calico_Jack,Charles_Vane,Benjamin_Hornigold,Stede_Bonnet}
mkdir -p ninjas/{Hattori_Hanzo,Momochi_Sandayu,Katou_Danzo,Ishikawa_Goemon,Kirigakure_Saizo,Fujibayashi_Nagato,Mochizuki_Chiyome,Fuma_Kotaro,Koga_Shushin,Jinichi_Kawakami}
mkdir -p superheros/{Spider_Man,Iron_Man,Captain_America,Thor,Hulk,Black_Widow,Captain_Marvel,Doctor_Strange,Black_Panther,Ant_Man}

echo "[*] Arborescence pirates/ninjas/superheros créée."

# ================================================
# Permissions initiales
# ================================================
# Pirates
sudo chown -R sparrow:pirates "$PROJECT_DIR/pirates"
sudo chmod 750 "$PROJECT_DIR/pirates/Anne_Bonny"

# Ninjas
sudo chown -R naruto:ninjas "$PROJECT_DIR/ninjas"
sudo chmod 750 "$PROJECT_DIR/ninjas"

# Superhéros
sudo chown -R superman:superheros "$PROJECT_DIR/superheros"
sudo chmod 754 "$PROJECT_DIR/superheros/Hulk"

# ================================================
# Remplissage des fichiers pirates
# ================================================
echo "Blackbeard était célèbre pour attacher des mèches enflammées sous son chapeau pour effrayer ses ennemis." > pirates/Barbe_Noire/funfact.txt
echo "Un vrai pirate garde toujours son drapeau dans sa propre cale. Retourne à ton logis et hisse-le haut." > pirates/Anne_Bonny/funfact.txt
echo "Mary Read se déguisa souvent en homme pour pouvoir naviguer et combattre en tant que pirate." > pirates/Mary_Read/funfact.txt
echo "Samuel Bellamy était connu comme le 'Prince des Pirates' pour sa richesse et son charisme." > pirates/Samuel_Bellamy/funfact.txt
echo "Bartholomew Roberts captura plus de 470 navires, faisant de lui le pirate le plus prolifique." > pirates/Bartholomew_Roberts/funfact.txt
echo "Calico Jack est à l'origine du célèbre drapeau Jolly Roger avec un crâne et deux sabres croisés." > pirates/Calico_Jack/funfact.txt
echo "Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie." > pirates/Charles_Vane/funfact.txt
echo "Benjamin Hornigold a formé une alliance avec Barbe Noire mais plus tard il a abandonné la piraterie." > pirates/Benjamin_Hornigold/funfact.txt
echo "Stede Bonnet, un riche planteur, est devenu pirate malgré un manque d'expérience maritime." > pirates/Stede_Bonnet/funfact.txt

# ================================================
# Remplissage des fichiers ninjas
# ================================================
echo "Hattori Hanzo, ninja célèbre pour avoir sauvé le futur shogun Tokugawa Ieyasu en 1582." > ninjas/Hattori_Hanzo/funfact.txt
echo "Momochi Sandayu était un maître ninja réputé et chef du clan Momochi." > ninjas/Momochi_Sandayu/funfact.txt
echo "Katou Danzo était connu pour ses compétences en espionnage et sabotage." > ninjas/Katou_Danzo/funfact.txt
echo "Ishikawa Goemon est un ninja légendaire souvent comparé à Robin des Bois." > ninjas/Ishikawa_Goemon/funfact.txt
echo "Kirigakure Saizo était un ninja du clan Sanada et maître en arts martiaux." > ninjas/Kirigakure_Saizo/funfact.txt
echo "Fujibayashi Nagato était chef du clan Fujibayashi, spécialisés en techniques de ninjutsu." > ninjas/Fujibayashi_Nagato/funfact.txt
echo "Mochizuki Chiyome a formé des ninjas féminins appelés Kunoichi." > ninjas/Mochizuki_Chiyome/funfact.txt
echo "Fuma Kotaro était un chef ninja redoutable du clan Fuma." > ninjas/Fuma_Kotaro/funfact.txt
echo "Koga Shushin était un célèbre ninja du clan Koga, expert en infiltration." > ninjas/Koga_Shushin/funfact.txt
echo "Jinichi Kawakami est considéré comme l'un des derniers véritables ninjas." > ninjas/Jinichi_Kawakami/funfact.txt

# ================================================
# Remplissage des fichiers superheros
# ================================================
echo "Spider-Man, alias Peter Parker, a obtenu ses pouvoirs après avoir été mordu par une araignée radioactive." > superheros/Spider_Man/funfact.txt
echo "Iron Man, Tony Stark, est un génie inventeur avec une armure high-tech qui lui permet de voler et de se battre." > superheros/Iron_Man/funfact.txt
echo "Captain America, Steve Rogers, est un super-soldat créé pendant la Seconde Guerre mondiale." > superheros/Captain_America/funfact.txt
echo "Thor est un dieu nordique du tonnerre, reconnu pour son marteau Mjolnir doté de pouvoirs magiques." > superheros/Thor/funfact.txt
echo "Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie." > superheros/Hulk/funfact.txt
echo "Black Widow, Natasha Romanoff, est une espionne et experte en arts martiaux formée par le KGB." > superheros/Black_Widow/funfact.txt
echo "Captain Marvel, Carol Danvers, est une pilote devenue super-héroïne après avoir acquis des pouvoirs cosmiques." > superheros/Captain_Marvel/funfact.txt
echo "Doctor Strange, Stephen Strange, est un ancien chirurgien devenu maître des arts mystiques." > superheros/Doctor_Strange/funfact.txt

# ================================================
# Création du /home de luffy avec un indice
# ================================================
if [ -d /home/luffy ]; then
  sudo -u luffy bash -c 'echo "Execute le script pour poursuivre ta quête" > ~/readme.md'
fi
