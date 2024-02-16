if status is-interactive
    function nf
        set file (fzf)
        if test -n "$file"
            nvim "$file"
        end
    end

    # User specific environment
    if not contains -- "$HOME/.local/bin" $PATH
        set PATH $HOME/.local/bin $HOME/bin $PATH
    end

    # Commands to run in interactive sessions can go here
    abbr -a re cd ~/Repos
    abbr -a q exit
    abbr -a pls sudo pacman -S --needed
    # abbr -a pvs source ~/Documents/repos/pocket/yolov7/venv/bin/activate.fish
    fish_vi_key_bindings

    # environment variables
    set -Ux VOLTA_HOME $HOME/.volta
    set -x PATH $VOLTA_HOME/bin $PATH
    set -x PATH $HOME/.zig $PATH
    set PATH $HOME/.cargo/bin $PATH

    starship init fish | source

end
