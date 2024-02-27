#!/bin/bash

while true; do
	#printf '\033c'
	#Show the menu
	echo "LISTADO DE SERVICIOS DISPONIBLES: "
	echo "1. Listar el contenido de un fichero/carpeta"
	echo "2. Crear un archivo de texto con una linea de texto"
	echo "3. Comparar dos archivos de texto"
	echo "4. Mostrar el uso del comando awk"
	echo "5. Mostrar el uso del comando grep"
	echo "6. Salir del menu"

	#Request and save the user option
	read -p "Digita alguna opcion: " opcion
	
	case $opcion in
		1)
		read -p "Ingresa la ruta absoluta de la carpeta: " rutaA
		ls -l "$rutaA"
		;;
		2)
		read -p "Digita una cadena de texto para almacenarla en un fichero: " cadena
		echo "$cadena" > nuevo-fichero.txt
		echo "Se ha creado el nuevo fichero: nuevo-fichero.txt"
		;;
		3)
		read -p "Ingresa la ruta absoluta del primer fichero: " fichero1
		read -p "Ingresa la ruta absoluta del segundo fichero: " fichero2
		resultado=$(diff "$fichero1" "$fichero2")
		echo $resultado
		;;
		4)
		echo "Uso de awk: "
		echo "AWK es adecuado para la búsqueda y procesamiento de patrones. El script se ejecuta para buscar uno o más archivos para identificar patrones coincidentes y si dichos patrones realizan tareas específicas."
		;;
		5)	
		echo "Uso de grep: "
		echo "es un comando utilizado para buscar y hacer coincidir patrones de texto en archivos contenidos en expresiones regulares."
		;;
		6) 	
		exit 0
		;;
	esac	
	read -p "Presiona cualquier boton para continuar"	
	printf '\033c'
done