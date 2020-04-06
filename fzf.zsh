# fzf, including configuration and keybind of fzf.
# Install by source, Ctrl+t, Ctrl+R, Alt+c.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'
export FZF_TMUX_HEIGHT='80%'
export FZF_COMPLETION_TRIGGER='\'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

#######################################
############ keybind of fzf ############
#######################################
# configuration file: "~/.fzf/shell/key-bindings.zsh"
# Ctrl+t, Ctrl+R, Alt+c.
bindkey '^R' fzf-history-widget
bindkey '^T' fzf-file-widget
bindkey '\ec' fzf-cd-widget
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M vicmd '^T' fzf-file-widget
bindkey -M vicmd '\ec' fzf-cd-widget


