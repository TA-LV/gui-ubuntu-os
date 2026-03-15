#!/bin/bash
g='\e[1;92m'   # Green
b='\e[34m'     # Blue
r='\e[0m'      # Reset
y='\e[1;33m'   # Yellow
c='\e[1;96m'   # Light cyan
bl="\e[1m"     # bold
red='\e[1;31m' # Red


ubuntu_path="$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu"


# Color Definitions


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


info()     { printf "${bl}${b}[${g}*${b}] ${c}%s${r}\n" "$1"; }
warn()     { printf "${bl}${b}[${red}!${b}] ${red}%s${r}\n" "$1"; }

finish(){
printf "${b}[${g}*${b}]${g} Ubuntu installed! ${r}\n"
printf "${b}[${g}*${b}]${c} Log in : ${y} ubuntu  ${r}\n"
printf "${b}[${g}*${b}]${g} If you want GUI , Then run ${r}\n"
printf "${b}[${g}*${b}]${y} ./gui.sh ${r}\n"
info "Enjoy!"
info "Have a nice day!"
}


check_ubuntu_installed() {
    if [[ -d "$ubuntu_path" ]]; then
        warn "Distro already available , skipping progress"
        exit 1
    fi
}
spinner() {
    local msg="$1"
    shift
    local cmd="$*"
    local frames=( "▶───" "─▶──" "──▶─" "───▶" )
    local i=0

    # Start spinner in background
    (
        while :; do
            printf "\r${bl}${c}${msg} [${y}${frames[i]}${c}]"
            i=$(( (i + 1) % 4 ))
            sleep 0.2
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
        printf "\r${c}${msg} [${y}✅✅${c}] \n"
    else
        printf "\r${c}${msg} [${y}❌❌${c}]\n"
    fi
}
check_dependencies() {
    spinner "${b}[${g}*${b}]${c} Updating and Upgrading packages..." "yes | apt update ; yes | apt upgrade ; sleep 1"

    info "Checking package dependencies..."


    REQUIRED_PACKAGES=("proot-distro" "x11-repo" "termux-x11-nightly" "curl" "wget")
    for PACKAGE_NAME in "${REQUIRED_PACKAGES[@]}"; do
        if dpkg -s "$PACKAGE_NAME" &> /dev/null; then
            printf "${bl}${y}~${g}> ${y}$PACKAGE_NAME ${b}is installed${r}\n\n"
        else
            printf "${bl}${y}~${g}> ${y}$PACKAGE_NAME ${b} is not installed.${c} Installing...${r}" ; sleep 1
            sleep 2
            apt install -y "$PACKAGE_NAME" &>/dev/null ; printf "${y} Done!!${r}\n\n" || {
                warn "ERROR: Failed to install ${PACKAGE_NAME}. Exiting."
                exit 1
            }
        fi
    done

}
check_internet() {
    TARGET_URL="https://github.com/TA-LV/gui-ubuntu-os"

    if command -v curl >/dev/null 2>&1; then
        curl -Is --connect-timeout 5 "$TARGET_URL" >/dev/null 2>&1
    elif command -v wget >/dev/null 2>&1; then
        wget -q --spider --timeout=5 "$TARGET_URL"
    else
        warn "Sorry, wget or curl is required for verification."
        exit 1
    fi

    if [ $? -ne 0 ]; then
        warn "Sorry, internet connection is needed."
        exit 1
    fi
}
software(){
LINES=(
  "    Welcome"
  "    Wish your work will easier"
  "    lets's get started!"
  "    Enjoy gui-ubuntu-os"
  "    Support : If it helped you,"
  "    * please give a star"
  "    to this repo. "
  "    * Your star keeps repo alive."
)

for t in "${LINES[@]}"; do
  for ((i=0;i<${#t};i++)); do
    printf "${C}${B}${t:i:1}${N}"
    ((RANDOM%3==0)) && { printf "${G} ${N}\b"; sleep 0.01; }
    sleep 0.05
  done
  echo
  sleep 2
done
printf "$r"
check_dependencies
spinner "${b}[${g}*${b}]${c} Preparing environment${g}....." "dpkg --configure -a ; apt --fix-broken install ; sleep 5"
sleep 1


yes | termux-setup-storage

sleep 1

printf "${b}[${g}*${b}]${c} Installing distro${g}.....${r}\n"
proot-distro install ubuntu
banner
set -e
# Ask for username (TERMUX)
printf "${g}█${c}▶${y}"
read -rp " Enter your ubuntu username: " USERNAME
# Ask for password (TERMUX, hidden)
printf "${g}█${c}▶${y}"
read -rp " Create a password: " PASSWORD
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
printf "${g}█${c}▶${y} User ${c}'$USERNAME' ${y}created and added to sudo group inside Ubuntu.\n"
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
info "Copyright (c) 2026 TA-LV"
# check_internet
# check_ubuntu_installed
printf "$c"
software
finish
