#!/bin/bash
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/trojan.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "No tienes clientes existentes!"
		exit 1
	fi

	clear
	echo ""
	echo " Seleccione el cliente existente que desea eliminar"
	echo " Presione CTRL + C para regresar"
	echo " ==============================="
	echo "     Ningún usuario caducado"
	grep -E "^### " "/etc/v2ray/trojan.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/v2ray/trojan.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/trojan.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/trojan.json
systemctl restart v2ray@trojan
clear
echo " Troyan cuenta eliminado con éxito"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
echo " By Karlos Geek"
