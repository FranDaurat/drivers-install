#!/bin/bash

tput civis

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c() {
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  tput cnorm
  exit 1
}

# Ctrl+C
trap ctrl_c INT

# Variables de configuración
USER_HOME="/home/elgordoponcio"

# Funciones
function update_upgrade(){
    echo -e "${blueColour}[+] Instalando dependencias... ${endColour}"
    sudo apt update -y &>/dev/null 
    sudo apt upgrade -y &>/dev/null
    sudo apt dist-upgrade -y &>/dev/null
    sudo apt install realtek-rtl88xxau-dkms -y &>/dev/null
    sudo apt install dkms -y &>/dev/null
    sudo apt-get install linux-headers-$(uname -r) &>/dev/null
} 

function repo(){
    echo -e "${blueColour}[+] Clonando repo y compilando... ${endColour}"
    git clone https://github.com/aircrack-ng/rtl8812au &>/dev/null
    cd rtl8812au/ &>/dev/null
    sudo make ARCH=x86_64 CROSS_COMPILE= -C /lib/modules/$(uname -r)/build M=${USER_HOME}/drivers-install/rtl8812au modules V=1 &>/dev/null
    make &>/dev/null
    sudo make install &>/dev/null
}

# Llamada a funciones
update_upgrade
repo
wait

echo -e "\n\n${greenColour}[*] Instalación terminada${endColour}\n"
tput cnorm
