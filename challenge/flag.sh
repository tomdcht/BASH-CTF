#!/bin/bash
# Script de déchiffrement Vigenère

ENCRYPTED_MESSAGE="HJBK{Ktsjgr_Xzvcrf_Gpdsi}"

if [[ -z "$Key" ]]; then
  echo "Variable d'environnement 'Key' non définie."
  echo "Message chiffré: $ENCRYPTED_MESSAGE"
  echo "Indice: Le secret circule déjà dans les veines de ton système (regarde l>
  exit 1
fi

vigenere_decrypt() {
  local message="$1" key="$2" result="" key_index=0
  key=$(echo "$key" | sed 's/ //g' | tr '[:lower:]' '[:upper:]')
  local key_length=${#key}
  for (( i=0; i<${#message}; i++ )); do
    char="${message:$i:1}"
    if [[ "$char" =~ [a-zA-Z] ]]; then
      if [[ "$char" =~ [A-Z] ]]; then
        is_upper=true
        char_code=$(( $(printf '%d' "'$char") - 65 ))
      else
        is_upper=false
        char_code=$(( $(printf '%d' "'$char") - 97 ))
      fi
      key_char="${key:$((key_index % key_length)):1}"
      key_code=$(( $(printf '%d' "'$key_char") - 65 ))
      decrypted_code=$(((char_code - key_code + 26) % 26))
      if [[ "$is_upper" == true ]]; then
        decrypted_char=$(printf "\\$(printf '%03o' $((decrypted_code + 65)))")
      else
        decrypted_char=$(printf "\\$(printf '%03o' $((decrypted_code + 97)))")
      fi
      result+="$decrypted_char"
      key_index=$((key_index + 1))
    else
      result+="$char"
    fi
  done
  echo "$result"
}
