#!/bin/bash
export PATH="/usr/local/bin:/usr/bin:/home/$USER/.local/bin:$PATH"
export EDITOR="/usr/bin/nvim"  # or full path to your editor
export VISUAL="$EDITOR"

COMMANDS="cd $HOME/obsidian-vault/Remote/ && exec /usr/bin/yazi"  # Use full path to yazi
/usr/bin/kitty -e bash --login -c "$COMMANDS"
