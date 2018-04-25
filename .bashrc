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
