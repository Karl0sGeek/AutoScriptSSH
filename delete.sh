#!/bin/bash
# ===========================================
# | AUTOSCRIPT FOR INSTALLATION SSH AND VPN |
# ===========================================
# | Owner : Administrador KARLOS GEEK    |
# | Date Owned : 17/04/2020                 |
# | Telegram : KARLOS GEEK                |
# ===========================================
            
            echo ""

               if [ ! -f /usr/local/bin/deleteduser ]; then
               echo "echo "Autoscript by Karlos Geek"" > /usr/local/bin/deleteduser
               chmod +x /usr/local/bin/deleteduser
               fi
               hariini=`date +%d-%m-%Y`
               echo "Autoscript by Karlos Geek"
               echo "Gracias por eliminar los USUARIOS EXPIRADOS"
               echo "--------------------------------------"
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Vaksin- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
               echo "echo "Vaksin- Username : $username are expired at: $tgl $bulantahun and removed : $hariini "" >> /usr/local/bin/deleteduser
	           echo "Username $username that are expired at $tgl $bulantahun removed from the VPS $hariini"
               userdel $username
               fi
               done
               echo " "
               echo "--------------------------------------"
               echo "Script are successfully run"
