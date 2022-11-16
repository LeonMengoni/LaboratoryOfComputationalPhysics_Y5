#!/bin/bash

mkdir students

wget https://www.dropbox.com/s/867rtx3az6e9gm8/LCP_22-23_students.csv

cp  LCP_22-23_students.csv ./students

cd students

# check if file is there

if [ ! -f "./LCP_22-23_students.csv" ]
then
    echo "the file ./LCP_22-23_students.csv does not exist! Setting a default value"
    file="newfile.txt"
else
    file=./LCP_22-23_students.csv
fi

grep -n "PoD" * > PoD_students.csv
grep -n "Physics" * > Physics_students.csv

for x in {A..Z}; do
    echo -n "$x " >> LetterCount.csv;
    grep -c "^$x" LCP_22-23_students.csv >> LetterCount.csv
done

for x in {A..Z}; do
grep "$x" LetterCount.csv | cut -f2 -d " " 

# EXECUTE with bash ex1.sh