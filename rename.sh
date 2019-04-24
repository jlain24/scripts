#!/bin/bash

file="/home/jlen/cersCAMPANAS/datos.csv"

while IFS=';' read email contrato
	do
		printf "Email: $email Contrato: $contrato \n"
		ls -l e00a4a1d-a386-4883-bd4b-0c9ac1f03671 | awk '/'$email'/ {print $9}' | xargs -t -I {} mv e00a4a1d-a386-4883-bd4b-0c9ac1f03671/{} e00a4a1d-a386-4883-bd4b-0c9ac1f03671/"$contrato.pdf"
	done < "$file"
