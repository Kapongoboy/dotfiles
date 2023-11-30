if status is-interactive

    # User specific environment
    if not contains -- "$HOME/.local/bin" $PATH
        set PATH $HOME/.local/bin $HOME/bin $PATH
    end

    # Commands to run in interactive sessions can go here
    abbr -a re cd ~/Documents/repos
    abbr -a q exit
    fish_vi_key_bindings

    # environment variables
    set -Ux VOLTA_HOME $HOME/.volta
    set -x PATH $VOLTA_HOME/bin $PATH

    starship init fish | source

    set PATH $HOME/.cargo/bin $PATH

end
