#!/bin/bash
# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BIPurple='\033[1;95m'     # Purple
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
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
CITY=$(curl -s ipinfo.io/city)
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

# data kuota
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')" 
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"

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
## status
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON✅${NC}"
else
ressh="${red}🔴${NC}"
fi
sshstunel=$(service stunnel5 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON✅${NC}"
else
resst="${red}🔴${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON✅${NC}"
else
ressshws="${red}🔴${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON✅${NC}"
else
resngx="${red}🔴${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON✅${NC}"
else
resdbr="${red}🔴${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON✅${NC}"
else
resv2r="${red}🔴${NC}"
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
#figlet  WhiteVPN  | lolcat
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC\033[41m         Welcome To Script Premium White Store            $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭──────────────────────────────────────────────────────────╮${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y System OS ${NC}     $Blue=$NC $MODEL${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Isp Vps    ${NC}    $Blue=$NC $ISP$NC"
echo -e " ${z}│$NC$r ⇲ $NC$y Server RAM ${NC}    $Blue=$NC $RAM MB $NC"
echo -e " ${z}│$NC$r ⇲ $NC$y Uptime Server ${NC} $Blue=$NC $SERONLINE${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Date ${NC}          $Blue=$NC $DATEVPS${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Time ${NC}          $Blue=$NC $TIMEZONE${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y IP VPS ${NC}        $Blue=$NC $IPVPS${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Domain ${NC}        $Blue=$NC $domain${NC}"
echo -e " ${z}╰──────────────────────────────────────────────────────────╯${NC}"
echo -e "                ${KIRI} ${purple}INFORMATION ACCOUNT${NC} ${KANAN}"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "           ${CYAN}SSH/OPENVPN${NC}    $y=$NC $ssh1${NC}" "$a"
echo -e "           VMESS/WS/GRPC${NC}  $y=$NC $vma$NC" "$a"
echo -e "           VLESS/WS/GRPC${NC}  $y=$NC $vla$NC" "$a"
echo -e "           TROJAN/WS/GRPC${NC} $y=$NC $trb${NC}" "$a"
echo -e "           SHADOW/WS/GRPC${NC} $y=$NC $ssa${NC} $a"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "               ${KIRI} ${purple}JANGAN LUPA MAKAN YA${NC} ${KANAN}"
echo -e " ${z}╭──────────────────────────────────────────────────────────╮${NC}"
echo -e " ${NC}    SSH ${NC}: $ressh"" ${NC} NGINX ${NC}: $resngx"" ${NC}  XRAY ${NC}: $resv2r"" ${NC} TROJAN ${NC}: $resv2r"
echo -e " ${NC}            DROPBEAR ${NC}: $resdbr" "${NC} SSH-WS ${NC}: $ressshws"
echo -e " ${z}╰──────────────────────────────────────────────────────────╯${NC}"
echo -e " ${z}╭──────────────────────────────────────────────────────────╮${NC}"
echo -e " ${z}$NC [${r}01${NC}]$purple SSH/UDP        ${z}[${NC}MENU${z}]$NC"
echo -e " ${z}$NC [${r}02${NC}]$purple VMESS          ${z}[${NC}MENU${z}]$NC"    
echo -e " ${z}$NC [${r}03${NC}]$purple VLESS          ${z}[${NC}MENU${z}]$NC"   
echo -e " ${z}$NC [${r}04${NC}]$purple TROJAN         ${z}[${NC}MENU${z}]$NC" 
echo -e " ${z}$NC [${r}05${NC}]$purple SHADOW         ${z}[${NC}MENU${z}]$NC"
echo -e " ${z}$NC [${r}06${NC}]$purple BACKUP/RESTORE ${z}[${NC}MENU${z}]$NC"
echo -e " ${z}$NC [${r}07${NC}]$purple SETTINGS       ${z}[${NC}MENU${z}]$NC"
echo -e " ${z}$NC [${r}08${NC}]$purple INFO SCRIPT$NC"
echo -e " ${z}$NC [${r}09${NC}]$purple INFO SERVER$NC"
echo -e " ${z}$NC [${r}10${NC}]$purple INSTAL UDP$NC"
echo -e " "
echo -e " ${z}$NC [${r}xx${NC}]$purple EXIT$NC ${KANAN}$NC"
echo -e " ${z}╰──────────────────────────────────────────────────────────╯${NC}"
echo -e " ${z}╭──────────────────────────────────────────────────────────╮${NC}"
echo -e "${z} │  ${green}  HARI ini${NC}: ${y}$ttoday$NC ${green}KEMARIN${NC}: ${y}$tyest$NC ${green}BULAN${NC}: ${y}$tmon$NC $NC" 
echo -e " ${z}╰──────────────────────────────────────────────────────────╯${NC}"
echo -e " ${z}╭──────────────────────────────────────────────────────────╮${NC}"
echo -e " ${z}│$NC$y Version$NC       ${Blue}=$NC $(cat /opt/.ver) Last Update"
echo -e " ${z}│$NC$y User$NC          ${Blue}=$NC $username"
echo -e " ${z}│$NC$y Script Status$NC ${Blue}=$NC $sts "
echo -e " ${z}│$NC$y Expiry script$NC $Blue=$green $exp$NC ($r $certifacate ${NC}Days )"
echo -e " ${z}╰──────────────────────────────────────────────────────────╯${NC}"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-ss ;;
6) clear ; menu-backup ;;
7) clear ; menu-set ;;
8) clear ; info ;;
9) clear ; infoserv ;;
10) clear ; clear ; wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
