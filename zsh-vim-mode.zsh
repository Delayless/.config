bindkey -v
DEFAULT_VI_MODE=viins
KEYTIMEOUT=1

#######################################
###### keymap in the normal mode ######
#######################################
bindkey '^p' up-history
bindkey '^n' down-history
bindkey '^f' forward-char
bindkey '^b' backward-char
bindkey '^d' delete-char
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
# if not use fzf, uncomment the following command.
# bindkey '^r' history-incremental-search-backward

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
# Delete key
bindkey '\e[3~' delete-char

#######################################
###### keymap in the normal mode ######
#######################################
bindkey -M vicmd '\e[3~' delete-char
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line
# use '/' to search command history, and '=' to repeat. But fzf is more convenient.
bindkey -M vicmd '=' vi-repeat-search
# if not use fzf, uncomment the following command.
# bindkey -M vicmd '^r' history-incremental-search-backward

# Allows you to open the in-progress command inside of $EDITOR
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line
zle -N edit-command-line

# Prefer vi shortcuts
__set_cursor() {
    local style
    case $1 in
        reset) style=0;; # The terminal emulator's default
        blink-block) style=1;;
        block) style=2;;
        blink-underline) style=3;;
        underline) style=4;;
        blink-vertical-line) style=5;;
        vertical-line) style=6;;
    esac

    [ $style -ge 0 ] && print -n -- "\e[${style} q"
}

# Set your desired cursors here...
__set_vi_mode_cursor() {
    case $KEYMAP in
        vicmd)
          __set_cursor block
          ;;
        main|viins)
          __set_cursor vertical-line
          ;;
    esac
}

# red    black    yellow   green
# cyan   white    magenta  blue
__get_vi_mode() {
    local mode
    case $KEYMAP in
        vicmd)
          mode='%B%F{red}NORMAL'
          ;;
        main|viins)
          mode=
          ;;
    esac
    print -n -- $mode
}

zle-line-init() {
    zle -K $DEFAULT_VI_MODE
}

zle-keymap-select() {
    __set_vi_mode_cursor
    zle reset-prompt
}

zle-line-finish() {
    # Let applications manage their own cursor
    __set_cursor reset
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

# PROMPT_SUBST enables functions and variables to re-run everytime the prompt is rendered
# perform parameter expansion/command substitution in prompt
# setopt PROMPT_SUBST

# Single quotes are important so that function is not run immediately and saved in the variable
RPROMPT='$(__get_vi_mode)'

