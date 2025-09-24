#!/bin/bash

KEY="KEY{cybercorsaire}"   
HOME=$(pwd)
# Lancer un processus détaché
(
    # Changer le nom du processus avec exec -a
    exec -a "$FLAG" bash -c 'while true; do sleep 2h; done'
) &

sudo groupadd pirates
sudo groupadd ninjas
sudo groupadd superheros

sudo useradd -m -s /bin/bash -G pirates luffy
sudo useradd -m -s /usr/sbin/nologin -G pirates sparrow 
sudo useradd -m -s /usr/sbin/nologin -G ninjas naruto
sudo useradd -m -s /usr/sbin/nologin -G superheros superman 


#Création de l'arborescence
mkdir -p {pirates/{Barbe_Noire,Anne_Bonny,Mary_Read,Samuel_Bellamy,Bartholomew_Roberts,Calico_Jack,Charles_Vane,Benjamin_Hornigold,Stede_Bonnet},ninjas/{Hattori_Hanzo,Momochi_Sandayu,Katou_Danzo,Ishikawa_Goemon,Kirigakure_Saizo,Fujibayashi_Nagato,Mochizuki_Chiyome,Fuma_Kotaro,Koga_Shushin,Jinichi_Kawakami},superheros/{Spider_Man,Iron_Man,Captain_America,Thor,Hulk,Black_Widow,Captain_Marvel,Doctor_Strange,Black_Panther,Ant_Man}}

#Configuration des permissions sur les dossiers
sudo chown -R sparrow $HOME/pirates/ 
sudo chgrp -R pirates $HOME/pirates/

cd $HOME
sudo chmod 640 Barbe_Noire Anne_Bonny Mary_Read Samuel_Bellamy Bartholomew_Roberts Calico_Jack Charles_Vane Benjamin_Hornigold Stede_Bonnet

sudo chown -R naruto $HOME/ninjas/
sudo chgrp -R ninjas $HOME/ninjas/

cd $HOME
sudo chmod 640 Hattori_Hanzo Momochi_Sandayu Katou_Danzo Ishikawa_Goemon Kirigakure_Saizo Fujibayashi_Nagato Mochizuki_Chiyome Fuma_Kotaro Koga_Shushin Jinichi_Kawakami

sudo chown -R superman $HOME/superheros/
sudo chgrp -R superheros $HOME/superheros/

sudo chmod 777 $HOME/superheros
cd $HOME
sudo chmod 640 Spider_Man Iron_Man Captain_America Thor Hulk Black_Widow Captain_Marvel Doctor_Strange Black_Panther Ant_Man

cd ..

# ========== Remplissage des fichiers pirates ========== 

echo "Blackbeard était célèbre pour attacher des mèches enflammées sous son chapeau pour effrayer ses ennemis." > pirates/Barbe_Noire/funfact.txt  

echo " Récupère ton chapeau de paille et trouve ton drapeau sur ton bateau" > pirates/Anne_Bonny/funfact.txt  

echo "Mary Read se déguisa souvent en homme pour pouvoir naviguer et combattre en tant que pirate." > pirates/Mary_Read/funfact.txt  

echo "Samuel Bellamy était connu comme le 'Prince des Pirates' pour sa richesse et son charisme." > pirates/Samuel_Bellamy/funfact.txt  

echo "Bartholomew Roberts captura plus de 470 navires, faisant de lui le pirate le plus prolifique." > pirates/Bartholomew_Roberts/funfact.txt  

echo "Calico Jack est à l'origine du célèbre drapeau Jolly Roger avec un crâne et deux sabres croisés." > pirates/Calico_Jack/funfact.txt  

echo " Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie. Récupère ton chapeau de paille et trouve le flag" > pirates/Charles_Vane/funfact.txt  

echo "Benjamin Hornigold a formé une alliance avec Barbe Noire mais plus tard il a abandonné la piraterie." > pirates/Benjamin_Hornigold/funfact.txt  

echo "Stede Bonnet, un riche planteur, est devenu pirate malgré un manque d'expérience maritime." > pirates/Stede_Bonnet/funfact.txt

# ========== Remplissage des fichiers ninjas ==========

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

# ========== Remplissage des fichiers superheros ==========

echo "Spider-Man, alias Peter Parker, a obtenu ses pouvoirs après avoir été mordu par une araignée radioactive." > superheros/Spider_Man/funfact.txt  

echo "Iron Man, Tony Stark, est un génie inventeur avec une armure high-tech qui lui permet de voler et de se battre." > superheros/Iron_Man/funfact.txt 

echo "Captain America, Steve Rogers, est un super-soldat créé pendant la Seconde Guerre mondiale." > pirates/Captain_America/funfact.txt 

echo "Thor est un dieu nordique du tonnerre, reconnu pour son marteau Mjolnir doté de pouvoirs magiques." > superheros/Thor/funfact.txt  

echo " Le trésor n’est pas accessible aux simples curieux. Seuls les pirates peuvent ouvrir la voie. " > superheros/Hulk/funfact.txt  

echo "Black Widow, Natasha Romanoff, est une espionne et experte en arts martiaux formée par le KGB." > superheros/Black_Widow/funfact.txt  

echo "Captain Marvel, Carol Danvers, est une pilote devenue super-héroïne après avoir acquis des pouvoirs cosmiques." > superheros/Captain_Marvel/funfact.txt  

echo "Doctor Strange, Stephen Strange, est un ancien chirurgien devenu maître des arts mystiques." > superheros/Doctor_Strange/funfact.txt

# ========== Attribution des permissions générales ==========

# L'utilisateur doit pouvoir en premier lieu accéder à ce dossier contenant le premier indice
sudo chmod 754 superheros/Hulk 

# L'utilisateur doit devenir un pirate pour accéder à ce dossier
sudo chown -R root:pirates pirates/Anne_Bonny/funfact.txt
sudo chmod 750 pirates/Anne_Bonny/funfact.txt 

# ========== Création des dossiers et fichiers du /home de luffy ==========

echo "Execute le script pour poursuivre ta quête" > /home/luffy/readme.md

mv flag.sh /home/luffy



