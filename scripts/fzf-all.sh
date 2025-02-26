#!/bin/bash
search_directories() {
    selected_dir=$(
        find "$HOME" -type d -maxdepth 5 \
            -not -path "*/.git*" \
            -not -path "*/node_modules*" \
            -not -path "*/.cache*" \
            -not -path "*/.local/share*" \
            -not -path "*/.config*" 2>/dev/null | sort | fzf --layout=reverse --height 40%
    )
    
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        $SHELL
    fi
}

# Run the function
search_directories
