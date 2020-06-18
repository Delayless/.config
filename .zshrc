# # Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
export EDITOR=vim
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload -i zsh/complist
setopt globdots
compinit
_comp_options+=(globdots)		# Include hidden files.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lenovo/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# if not set the follow alias, aliases not available when using sudo
# I want to 'sudo cp' == "sudo cp -i", so this setting is necessary.
alias sudo='sudo -E '
# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"

alias eb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias gs='git status'
alias gp='git pull'
alias gd='git difftool'

alias s="neofetch"
alias ssr="sudo python ~/Desktop/shadowsocksr/shadowsocks/local.py -c ~/Desktop/shadowsocksr/shadowsocks/config.json -d start"
alias ssrconfig="sudo python ~/Desktop/shadowsocksr/shadowsocks/local.py -d start -c"
alias ssrstop="cd ~/Desktop/shadowsocksr/shadowsocks/ && sudo python local.py -d stop && cd -"

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"
alias getip="curl -i https://ip.cn"
alias i3config="vim ~/.config/i3/config"
alias comptonconfig="vim ~/.config/compton.conf"
alias vimrc="vim ~/.vimrc"
alias ra="ranger"
alias ag='ag --hidden --ignore .git'
alias cat=ccat
alias lg=lazygit
# alias gdb="gdb -tui"
# alias getip="getent hosts unix.stackexchange.com | awk '{ print $1 }'"

source ~/.config/zsh-vim-mode.zsh
source ~/.config/agnoster-modified.zsh-theme
source ~/.config/fzf.zsh

# Enable Italics of vim-dues
export TERM_ITALICS=true

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

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
