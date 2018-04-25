alias ~="cd ~" # ~:         Go Home
alias ip="curl icanhazip.com" # ip:        Your public IP address
alias ut="uptime" # ut:        Computer uptime
alias numfiles="echo $(ls -1 | wc -l)" # numfiles:  Count of non-hidden files in current dir

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
function wheather {
  curl --insecure wttr.in/$1
}
