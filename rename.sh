#!/bin/bash

file="/home/$USER/fichero/datos.csv"

while IFS=';' read datos1 datos2
	do
		printf "Datos1: $datos1 Datos2: $datos2\n"
		ls -l | awk '/'$datos1'/ {print $9}' | xargs -t -I {} mv {} "$datos2.pdf"
	done < "$file"
