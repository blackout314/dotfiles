if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# jump
export MARKPATH=$HOME/.marks

function j {
      cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function m {
      mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function um {
      rm -i "$MARKPATH/$1"
}
function ms {
      \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

# strange
ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo -e "\n${RED}Public facing IP Address :$NC " ; ip
}

# torsocks
function ton {
  . torsocks on
}
function tof {
  . torsocks off
}
function tip {
  wget -qO- https://check.torproject.org/ -U "Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0" | egrep -i "Congratulations. This browser is configured to use Tor.|Sorry. You are not using Tor." | uniq
}

# utils
## weather
function wtt {
  curl --insecure wttr.in/$1
}
## cheat.sh
function csh {
  echo $1
  curl --insecure "cheat.sh/$1"
}
## rate.sx
function rsh {
  echo $1
  curl --insecure "eur.rate.sx/$1"
}

## -- utils 
hgrip(){ 
history | grep $1
}

certspotter(){
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s https://crt.sh/?q=%.$1  | sed 's/<\/\?[^>]\+>//g' | grep $1
}

certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

certbrute(){
cat $1.txt | while read line; do python3 dirsearch.py -e . -u "https://$line"; done
}

ipinfo(){
curl http://ipinfo.io/$1
}

## -- tools
dirsearch(){
cd /tools/dirsearch*
python3 dirsearch.py -e . -u $1
}

sqlmap(){
cd /tools/sqlmap*
python sqlmap.py -u $1 
}

knock(){
cd /home/tools/knock/knockpy
python knockpy.py -w list.txt $1
}

ncx(){
nc -l -n -vv -p $1 -k
}
