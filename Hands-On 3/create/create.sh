#!/bin/bash

echo 1. Creating and adding text to the file mytext.txt
echo "Hola mundo" > mytext.txt

echo 2. Showing file content mytext.txt
cat mytext.txt

echo 3. Creating the backup folder
mkdir backup

echo 4. Moving mytext file to backup folder 
mv mytext.txt backup/

echo 5. Showing the backuo folder content
ls backup
read -p "Presiona cualquier boton para continuar"
echo 6. Deleting mytext file from the backup folder
rm backup/mytext.txt

echo 7. Deleting the backup folder
rmdir backup