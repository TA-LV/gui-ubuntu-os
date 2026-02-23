#!/bin/bash
g='\e[1;92m'   # Green
b='\e[34m'     # Blue
r='\e[0m'      # Reset
y='\e[1;33m'   # Yellow
c='\e[1;96m'   # Light cyan
spinner() {
    local msg="$1"
    shift
    local cmd="$*"
    local frames=( "∆___" "_∆__" "__∆_" "___∆" )
    local i=0

    # Start spinner in background
    (
        while :; do
            printf "\r${c}${msg} [${y}${frames[i]}${c}]"
            i=$(( (i + 1) % 4 ))
            sleep 0.5
        done
    ) &
    local spin_pid=$!

    # Run all commands in foreground, hide output
    bash -c "$cmd" >/dev/null 2>&1
    local cmd_status=$?

    # Stop spinner
    kill "$spin_pid" >/dev/null 2>&1
    wait "$spin_pid" 2>/dev/null

    # Print final line
    if [ $cmd_status -eq 0 ]; then
        printf "\r${c}${msg} [${y}∆___${c}] ✅ Done\n"
    else
        printf "\r${c}${msg} [${y}∆___${c}] ❌ Failed\n"
    fi
}
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
spinner "${b}[${g}!${b}]${c} Removing ubuntu${g}....." "proot-distro remove ubuntu"
spinner "${b}[${g}!${b}]${c} Removing packages${g}....." "apt remove proot-distro x11-repo termux-x11-nightly -y"
printf  "${b}[${g}!${b}]${c} Done!\n"