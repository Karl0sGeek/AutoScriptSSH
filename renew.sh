#!/bin/bash
# Script by : Karlos Geek
clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "       AutoScriptVPS by Karlos Geek    "
echo -e ""
echo -e "======================================"
read -p "         Usuario       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "         Day Extend     :  " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e ""
echo -e "========================================"
echo -e ""
echo -e "    AutoScriptVPS by Karlos Geek         "
echo -e ""
echo -e "    Usuario         :  $User"
echo -e "    Days Added      :  $Days Dias"
echo -e "    Expires on      :  $Expiration_Display"
echo -e ""
echo -e "========================================"
else
clear
echo -e ""
echo -e "========================================"
echo -e ""
echo -e "      AutoScriptVPS by Karlos Geek       "
echo -e ""
echo -e "        El Usuario no Existe           "
echo -e ""
echo -e "========================================"
fi