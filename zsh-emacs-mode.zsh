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

# man zshzle to query optional
pb-kill-line () {
  zle kill-line   # `kill-line` is the default ctrl+k binding
  # echo -n $CUTBUFFER | xclip -sel clip # xclip -selection clipboard
  echo -n $CUTBUFFER | clipcopy # xclip -selection clipboard
}

pb-kill-whole-line () {
  zle kill-whole-line   # `kill-whole-line` is the default ctrl+u binding
  # echo -n $CUTBUFFER | xclip -sel clip # xclip -selection clipboard
  echo -n $CUTBUFFER | clipcopy # xclip -selection clipboard
}

zle -N pb-kill-line  # register our new function
zle -N pb-kill-whole-line

bindkey '' pb-kill-line  # change the ctrl+k binding to use our new function
bindkey '' pb-kill-whole-line

zle -N pb-kill-line  # register our new function

bindkey '' pb-kill-line  # change the ctrl+k binding to use our new function

precmd_functions+=(_fix_cursor)

autoload -z edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey "^X^E" edit-command-line

RPROMPT=''
