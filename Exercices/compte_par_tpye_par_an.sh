#!/bin/bash
read -p "Enter the type annotation you want to count: " TYPE

years=("2016" "2017" "2018")

for YEAR in "${years[@]}"; do
    read -p "Enter year ($YEAR): " input_year
    
    if [[ " ${years[@]} " =~ " ${input_year} " ]]; then
        path="$dingdingcheng/TAL/Exercice1/ann/$input_year"
        echo "$input_year $TYPE total annotation:"
        count=$(grep -w "$TYPE" $path/*.ann | wc -l)
        echo "$count"
    else
        echo "Invalid year, please enter a valid year from 2016 to 2018."
    fi
done

if [ $? -eq 0 ]; then
    echo "The script ran successfully."
else
    echo "There was an error in the script execution."
fi