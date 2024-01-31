# fzf, including configuration and keybind of fzf.
# Install by source, Ctrl+t, Ctrl+R, Alt+c.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up,?:toggle-preview --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'
export FZF_CTRL_R_OPTS="$FZF_CTRL_R_OPTS --preview-window=hidden"
export FZF_TMUX_HEIGHT='80%'
export FZF_COMPLETION_TRIGGER='\'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d --hidden --follow --exclude \".git\" ."

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


# bindkey "^[b"      backward-word
# bindkey "^[[1;3D]" backward-word
