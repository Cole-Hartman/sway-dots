
# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


#  ▗▄▖ ▗▖   ▗▄▄▄▖ ▗▄▖  ▗▄▄▖
# ▐▌ ▐▌▐▌     █  ▐▌ ▐▌▐▌
# ▐▛▀▜▌▐▌     █  ▐▛▀▜▌ ▝▀▚▖
# ▐▌ ▐▌▐▙▄▄▖▗▄█▄▖▐▌ ▐▌▗▄▄▞▘

alias la='ls -A'
alias neob='cd ~/.config/nvim'
alias ng='cd ~/neorg/'
alias ..='cd ..'
alias b='cd'
alias c='clear'

alias fonts='cd ~/.local/share/fonts/'

alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tka='tmux kill-server'
alias tk='tmux kill-session -t'
alias td='tmuxinator todo'

alias matrix='unimatrix -s 92 -c white -a'
alias bonsai='cbonsai -l'
alias fzfs='~/scripts/fzf.sh'
alias tt='tt -theme nord'
alias pdf='zathura'

# ▗▖  ▗▖▗▄▄▄▖ ▗▄▄▖ ▗▄▄▖
# ▐▛▚▞▜▌  █  ▐▌   ▐▌
# ▐▌  ▐▌  █   ▝▀▚▖▐▌
# ▐▌  ▐▌▗▄█▄▖▗▄▄▞▘▝▚▄▄▖

# oh my posh
eval "$(oh-my-posh init bash --config ~/.customposhthemes/custom_posh.omp.json)"

# Set nvim as the default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Enable Vim mode in Bash
set -o vi

# Set a short timeout for key sequences
INPUTRC=~/.inputrc
echo "set keyseq-timeout 50" >> $INPUTRC

# Custom key bindings in Vim mode
bind -m vi-command '"\ew": kill-region'
bind -m vi-insert '"\C-p": history-search-backward'
bind -m vi-insert '"\C-n": history-search-forward'
bind -m vi-insert '"\ew": kill-region'

# fzf
bind '"\C-f":"fzfs\n"'

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
