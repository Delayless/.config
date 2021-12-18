set -o emacs
KEYTIMEOUT=1

_fix_cursor() {
	# set terminal cursor
	# echo -ne "\x1b[\x32 q" # changes to steady block
	# echo -ne "\x1b[\x34 q" # changes to steady underline
	echo -ne "\x1b[\x36 q" # changes to steady bar(vertical bar)
	# echo -ne '\e[5 q'
	# printf '\033[6 q'
}

precmd_functions+=(_fix_cursor)

autoload -z edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey "^X^E" edit-command-line

RPROMPT=''
