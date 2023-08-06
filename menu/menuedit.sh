#!/bin/bash
# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
#INTALLER-UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/mixsc/permission/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/mixsc/permission/main/ip | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS https://raw.githubusercontent.com/mixsc/permission/main/ip | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | Geo Project
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | Geo Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON✓${NC}"
else
   status_ssh="${RED}🔴${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON✓${NC}"
else
    status_ws_epro="${RED}🔴${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON✓${NC}"
else
   status_haproxy="${RED}🔴${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON✓${NC}"
else
   status_xray="${RED}🔴${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON✓${NC}"
else
   status_nginx="${RED}🔴${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON✓${NC}"
else
   status_dropbear="${RED}🔴${NC} "
fi
#####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
r="\033[1;31m"  #REDTERANG
a=" ${CYAN}ACCOUNT PREMIUM" 
echo -e " "
figlet  MyRidwanVPN  | lolcat
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC\033[41m         Welcome To Script Premium Ridwan Store           $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y System OS ${NC}     $Blue=$NC $MODEL${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Server RAM ${NC}    $Blue=$NC $RAM MB $NC"
echo -e " ${z}│$NC$r ⇲ $NC$y Uptime Server ${NC} $Blue=$NC $SERONLINE${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Date ${NC}          $Blue=$NC $DATEVPS${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Time ${NC}          $Blue=$NC $TIMEZONE${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y IP VPS ${NC}        $Blue=$NC $IPVPS${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Domain ${NC}        $Blue=$NC $domain${NC}"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "                ${KIRI} ${purple}INFORMATION ACCOUNT${NC} ${KANAN}"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "           ${CYAN}SSH/OPENVPN${NC}    $y=$NC $ssh1${NC}" "$a"
echo -e "           VMESS/WS/GRPC${NC}  $y=$NC $vma$NC" "$a"
echo -e "           VLESS/WS/GRPC${NC}  $y=$NC $vla$NC" "$a"
echo -e "           TROJAN/WS/GRPC${NC} $y=$NC $trb${NC}" "$a"
echo -e "           SHADOW/WS/GRPC${NC} $y=$NC $ssa${NC} $a"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "               ${KIRI} ${purple}JANGAN LUPA BERBAGI YA${NC} ${KANAN}"
echo -e " ${z}╭════════════════╮╭══════════════════╮╭════════════════════╮${NC}"
echo -e " ${z}│ ${NC}$y SSH$NC : $status_ssh" "        $y NGINX$NC : $status_nginx" "        $y XRAY$NC : $status_xray      $NC${z}│$NC" 
echo -e " ${z}│ ${NC}$y WS-ePRO$NC : $status_ws_epro" "    $y DROPBEAR$NC : $status_dropbear" "     $y HAPROXY$NC : $status_haproxy   $NC${z}│$NC" 
echo -e " ${z}╰════════════════╯╰══════════════════╯╰════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC [${r}01${NC}]$purple SSH MENU$NC     ${z}│$NC [${r}08${NC}]$purple DELL ALL EXP$NC ${z}│$NC [${r}15${NC}]$purple BCKP/RSTR   $NC${z}│$NC"
echo -e " ${z}│$NC [${r}02${NC}]$purple VMESS MENU$NC   ${z}│$NC [${r}09${NC}]$purple AUTOREBOOT$NC  ${z} │$NC [${r}16${NC}]$purple REBOOT      $NC${z}│$NC"    
echo -e " ${z}│$NC [${r}03${NC}]$purple VLESS MENU$NC   ${z}│$NC [${r}10${NC}]$purple INFO PORT$NC   ${z} │$NC [${r}17${NC}]$purple RESTART     $NC${z}│$NC"   
echo -e " ${z}│$NC [${r}04${NC}]$purple TROJAN MENU$NC  ${z}│$NC [${r}11${NC}]$purple SPEEDTEST$NC   ${z} │$NC [${r}18${NC}]$purple DOMAIN      $NC${z}│$NC" 
echo -e " ${z}│$NC [${r}05${NC}]$purple SHADOW MENU$NC  ${z}│$NC [${r}12${NC}]$purple RUNNING$NC     ${z} │$NC [${r}19${NC}]$purple CERT SSL    $NC${z}│$NC"
echo -e " ${z}│$NC [${r}06${NC}]$purple TRIAL MENU$NC   ${z}│$NC [${r}13${NC}]$purple CLEAR LOG$NC   ${z} │$NC [${r}20${NC}]$purple INS. UDP    $NC${z}│$NC"
echo -e " ${z}│$NC [${r}07${NC}]$purple VPS INFO$NC     ${z}│$NC [${r}14${NC}]$purple CREATE SLOW$NC ${z} │$NC [${r}21${NC}]$purple CLEAR CACHE $NC${z}│$NC"
echo -e " ${z}│$NC [${r}22${NC}]$purple BOT NOTIF$NC    ${z}|$NC [${r}23${NC}]$purple UPDATE SCRIPT$NC${z}|$NC [${r}24${NC}]$purple BOT PANEL   $NC${z}│$NC"
echo -e " ${z}│                                                          $NC${z}│$NC"
echo -e " ${z}│$NC [${r}00${NC}]$purple BACK TO EXIT MENU$NC ${KANAN} \E[0m\033[0;34m                              $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC$y Version$NC       ${Blue}=$NC V3.0"
echo -e " ${z}│$NC$y User$NC          ${Blue}=$NC $username"
echo -e " ${z}│$NC$y Script Status$NC ${Blue}=$NC $sts "
echo -e " ${z}│$NC$y Expiry script$NC $Blue=$green $exp$NC ($r $certifacate ${NC}Days )"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
m-trial
;;
7 | 07)
clear
gotop
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
8 | 08)
clear
xp
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
9 | 09)
clear
autoreboot
;;
10)
clear
prot
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
11)
clear
speedtest
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
12)
clear
run
;;
13)
clear
clearlog
;;
14)
clear
sd
;;
15)
clear
menu-backup
;;
16)
clear
reboot
;;
17)
clear
restart
;;
18)
clear
addhost
;;
19)
clear
fixcert
;;
20)
clear
echo -e "${green}ANDA YAKIN UNTUK MEMASANG SCRIPT INI ? $NC"
echo -e "${green}MINIMAL RAM 2 GB BIAR DISK TIDAK FULL $NC"
echo -e "${green}OS SUPPORT UBUNTU 20.04 ONLY $NC"
echo -e ""
read -p "SUDAH LAPOR KE ADMIN ? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  echo -e "${green}START. . . $NC"
elif [[ $arg == 'y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  clear
  echo -e "${Blue}START . . .$NC"
elif [[ $arg == 'N' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  menu
  exit 0
elif [[ $arg == 'n' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
else
  echo -e "${RED}Argumen Tidak Diketahui! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
fi
##########
clear
wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp
;;
21)
clear
clearcache
;;
22)
clear
bot
;;
23)
clear
echo -e "${green}ANDA YAKIN UNTUK UPDATE SCRIPT INI ? $NC"
echo -e "${green}MINIMAL RAM 2 GB BIAR DISK TIDAK FULL $NC"
echo -e "${green}OS SUPPORT UBUNTU 20.04 ONLY $NC"
wget https://raw.githubusercontent.com/mixsc/kaki/main/update.sh && chmod +x update.sh && ./update.sh
;;
24)
clear
add-bot-panel
;;
0 | 00)
figlet KYT PROJECT
exit
;;
x)
menu
;;
*)
echo -e ""
menu
;;
esac