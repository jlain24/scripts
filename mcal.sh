#!/bin/bash
#Calendario practica 2 Modulo 5

main() {
# Numero de argumentos y declaracion de variables
    local numarg="$#"
    local ano=""
    local mes=""
# Si no ponemos ningun valor, sacamos mes y año actual
    if [[ $numarg -eq 0 ]]
    then
	mes="$(date +%m)"
	ano="$(date +%Y)"
    fi
# Si tenemos 2 argumentos verificamos que sean numeros
# o que sea un mes de los aceptados
    if [[ $numarg -eq 2 ]]
    then
       if ! [[ "$1" =~ ^[0-9]+$ ]]
       then
	        if validateMonth "$1";
		then
			if validateYear "$2";
			then
	            		mes="$1"
        	    		ano="$2"
        		fi
		fi
	else
		if validateYear "$2";
                then
                        mes="$1"
                        ano="$2"
                fi
	fi
# Si tenemos 1 argumento miramos si es un numero y a su vez mayor que 12
# para asignarlo al año o menor para asignarlo al mes
    elif [[ $numarg -eq 1 ]]
    then
        if [[ "$1" =~ ^[0-9]+$ ]]
        then
            if [[ $1 -gt 12 ]]
            then
                mes=""
                ano="$1"
            else
                mes="$1"
                ano="$(date +%Y)"
            fi
        else
            if validateMonth "$1";   
            then
                mes="$1"
                ano="$(date +%Y)"
            fi
        fi
    fi

    echo "Mes $mes"
    echo "Ano $ano"
# Para asegurarnos que no metemos ningun parametro vacio
   if [[ "$mes" != "" ]]; then
        cal "$mes" "$ano"
   else
        cal "$ano"
   fi
}

# Funcion para imprimir ayuda
printHelp() {
	echo "Usage: mcal.sh [mes] [año]"
	echo "mcal.sh [mes] - Descripcion del mes o valor numérico menor que 12"
	echo "mcal.sh [año] - Valores numéricos por encima de 12"
	echo "Los valores aceptados son los meses en español e ingles o sus abreviaturas (de 3 caracteres)."
}

# Funcion para validar el mes, con un parametro erroneo sale fuera del script con error 1
validateMonth() {
	valmont=${1^^}
	case "$valmont" in 
			ENE|ENERO|JANUARY|JAN|FEB|FEBRERO|FEBRUARY|MAR|MARZO|MARCH|ABR|APR|ABRIL|APRIL|MAY|MAYO|JUN|JUNIO|JUNE|JUL|JULIO|JULY|AGO|AGOSTO|AUGUST|AUG|SEP|SEPTIEMBRE|SEPTEMBER|OCT|OCTUBRE|OCTOBER|NOV|NOVIEMBRE|NOVEMBER|DIC|DICIEMBRE|DEC|DECEMBER)
			;;
	"-HELP")
		printHelp
		exit 0
	;;
	*)
			echo "Parametro incorrecto. Por favor introduzca un mes correcto"
			exit 1
			;;
	esac
}

# Validamos si el año es un numero, si no salimos fuera del script con error 1
validateYear(){
	if ! [[ "$1" =~ ^[0-9]+$ ]]
	then
		echo "Parametro incorrecto. Por favor introduzca un año correcto"	
		exit 1
	fi
}


main "$@"
