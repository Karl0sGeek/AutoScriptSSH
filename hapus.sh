#!/bin/bash
#Script untuk menghapus user SSH & OpenVPN

read -p "Nombre de usuario SSH para eliminar : " Usuario

if getent passwd $Usuario > /dev/null 2>&1; then
        userdel $Usuario
        echo -e "User $Usuario fue removido."
else
        echo -e "GAGAL: User $Usuario tidak ada."
fi
