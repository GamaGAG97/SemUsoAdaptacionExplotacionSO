@echo off
echo Creating and adding text to the file mytext.txt
echo Hola Mundo > mytext.txt
echo . 
echo Showing file content mytext.txt
type mytext.txt
echo .
echo Creating the backup folder
mkdir Backup
echo .
echo Backing up the file (mytext.txt)
copy mytext.txt backup
echo .
echo Showing the backup folder content 
dir backup
echo .
echo First pause to view the folder before deleting it 
pause
echo Deleting the file (mytext.txt) from the backup folder
del backup\mytext.txt

echo Deleting the backup folder
rmdir /s /q backup
pause