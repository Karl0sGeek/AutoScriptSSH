#!/bin/bash
clear
echo " "
echo "===========================================";
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "Usuarios que violan el límite máximo";
echo "Hora - Nombre de usuario - Varios inicios de sesión"
echo "-------------------------------------";
cat /root/log-limit.txt
else
echo " Ningún usuario está infringiendo"
echo " "
echo " atau"
echo " "
echo " Skrip Usuario-El límite no se ha ejecutado"
fi
echo " ";
echo "===========================================";
echo "By Karlos Geek";
echo " ";