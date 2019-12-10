# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
alias gs='git status'
alias gp='git pull'

alias s="neofetch"
alias ssr="sudo python ~/Desktop/shadowsocksr/shadowsocks/local.py -c ~/Desktop/shadowsocksr/shadowsocks/config.json -d start"
alias ssrconfig="sudo python ~/Desktop/shadowsocksr/shadowsocks/local.py -d start -c"
alias ssrstop="cd ~/Desktop/shadowsocksr/shadowsocks/ && sudo python local.py -d stop && cd -"

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="set -e ALL_PROXY"
alias ip="curl -i https://ip.cn"
alias i3config="vim ~/.config/i3/config"
alias comptonconfig="vim ~/.config/compton.conf"
alias vimrc="vim ~/.vimrc"
alias ra="ranger"

