# History in cache directory:
export EDITOR=nvim
export HISTSIZE=8000
export SAVEHIST=8000
export HISTFILE=$HOME/.zsh_history

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LC_CTYPE=en_US.UTF-8

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="gnzh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

ZSH_CUSTOM=$HOME/.config/zsh

# Add wisely, as too many plugins slow down shell startup.
# web-search support `google`, `baidu`, `github`, etc.
# e.g, `google zsh`, open a brower to search zsh in google
plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting web-search you-should-use)

source $ZSH/oh-my-zsh.sh

######## zsh-completions #########
# Basic auto/tab complete:
autoload -U compinit && compinit
# Include hidden files.
setopt globdots
_comp_options+=(globdots)

######## zsh-autosuggestions ##############
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
# ctrl+v then press ctrl+l to get  in terminal.
# Straightly inputting ^ and L is also right.
# ctrl+l expand the suggestion.
bindkey '' autosuggest-accept
# Ctrl+Enter to excute the suggested command,
# Ctrl+v then press Esc to generate "".
bindkey '[13;5u' autosuggest-execute
bindkey '' autosuggest-execute

# if not set the follow alias, aliases not available when using sudo
# I want to 'sudo cp' == "sudo cp -i", so this setting is necessary.
alias sudo='sudo -E '
# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"

alias vim='nvim'
# use vim for vimtex
# alias vim='vim --servername VIM'
alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias vz='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vr="vim ~/.config/README.md"
alias gs='git status'
alias gp='git pull'
alias gd='git difftool'
# clone repository by `author/repo_name` and enter.
# e.g: `gc Delayless/.config`
# --depth=1 just create a shallow clone
# `git fetch --unshallow` to convert to a complete repository.
alias gc='gitclone'
gitclone() {
    git clone --depth=1 https://github.com/$@
    if (( $? == 0 )); then
        repo=`echo $@ | cut -d '/' -f2`
        cd $repo
    fi
}

cman() {
	curl cheat.sh/$@
}

alias s="neofetch"
alias c="clear"
alias ssr="sudo python ~/Desktop/shadowsocksr/shadowsocks/local.py -c ~/Desktop/shadowsocksr/shadowsocks/config.json -d start"
alias ssrconfig="sudo python ~/Desktop/shadowsocksr/shadowsocks/local.py -d start -c"
alias ssrstop="cd ~/Desktop/shadowsocksr/shadowsocks/ && sudo python local.py -d stop && cd -"

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"
# alias getip="curl -i https://ip.cn"
alias getip="wget -qO - icanhazip.com | awk '{ print "WAN:" $1 }'"
# echo $(curl http://icanhazip.com) | xclip -selection clipboard
alias i3config="vim ~/.config/i3/config"
alias comptonconfig="vim ~/.config/compton.conf"
alias vimrc="vim ~/.config/.vimrc"
alias ra="ranger"
# alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
# Usage: "ag text ./search-path/"
alias ag='ag --hidden --ignore .git'
alias cat=ccat
alias lg=lazygit
alias caps="xdotool key Caps_Lock"
# alias gdb="gdb -tui"
# alias getip="getent hosts unix.stackexchange.com | awk '{ print $1 }'"
alias study="vim -M ~/Downloads/linux-c/docs/_sidebar.md"
alias truecolor="curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash"
alias jv="\vim -c 'Joplin'"
alias joplinsetprofile="sqlite3 "$XDG_CONFIG_HOME"/joplin/database.sqlite 'UPDATE version SET version = 41;'"

# tmux attach last detached sessions
alias t="tmux attach -d"
alias obs="DRI_PRIME=1 obs"

# source $HOME/.config/zsh-vim-mode.zsh
source $HOME/.config/zsh-emacs-mode.zsh
# source $HOME/.config/agnoster-modified.zsh-theme
source $HOME/.config/fzf.zsh
source $HOME/.config/broot/launcher/bash/br

# Enable Italics of vim-dues
# export TERM=screen-256color-bce
# export TERM=st-256color
export TERM_ITALICS=true
export RANGER_LOAD_DEFAULT_RC="false"
export PATH=$HOME/go/bin:$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

# Use ranger to switch directories and bind it to ctrl-o
# q swith directory and cancel ranger.
rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'rangercd\n'

# only in Bash-compatible shells
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map S chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

mkcd() {mkdir $@ && cd $@}

cdls() {cd "$@" && ls; }

# the followed command to test the speed of my shell startup time
# for i in $(seq 1 10); do time $SHELL -i -c exit; done
fuck() {
    unfunction "fuck"
    eval $(thefuck --alias)
    fuck "$@"
}

# vman() { vim <(man $1); }
vman() {
    VIMALIAS=$(alias vim)
    export MANPAGER="col -b" # for FreeBSD/MacOS

    # if $VIMALIAS is NULL.
    if [ -z "$VIMALIAS" ]; then
        # eval 'man $@ | vim -MR +"set filetype=man" -'
        eval 'man $@ | vim -R +"set filetype=man" -'
    else
        unalias vim
        # Make it read-only
        eval 'man $@ | vim -R +"set filetype=man" -'
        # eval 'man $@ | vim -MR +"set filetype=man" -'
        alias $VIMALIAS
    fi

    unset MANPAGER
}

post() {
	$* | curl -F "c=@-" "http://fars.ee/?u=1"
}

# https://github.com/ohmyzsh/ohmyzsh/issues/10597
# This is fixed in zsh-users/zsh@2c000ee, which hasn't been published yet.
autoload -Uz +X _bpf_filters
functions[_bpf_filters]="${functions[_bpf_filters]//:operator:\(not \(\)/:operator:(not \()}"
