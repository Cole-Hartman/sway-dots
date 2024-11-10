#!/bin/bash
search_directories() {
    directories=(~/code ~/class ~/dotfiles ~/Downloads ~/Desktop)
    
    selected_dir=$(
        (
            echo "$HOME"
            find "${directories[@]}" -type d -maxdepth 3 \
                -not -path "*/.git*" \
                -not -path "*/node_modules*" 2>/dev/null
        ) | sort -u | fzf --layout=reverse --height 40%
    )
    
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        $SHELL
    fi
}
# Run the function
search_directories
