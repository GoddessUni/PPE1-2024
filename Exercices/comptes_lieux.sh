#!/bin/bash

# Entrer l'année
read -p "Choisir une année, tapez * pour toutes les années (exemple: 2022 ou *): " annee
if ! [[ $annee =~ ^[0-9]{4}$ || $annee == "*" ]]; then
    echo "Année invalide. Format: 4 chiffres ou *."
    exit 1
fi

# Entrer le mois
read -p "Choisir un mois, tapez * pour tous les mois (exemple: 03 ou *): " mois
if ! [[ $mois =~ ^[0-9]{2}$ || $mois == "*" ]]; then
    echo "Mois invalide. Format: 2 chiffres ou *."
    exit 1
fi

# Entrer le nombre des mois
read -p "Choisir le nombre de lieux à afficher (exemple: 5): " lieux
if ! [[ $lieux =~ ^[0-9]+$ ]]; then
    echo "Nombre invalide. Format: entier positif."
    exit 1
fi

if [[ $annee == "*" ]]; then
    year_path="*"
else
    year_path=$annee
fi

if [[ $mois == "*" ]]; then
    month_path="*"
else
    month_path="${annee}_${mois}"
fi

base_path="$dingdingcheng/TAL/Exercice1/ann/$year_path/$month_path"

# Vérifier le path
if ! ls "$base_path"*.ann >/dev/null 2>&1; then
    echo "Aucun fichier trouvé dans le chemin : $base_path"
    exit 1
fi

grep "Location" "$base_path"*.ann 2>/dev/null | cut -f3 | sort | uniq -c | sort -nr | head -n "$lieux"