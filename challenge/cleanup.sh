#!/bin/bash
# cleanup.sh - Nettoyage du CTF (sans supprimer start.sh et cleanup.sh)

CHALLENGE_DIR="$HOME/challenge"

echo "[*] Nettoyage du challenge dans $CHALLENGE_DIR..."

# Vérifier que le dossier challenge existe
if [ ! -d "$CHALLENGE_DIR" ]; then
    echo "[!] Aucun dossier challenge trouvé. Rien à nettoyer."
    exit 0
fi

# Supprimer tout sauf start.sh et cleanup.sh
find "$CHALLENGE_DIR" -mindepth 1 -not -name 'start.sh' -not -name 'cleanup.sh' -exec rm -rf {} +

echo "[+] Contenu du challenge supprimé (start.sh et cleanup.sh conservés)."

# Supprimer les groupes
for grp in pirates ninjas superheros; do
    if getent group "$grp" > /dev/null; then
        sudo groupdel "$grp" && echo "[+] Groupe $grp supprimé."
    fi
done

# Supprimer les utilisateurs spécifiques (ajoute ici ceux que tu avais créés pour le CTF)
for usr in luffy zoro nami; do
    if id "$usr" &>/dev/null; then
        sudo userdel -r "$usr" && echo "[+] Utilisateur $usr supprimé."
    fi
done

echo "[*] Nettoyage terminé."
