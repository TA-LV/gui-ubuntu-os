#!/bin/bash
g='\e[1;92m'   # Green
b='\e[34m'     # Blue
r='\e[0m'      # Reset
y='\e[1;33m'   # Yellow
c='\e[1;96m'   # Light cyan

banner() {
    clear
    # Box is exactly 29 characters wide
    printf "${b}▛▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▜\n"


    printf "${b}▌${g}█ █ █▀▀█ █ █ █▀▀▄ ▀▀█▀▀ █ █${b}▐\n"


    printf "${b}▌${g}█ █ █▀▀▄ █ █ █  █   █   █ █${b}▐\n"


    printf "${b}▌${g}▀▀▀ ▀▀▀▀ ▀▀▀ ▀  ▀   ▀   ▀▀▀${b}▐\n"


    printf "${b}▌                           ${b}▐\n"


    printf "${b}▌      ${g}GUI-UBUNTU-OS        ${b}▐\n"


    printf "${b}▙▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▟${r}\n\n"


}


banner
printf "${b}[${g}!${b}]${c} Removing ubuntu${g}....." 

proot-distro remove ubuntu


printf "${b}[${g}!${b}]${c} Removing packages${g}....." 

apt remove proot-distro x11-repo termux-x11-nightly -y


printf  "${b}[${g}!${b}]${c} Done!\n"