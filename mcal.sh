#!/bin/bash
#Calendario practica 2 Modulo 5

numarg=$#

function printHelp() {
	echo "Usage: mcal.sh [mes] [año]"
	echo "mcal.sh [mes] - Descripcion del mes o valor numérico menor que 12"
	echo "mcal.sh [año] - Valores numéricos por encima de 12"
	echo "Los valores aceptados son los meses en español e ingles o sus abreviaturas (de 3 caracteres)."
}


# Si tenemos 2 argumentos
if [[ $numarg -eq 2 ]]
then
	mes="$1"
	ano="$2"
fi
# Si tenemos 1 argumento
if [[ $numarg -eq 1 ]]
then
	if [[ "$1" =~ ^[0-9]+$ ]]
	then
		if [[ $1 -gt 12 ]]
		then
			ano="$1"
		else
			mes="$1"
			ano="$(date +%Y)"
		fi
	else
		mestest=${1^^}

		case "$mestest" in 
			ENE|ENERO|JANUARY|JAN|FEB|FEBRERO|FEBRUARY|MAR|MARZO|MARCH|ABR|APR|ABRIL|APRIL|MAY|MAYO|JUN|JUNIO|JUNE|JUL|JULIO|JULY|AGO|AGOSTO|AUGUST|AUG|SEP|SEPTIEMBRE|SEPTEMBER|OCT|OCTUBRE|OCTOBER|NOV|NOVIEMBRE|NOVEMBER|DIC|DICIEMBRE|DEC|DECEMBER)
				 mes="$1"
	                         ano="$(date +%Y)"
			;;
		"-HELP")
			printHelp
			exit 0
			;;
		*)
			echo "Parametro incorrecto. Por favor introduzca un mes/ano correcto"
			printHelp
			exit 1
			;;
		esac
	fi
fi
echo "Mes $mes"
echo "Ano $ano"

cal $mes $ano
