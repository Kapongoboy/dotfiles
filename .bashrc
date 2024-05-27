# .bashrc
nf() {
    local file=$(fzf)
    if [[ -n "$file" ]]; then
        nvim "$file"
    fi
}

xf() {
    local file=$(fzf)
    if [[ -n "$file" ]]; then
        xdg-open "$file"
    fi
}

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"

# Aliases 
alias re='cd ~/Repos'
alias q='exit'
alias pls='sudo dnf install'
alias op='xdg-open'
alias ls='lsd'
alias cat='bat'
alias zed='~/Repos/pocket/zed/target/release/Zed'
alias nvd='~/Downloads/neovide.AppImage'
alias pyvs='source ~/Repos/.venv/bin/activate'

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# zig and gleam
export PATH="$HOME/.zig:$PATH"
export PATH="$HOME/.gleam:$PATH"
