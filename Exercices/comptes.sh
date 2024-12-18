#!/bin/bash
for n in 2016 2017 2018

do
        path=$dingdingcheng/TAL/Exercice1/ann/$n/*.ann
        echo "annotation of location in $n"
        cat $path | egrep "Location" | cut --f=3 | wc -l
done