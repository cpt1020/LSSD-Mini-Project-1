#!/bin/bash
# shebang

# Part 1
# Use student_id to examine files
# and store results to missing_list.txt and wrong_list.txt

while read -r FILE
do
    FOUND="$(find ./compressed_files -name "$FILE".* -print -quit)"
    if [ "x$FOUND" != "x" ]
    then
        ZIP="$(find . -name "$FILE".zip -print -quit)"
        RAR="$(find . -name "$FILE".rar -print -quit)"
        TAR="$(find . -name "$FILE".tar.gz -print -quit)"
        if [ "x$ZIP$RAR$TAR" == "x" ]
        then
            echo "WRONG: $FILE"
            echo "$FILE" >> wrong_list.txt
        else
            echo "FOUND & CORRECT: $FILE"
        fi
    else
        echo "NOT FOUND: $FILE"
        echo "$FILE" >> missing_list.txt
    fi
done < student_id

# Part 2
# Classifiy files according to file extension

DIR="compressed_files"

mkdir "$DIR"/zip "$DIR"/rar "$DIR"/tar.gz "$DIR"/unknown

mv "$DIR"/*.zip "$DIR"/zip/
mv "$DIR"/*.rar "$DIR"/rar/
mv "$DIR"/*.tar.gz "$DIR"/tar.gz/
mv "$DIR"/*.dika "$DIR"/unknown/

# Extract files
unrar e "$DIR"/rar/'*.rar' "$DIR"/rar/
unzip "$DIR"/zip/'*.zip' -d "$DIR"/zip/
cat "$DIR"/tar.gz/*.tar.gz | tar zxvf - -i -C "$DIR"/tar.gz/