 #!/bin/bash
g='\e[1;92m'   # Green
b='\e[34m'     # Blue
r='\e[0m'      # Reset
y='\e[1;33m'   # Yellow
c='\e[1;96m'   # Light cyan
ubuntu_path="$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu"
  #!/bin/bash

# Color Definitions
b='\e[1;34m' # Blue Border
g='\e[1;32m' # Light Green Text
r='\e[0m'    # Reset

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


info()     { printf "${b}[${g}*${b}] ${c}%s${reset}\n" "$1"; }


finish(){
printf "${b}[${g}*${b}]${g} Ubuntu installed! ${r}\n"
printf "${b}[${g}*${b}]${g} Run ${y} ubuntu ${g} to get Ubuntu cli ${r}\n"
printf "${b}[${g}*${b}]${g} If you want GUI , Then run ${r}\n"
printf "${b}[${g}*${b}]${y} ./gui.sh ${r}\n"
}
check_ubuntu_installed() {
    if [[ -d "$ubuntu_path" ]]; then
        printf "${b}[${g}!${b}]${c} Distro already available , skipping progress.${r}\n"
        exit 1
    fi
}
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
check_internet() {
    TARGET_URL="https://github.com/rbasry29-blip/gui-ubuntu-os"

    if command -v curl >/dev/null 2>&1; then
        curl -Is --connect-timeout 5 "$TARGET_URL" >/dev/null 2>&1
    elif command -v wget >/dev/null 2>&1; then
        wget -q --spider --timeout=5 "$TARGET_URL"
    else
        printf "${b}[${g}*${b}]${c} Sorry, wget or curl is required for verification.\n"
        exit 1
    fi

    if [ $? -ne 0 ]; then
        printf "${b}[${g}*${b}]${c} Sorry, internet connection is needed.\n"
        exit 1
    fi
}
software(){
LINES=(
  "Welcome"
  "Wish your work will easier"
  "Let's get started!"
  "Enjoy gui-ubuntu-os"
)

for t in "${LINES[@]}"; do
  for ((i=0;i<${#t};i++)); do
    printf "${C}${B}${t:i:1}${N}"
    ((RANDOM%3==0)) && { printf "${G} ${N}\b"; sleep 0.05; }
    sleep 0.08
  done
  echo
  sleep 2
done
printf "$r"
spinner "${b}[${g}*${b}]${c} Cleaning termux environment${g}....." "dpkg --configure -a && apt --fix-broken install && sleep 5"
sleep 1


yes | termux-setup-storage
spinner "${b}[${g}*${b}]${c} Installing packages${g}....." "yes | apt update  && yes | apt install proot-distro && yes | apt install x11-repo  && yes | apt install termux-x11-nightly && yes | apt install x11-repo "
sleep 1

printf "${b}[${g}*${b}]${g} Installing distro${g}.....${r}\n"
proot-distro install ubuntu
banner
set -e
# Ask for username (TERMUX)
printf "${b}[${g}*${b}]${g}"
read -rp " Enter username: " USERNAME
# Ask for password (TERMUX, hidden)
printf "${b}[${g}*${b}]${g}"
read -rsp " Enter password: " PASSWORD
echo
# Run everything INSIDE Ubuntu
proot-distro login ubuntu -- bash -c "
set -e
# Create user (no full name, no questions)
useradd -m -s /bin/bash \"$USERNAME\"
# Set password non-interactively
echo \"$USERNAME:$PASSWORD\" | chpasswd
# Add to sudo group
usermod -aG sudo \"$USERNAME\"
"
printf "${b}[${g}*${b}]${g} User '$USERNAME' created and added to sudo group inside Ubuntu.\n"
sleep 3
banner
cat > $PREFIX/bin/server << 'EOF'
#!/bin/bash
echo Starting server... started!
termux-x11 :0
EOF

chmod +x $PREFIX/bin/server
cat > $PREFIX/bin/ubuntu << EOF
#!/bin/bash
proot-distro login ubuntu --shared-tmp -- su - $USERNAME
EOF

chmod +x $PREFIX/bin/ubuntu
}
banner
info "Copyright (c) 2026 rbasry29-blip"
check_internet
check_ubuntu_installed
printf "$c"
software
finish