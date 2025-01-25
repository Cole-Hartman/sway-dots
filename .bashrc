
# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

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
alias ob='cd ~/obsidian-vault'
alias ..='cd ..'
alias b='cd'
alias c='clear'
alias f='fastfetch'

alias fonts='cd ~/.local/share/fonts/'

alias koff='swaymsg input "1:1:AT_Translated_Set_2_keyboard" events disabled'
alias kon='swaymsg input "1:1:AT_Translated_Set_2_keyboard" events enabled'

alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tka='tmux kill-server'
alias tk='tmux kill-session -t'
alias td='tmuxinator todo-school'

alias m='unimatrix -s 92 -c white -a'
alias bonsai='cbonsai -l'
alias fzfs='~/scripts/fzf.sh'
alias tt='tt -theme nord'
alias pdf='zathura'
alias timeshift='sudogui timeshift-gtk'

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

# Set primary clipboard program
export CLIPBOARD='wl-copy'

# fzf
bind '"\C-f":"fzfs\n"'

# nvm
source /usr/share/nvm/init-nvm.sh

# yazi script
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

[ -f "/home/akira/.ghcup/env" ] && . "/home/akira/.ghcup/env" # ghcup-env