#!/usr/bin/env bash
set -euo pipefail

# Variables
KEY="KEY{cybercorsaire}"
BASE_DIR="$(pwd)"        # dossier de travail où seront créés pirates/ ninjas/ superheros/
FLAG_SRC="./flag.sh"     # chemin relatif vers flag.sh ; ajustez si nécessaire
SLEEP_CMD='while true; do sleep 2h; done'

# Lancer un processus détaché (nommé avec KEY)
(
  exec -a "$KEY" bash -c "$SLEEP_CMD"
) &

# --- Création de groupes (idempotent) ---
ensure_group() {
  local g="$1"
  if ! getent group "$g" > /dev/null; then
    sudo groupadd "$g"
  fi
}
ensure_group pirates
ensure_group ninjas
ensure_group superheros

# --- Création d'utilisateurs (idempotent) ---
ensure_user() {
  local user="$1" shell="$2" groups="$3"
  if ! id -u "$user" > /dev/null 2>&1; then
    # -m crée le home, -s shell, -G groupe(s) secondaires
    sudo useradd -m -s "$shell" -G "$groups" "$user"
  else
    # ajouter au groupe si nécessaire
    sudo usermod -a -G "$groups" "$user" || true
  fi
}
ensure_user luffy /bin/bash pirates
ensure_user sparrow /usr/sbin/nologin pirates
ensure_user naruto /usr/sbin/nologin ninjas
ensure_user superman /usr/sbin/nologin superheros
sudo passwd -d luffy || true
# --- Création de l'arborescence ---
mkdir -p "$BASE_DIR"/pirates/{Barbe_Noire,Anne_Bonny,Mary_Read,Samuel_Bellamy,Bartholomew_Roberts,Calico_Jack,Charles_Vane,Benjamin_Hornigold,Stede_Bonnet}
mkdir -p "$BASE_DIR"/ninjas/{Hattori_Hanzo,Momochi_Sandayu,Katou_Danzo,Ishikawa_Goemon,Kirigakure_Saizo,Fujibayashi_Nagato,Mochizuki_Chiyome,Fuma_Kotaro,Koga_Shushin,Jinichi_Kawakami}
mkdir -p "$BASE_DIR"/superheros/{Spider_Man,Iron_Man,Captain_America,Thor,Hulk,Black_Widow,Captain_Marvel,Doctor_Strange,Black_Panther,Ant_Man}

# --- Remplissage des fichiers funfact (toujours avec chemins complets) ---
echo "Blackbeard était célèbre pour attacher des mèches enflammées sous son chapeau pour effrayer ses ennemis." > "$BASE_DIR"/pirates/Barbe_Noire/funfact.txt
echo "Récupère ton chapeau de paille et trouve ton drapeau sur ton bateau" > "$BASE_DIR"/pirates/Anne_Bonny/funfact.txt
echo "Mary Read se déguisa souvent en homme pour pouvoir naviguer et combattre en tant que pirate." > "$BASE_DIR"/pirates/Mary_Read/funfact.txt
echo "Samuel Bellamy était connu comme le 'Prince des Pirates' pour sa richesse et son charisme." > "$BASE_DIR"/pirates/Samuel_Bellamy/funfact.txt
echo "Bartholomew Roberts captura plus de 470 navires, faisant de lui le pirate le plus prolifique." > "$BASE_DIR"/pirates/Bartholomew_Roberts/funfact.txt
echo "Calico Jack est à l'origine du célèbre drapeau Jolly Roger avec un crâne et deux sabres croisés." > "$BASE_DIR"/pirates/Calico_Jack/funfact.txt
echo "Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie. Récupère ton chapeau de paille et trouve le flag" > "$BASE_DIR"/pirates/Charles_Vane/funfact.txt
echo "Benjamin Hornigold a formé une alliance avec Barbe Noire mais plus tard il a abandonné la piraterie." > "$BASE_DIR"/pirates/Benjamin_Hornigold/funfact.txt
echo "Stede Bonnet, un riche planteur, est devenu pirate malgré un manque d'expérience maritime." > "$BASE_DIR"/pirates/Stede_Bonnet/funfact.txt

echo "Hattori Hanzo, ninja célèbre pour avoir sauvé le futur shogun Tokugawa Ieyasu en 1582." > "$BASE_DIR"/ninjas/Hattori_Hanzo/funfact.txt
echo "Momochi Sandayu était un maître ninja réputé et chef du clan Momochi." > "$BASE_DIR"/ninjas/Momochi_Sandayu/funfact.txt
echo "Katou Danzo était connu pour ses compétences en espionnage et sabotage." > "$BASE_DIR"/ninjas/Katou_Danzo/funfact.txt
echo "Ishikawa Goemon est un ninja légendaire souvent comparé à Robin des Bois." > "$BASE_DIR"/ninjas/Ishikawa_Goemon/funfact.txt
echo "Kirigakure Saizo était un ninja du clan Sanada et maître en arts martiaux." > "$BASE_DIR"/ninjas/Kirigakure_Saizo/funfact.txt
echo "Fujibayashi Nagato était chef du clan Fujibayashi, spécialisés en techniques de ninjutsu." > "$BASE_DIR"/ninjas/Fujibayashi_Nagato/funfact.txt
echo "Mochizuki Chiyome a formé des ninjas féminins appelés Kunoichi." > "$BASE_DIR"/ninjas/Mochizuki_Chiyome/funfact.txt
echo "Fuma Kotaro était un chef ninja redoutable du clan Fuma." > "$BASE_DIR"/ninjas/Fuma_Kotaro/funfact.txt
echo "Koga Shushin était un célèbre ninja du clan Koga, expert en infiltration." > "$BASE_DIR"/ninjas/Koga_Shushin/funfact.txt
echo "Jinichi Kawakami est considéré comme l'un des derniers véritables ninjas." > "$BASE_DIR"/ninjas/Jinichi_Kawakami/funfact.txt

echo "Spider-Man, alias Peter Parker, a obtenu ses pouvoirs après avoir été mordu par une araignée radioactive." > "$BASE_DIR"/superheros/Spider_Man/funfact.txt
echo "Iron Man, Tony Stark, est un génie inventeur avec une armure high-tech qui lui permet de voler et de se battre." > "$BASE_DIR"/superheros/Iron_Man/funfact.txt
echo "Captain America, Steve Rogers, est un super-soldat créé pendant la Seconde Guerre mondiale." > "$BASE_DIR"/superheros/Captain_America/funfact.txt
echo "Thor est un dieu nordique du tonnerre, reconnu pour son marteau Mjolnir doté de pouvoirs magiques." > "$BASE_DIR"/superheros/Thor/funfact.txt
echo "Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie." > "$BASE_DIR"/superheros/Hulk/funfact.txt
echo "Black Widow, Natasha Romanoff, est une espionne et experte en arts martiaux formée par le KGB." > "$BASE_DIR"/superheros/Black_Widow/funfact.txt
echo "Captain Marvel, Carol Danvers, est une pilote devenue super-héroïne après avoir acquis des pouvoirs cosmiques." > "$BASE_DIR"/superheros/Captain_Marvel/funfact.txt
echo "Doctor Strange, Stephen Strange, est un ancien chirurgien devenu maître des arts mystiques." > "$BASE_DIR"/superheros/Doctor_Strange/funfact.txt

# --- Attribution des permissions et propriétaires de façon plus fiable ---
# Pirates: propriétaire sparrow, groupe pirates, fichiers 640, dossiers 750
sudo chown -R sparrow:pirates "$BASE_DIR/pirates"
find "$BASE_DIR/pirates" -type d -exec sudo chmod 755 {} \;
find "$BASE_DIR/pirates" -type f -exec sudo chmod 640 {} \;

# Ninjas: propriétaire naruto, groupe ninjas
sudo chown -R naruto:ninjas "$BASE_DIR/ninjas"
find "$BASE_DIR/ninjas" -type d -exec sudo chmod 755 {} \;
find "$BASE_DIR/ninjas" -type f -exec sudo chmod 640 {} \;

# Superhéros: propriétaire superman, groupe superheros
sudo chown -R superman:superheros "$BASE_DIR/superheros"
sudo chmod -R 775 "$BASE_DIR/superheros"        # si intentionnel; sinon adapter
# puis remettre fichiers à 640
find "$BASE_DIR/superheros" -type f -exec sudo chmod 640 {} \;

# Permissions spécifiques demandées
sudo chmod 755 "$BASE_DIR/superheros/Hulk"
sudo chmod 755 "$BASE_DIR/superheros/Hulk/funfact.txt"
sudo chown root:pirates "$BASE_DIR/pirates/Anne_Bonny/funfact.txt"
sudo chmod 750 "$BASE_DIR/pirates/Anne_Bonny/funfact.txt"

# --- Fichier readme et flag ---
echo "Execute le script pour poursuivre ta quête" | sudo tee /home/luffy/readme.md > /dev/null

if [ -f "$FLAG_SRC" ]; then
  sudo cp "$FLAG_SRC" /home/luffy/ || true
  sudo chown luffy:$(id -gn luffy) /home/luffy/flag.sh || true
else
  echo "[WARN] $FLAG_SRC introuvable — le flag n'a pas été déplacé."
fi

echo "Script terminé avec succès."

