#!/bin/bash
read -p "Enter year (2016-2018): " YEAR
read -p "Enter the annotation type to count: " TYPE

if ! [[ $YEAR =~ ^201[678]$ ]]; then    #vérifier les années sont bien entre 2016 et 2018
    echo "Invalid year! Please enter a year between 2016 and 2018."
    exit 1
fi

path="$dingdingcheng/TAL/Exercice1/ann/$YEAR"
if [ ! -d "$path" ]; then                #vérifier le path existe bien
    echo "Directory $path does not exist!"
    exit 1
fi

grep $TYPE $path/*.ann | wc -l