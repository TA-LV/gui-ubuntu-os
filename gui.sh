#!/bin/bash
g='\e[1;92m'
b='\e[34m'
r='\e[0m'
y='\e[1;33m'
c='\e[1;96m'
 
banner() {
    clear                                                                   # Box is exactly 29 characters wide                                     printf "${b}▛▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▜\n"                            printf "${b}▌${g}█ █ █▀▀█ █ █ █▀▀▄ ▀▀█▀▀ █ █${b}▐\n"
    printf "${b}▌${g}█ █ █▀▀▄ █ █ █  █   █   █ █${b}▐\n"                    printf "${b}▌${g}▀▀▀ ▀▀▀▀ ▀▀▀ ▀  ▀   ▀   ▀▀▀${b}▐\n"
    printf "${b}▌                           ${b}▐\n"
    printf "${b}▌      ${g}GUI-UBUNTU-OS        ${b}▐\n"
    printf "${b}▙▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▟${r}\n\n"
}
check_internet() {
    TARGET_URL="https://github.com/rbasry29-blip/gui-ubuntu-os"

    if command -v curl >/dev/null 2>&1; then
        curl -Is --connect-timeout 5 "$TARGET_URL" >/dev/null 2>&1
    elif command -v wget >/dev/null 2>&1; then
        wget -q --spider --timeout=5 "$TARGET_URL"
    else
        echo "Error: curl or wget is required to check internet connection."
        exit 1
    fi

    if [ $? -ne 0 ]; then
        echo "Sorry, internet connection is needed."
        exit 1
    fi
}

# Run internet check before anything else
banner
check_internet
install_full_desktop(){
banner
printf "${b}[${g}*${b}]${c} Updating packages ${g}.....${r}\n"

# Login to Ubuntu and run commands sequentially
proot-distro login ubuntu -- apt update -y
banner
printf "${b}[${g}*${b}]${c} Installing packages ${g}.....${r}\n"
proot-distro login ubuntu -- dpkg --configure -a
proot-distro login ubuntu -- apt update -y

printf "${c}[${g}*${c}]${g} Installing fwupd${r}\n"
proot-distro login ubuntu -- apt install fwupd -y




printf "${c}[${g}*${c}]${g} Installing fwupdate${r}\n"
proot-distro login ubuntu -- apt install fwupdate -y



printf "${c}[${g}*${c}]${g} Installing udisks2${r}\n"
proot-distro login ubuntu -- apt install udisks2 -y

printf "${c}[${g}*${c}]${g} Installing upower${r}\n"
proot-distro login ubuntu -- apt install upower -y

printf "${c}[${g}*${c}]${g} Installing cups${r}\n"
proot-distro login ubuntu -- apt install cups -y

printf "${c}[${g}*${c}]${g} Installing cups-browsed${r}\n"
proot-distro login ubuntu -- apt install cups-browsed -y

printf "${c}[${g}*${c}]${g} Installing cups-client${r}\n"
proot-distro login ubuntu -- apt install cups-client -y

printf "${c}[${g}*${c}]${g} Installing cups-common${r}\n"
proot-distro login ubuntu -- apt install cups-common -y

printf "${c}[${g}*${c}]${g} Installing cups-daemon${r}\n"
proot-distro login ubuntu -- apt install cups-daemon -y

printf "${c}[${g}*${c}]${g} Installing cups-server-common${r}\n"
proot-distro login ubuntu -- apt install cups-server-common -y

printf "${c}[${g}*${c}]${g} Installing printer-driver-all${r}\n"
proot-distro login ubuntu -- apt install printer-driver-all -y

printf "${c}[${g}*${c}]${g} Installing printer-driver-gutenprint${r}\n"
proot-distro login ubuntu -- apt install printer-driver-gutenprint -y

printf "${c}[${g}*${c}]${g} Installing printer-driver-hpcups${r}\n"
proot-distro login ubuntu -- apt install printer-driver-hpcups -y

printf "${c}[${g}*${c}]${g} Installing printer-driver-brlaser${r}\n"
proot-distro login ubuntu -- apt install printer-driver-brlaser -y

printf "${c}[${g}*${c}]${g} Installing printer-driver-foo2zjs${r}\n"
proot-distro login ubuntu -- apt install printer-driver-foo2zjs -y

printf "${c}[${g}*${c}]${g} Installing printer-driver-ptouch${r}\n"
proot-distro login ubuntu -- apt install printer-driver-ptouch -y

printf "${c}[${g}*${c}]${g} Installing printer-driver-splix${r}\n"
proot-distro login ubuntu -- apt install printer-driver-splix -y

printf "${c}[${g}*${c}]${g} Installing colord${r}\n"
proot-distro login ubuntu -- apt install colord -y

printf "${c}[${g}*${c}]${g} Installing geoclue-2.0${r}\n"
proot-distro login ubuntu -- apt install geoclue-2.0 -y

printf "${c}[${g}*${c}]${g} Installing avahi-daemon${r}\n"
proot-distro login ubuntu -- apt install avahi-daemon -y

printf "${c}[${g}*${c}]${g} Installing avahi-utils${r}\n"
proot-distro login ubuntu -- apt install avahi-utils -y

printf "${c}[${g}*${c}]${g} Installing modemmanager${r}\n"
proot-distro login ubuntu -- apt install modemmanager -y

printf "${c}[${g}*${c}]${g} Installing network-manager${r}\n"
proot-distro login ubuntu -- apt install network-manager -y

printf "${c}[${g}*${c}]${g} Installing bluez${r}\n"
proot-distro login ubuntu -- apt install bluez -y

printf "${c}[${g}*${c}]${g} Installing bluetooth${r}\n"
proot-distro login ubuntu -- apt install bluetooth -y

printf "${c}[${g}*${c}]${g} Installing bolt${r}\n"
proot-distro login ubuntu -- apt install bolt -y



printf "${c}[${g}*${c}]${g} Installing isc-dhcp-client${r}\n"
proot-distro login ubuntu -- apt install isc-dhcp-client -y

printf "${c}[${g}*${c}]${g} Installing isc-dhcp-common${r}\n"
proot-distro login ubuntu -- apt install isc-dhcp-common -y

printf "${c}[${g}*${c}]${g} Installing ppp${r}\n"
proot-distro login ubuntu -- apt install ppp -y



printf "${c}[${g}*${c}]${g} Installing ubuntu-drivers-common${r}\n"
proot-distro login ubuntu -- apt install ubuntu-drivers-common -y

printf "${c}[${g}*${c}]${g} Installing ubuntu-release-upgrader-core${r}\n"
proot-distro login ubuntu -- apt install ubuntu-release-upgrader-core -y

printf "${c}[${g}*${c}]${g} Installing ubuntu-standard${r}\n"
proot-distro login ubuntu -- apt install ubuntu-standard -y

printf "${c}[${g}*${c}]${g} Installing whoopsie${r}\n"
proot-distro login ubuntu -- apt install whoopsie -y

printf "${c}[${g}*${c}]${g} Installing apport${r}\n"
proot-distro login ubuntu -- apt install apport -y

printf "${c}[${g}*${c}]${g} Installing apport-symptoms${r}\n"
proot-distro login ubuntu -- apt install apport-symptoms -y

printf "${c}[${g}*${c}]${g} Installing friendly-recovery${r}\n"
proot-distro login ubuntu -- apt install friendly-recovery -y

printf "${c}[${g}*${c}]${g} Installing plymouth${r}\n"
proot-distro login ubuntu -- apt install plymouth -y

printf "${c}[${g}*${c}]${g} Installing plymouth-theme-ubuntu-text${r}\n"
proot-distro login ubuntu -- apt install plymouth-theme-ubuntu-text -y

printf "${c}[${g}*${c}]${g} Installing multipath-tools${r}\n"
proot-distro login ubuntu -- apt install multipath-tools -y

printf "${c}[${g}*${c}]${g} Installing irqbalance${r}\n"
proot-distro login ubuntu -- apt install irqbalance -y

printf "${c}[${g}*${c}]${g} Installing xserver-xorg-video-all${r}\n"
proot-distro login ubuntu -- apt install xserver-xorg-video-all -y

printf "${c}[${g}*${c}]${g} Installing dbus-x11${r}\n"
proot-distro login ubuntu -- apt install dbus-x11 -y

printf "${c}[${g}*${c}]${g} Installing xubuntu-desktop${r}\n"
proot-distro login ubuntu -- apt install xubuntu-desktop -y





# Colors
b="\e[1;34m"   # Blue
g="\e[1;92m"   # Light green
c="\e[1;96m"   # Light cyan
r="\e[0m"      # Reset

# --------------------------
#
# --------------------------

# Browser
banner
printf " ${b}[${g}*${b}]${c} Select Browser${r}\n"
printf " ${b}[${g}1${b}]${c} Firefox ESR${r}\n"
printf " ${b}[${g}2${b}]${c} Falkon${r}\n"
printf " ${b}[${g}3${b}]${c} Both (Firefox ESR + Falkon)${r}\n"
printf " ${b}[${g}4${b}]${c} Skip${r}\n"
printf " ${b}[${g}*${b}]${c} Enter option: "
read BROWSER_CHOICE

# Text Editor (only nano)
banner
printf " ${b}[${g}*${b}]${c} Do you want to install Text Editor (nano)?${r}\n"
printf " ${b}[${g}1${b}]${c} Yes${r}\n"
printf " ${b}[${g}2${b}]${c} No${r}\n"
printf " ${b}[${g}*${b}]${c} Enter option: "
read EDITOR_CHOICE

# MPV Player
banner
printf " ${b}[${g}*${b}]${c} Do you want to install MPV Player ?${r}\n"
printf " ${b}[${g}1${b}]${c} Yes${r}\n"
printf " ${b}[${g}2${b}]${c} No${r}\n"
printf " ${b}[${g}*${b}]${c} Enter option: "
read MPV_CHOICE

# Graphic Tool
banner
printf " ${b}[${g}*${b}]${c} Select Graphic Tool${r}\n"
printf " ${b}[${g}1${b}]${c} GIMP${r}\n"
printf " ${b}[${g}2${b}]${c} Inkscape${r}\n"
printf " ${b}[${g}3${b}]${c} Both${r}\n"
printf " ${b}[${g}4${b}]${c} Skip${r}\n"
printf " ${b}[${g}*${b}]${c} Enter option: "
read GFX_CHOICE

# Display Manager
banner
printf " ${b}[${g}*${b}]${c} Select Display Manager${r}\n"
printf " ${b}[${g}1${b}]${c} lightdm${r}\n"
printf " ${b}[${g}2${b}]${c} xdm${r}\n"
printf " ${b}[${g}3${b}]${c} Skip${r}\n"
printf " ${b}[${g}*${b}]${c} Enter option: "
read DM_CHOICE

# --------------------------
# After choices: print banner + installing message
# --------------------------
clear
banner

printf "${b}[${g}*${b}]${c} Installing selected packages ${r}\n"

# --------------------------
# Update inside proot once (so apt-cache checks will be current)
# --------------------------
printf "${b}[${g}*${b}]${c} Updating package lists inside Ubuntu... ${r}\n"


# --------------------------
# Prepare list of packages to try installing (based on user choices)
# --------------------------
PKGS_TO_INSTALL=()

# Browser selection mapping
case "$BROWSER_CHOICE" in
    1) PKGS_TO_INSTALL+=("firefox") ;;
    2) PKGS_TO_INSTALL+=("falkon") ;;
    3) PKGS_TO_INSTALL+=("firefox" "falkon") ;;
    *) ;;
esac

# Text editor mapping
case "$EDITOR_CHOICE" in
    1) PKGS_TO_INSTALL+=("nano") ;;
    *) ;;  # No installation if 2 (No) is selected
esac

# MPV
case "$MPV_CHOICE" in
    1) PKGS_TO_INSTALL+=("mpv") ;;
    *) ;;
esac

# Graphic tools
case "$GFX_CHOICE" in
    1) PKGS_TO_INSTALL+=("gimp") ;;
    2) PKGS_TO_INSTALL+=("inkscape") ;;
    3) PKGS_TO_INSTALL+=("gimp" "inkscape") ;;
    *) ;;
esac

# Display manager
case "$DM_CHOICE" in
    1) PKGS_TO_INSTALL+=("lightdm") ;;
    2) PKGS_TO_INSTALL+=("xdm") ;;
    *) ;;
esac

# remove duplicates while preserving order
UNIQ_PKGS=()
for p in "${PKGS_TO_INSTALL[@]}"; do
    skip=0
    for q in "${UNIQ_PKGS[@]}"; do
        if [ "$p" = "$q" ]; then skip=1; break; fi
    done
    if [ $skip -eq 0 ]; then UNIQ_PKGS+=("$p"); fi
done

# --------------------------
# For each package: check availability then install
# --------------------------
for pkg in "${UNIQ_PKGS[@]}"; do
    proot-distro login ubuntu -- bash -lc "apt-cache show ${pkg} >/dev/null 2>&1"
    if [ $? -eq 0 ]; then
        printf "${b}[${g}*${b}]${c} Installing: ${pkg} ${r}\n"
        proot-distro login ubuntu -- apt install -y "${pkg}"
        if [ $? -eq 0 ]; then
            printf "${b}[${g}*${b}]${c} ${pkg} installed successfully${r}\n"
        else
            printf "${b}[${g}*${b}]${c} Failed to install ${pkg} (see apt output).${r}\n" && dpkg --configure -a
        fi
    else
        printf "${b}[${g}*${b}]${c} ${pkg} not found in Ubuntu repos — skipping${r}\n"
    fi
done

# Done message
printf "${b}[${g}*${b}]${c} Installation process finished${r}\n"



sleep 3
banner

printf "${b}[${g}*${b}]${g} Creating launchers ${g}.....${r}\n"




# Create gui launcher inside Ubuntu
proot-distro login ubuntu -- bash -c "cat > /usr/bin/gui << 'EOF'
#!/bin/bash
export DISPLAY=:0
dbus-launch
xfce4-session &
EOF
chmod +x /usr/bin/gui"

printf "${b}[${g}*${b}]${g} Adding finishing touches ${g}.....${r}\n"
proot-distro login ubuntu -- dpkg --configure -a
finish
}
finish(){
banner
printf "${b}[${g}*${b}]${c} Finishing ${g}.....\n"
printf "${b}[${g}*${b}]${c}${g} Everything is good!\n"
printf "${b}[${g}*${b}]${c}${g} You can launch Ubuntu via termux-x11 using commands:\n"
printf "${b}[${g}*${b}]${c}${g} server${c}\n"
printf "${b}[${g}*${b}]${g} Then open another session and run -\n"
printf "${b}[${g}*${b}]${c}${y} ubuntu${c}\n"
printf "${b}[${g}*${b}]${g} Inside ubuntu run -\n"
printf "${b}[${g}*${b}]${c}${y} gui${c}\n"
printf "${b}[${g}*${b}]${g} Then open Termux-x11 and \n"
printf "${b}[${g}*${b}]${c} Enjoy! ${r}\n"
}

install_lite_desktop(){
banner
printf "${c}[${g}*${c}]${g} Updating packages${g}.....${r}\n"
proot-distro login ubuntu -- apt update -y
banner
printf "${c}[${g}*${c}]${g} Installing xfce4-session${r}\n"
proot-distro login ubuntu -- apt install xfce4-session -y
printf "${c}[${g}*${c}]${g} Installing xfce4${r}\n"
proot-distro login ubuntu -- apt install xfce4 -y
printf "${c}[${g}*${c}]${g} Installing dbus-x11${r}\n"
proot-distro login ubuntu -- apt install dbus-x11 -y
banner
finish
proot-distro login ubuntu -- bash -c "cat > /usr/bin/gui << 'EOF'
#!/bin/bash
export DISPLAY=:0
dbus-launch
xfce4-session &
EOF
chmod +x /usr/bin/gui"
}
desktop_configuration() {
    banner
    printf "${b}[${g}1${b}]${c} Full Desktop [8GB] ${r}\n"
    printf "${b}[${g}2${b}]${c} Lite Desktop [2GB] ${r}\n"
    printf "${b}[${g}2${b}]${c}"
    printf "$c"
    read -p " Enter selection [1-2]: " selection

    if [ "$selection" = "1" ]; then
        install_full_desktop
    elif [ "$selection" = "2" ]; then
        install_lite_desktop
    else
        printf "${b}[${g}!${b}]${c} Incorrect choice${r}\n"
    fi
}

desktop_configuration