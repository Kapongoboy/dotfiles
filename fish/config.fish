function nf
    set file (fzf)
    if test -n "$file"
        nvim "$file"
    end
end

function xf
  set file (fzf)
  if test -n "$file"
    xdg-open "$file"
  end
end

# User specific environment
if not contains -- "$HOME/.local/bin" $PATH
    set PATH $HOME/.local/bin $HOME/bin $PATH
end

# Commands to run in interactive sessions can go here
abbr -a re cd ~/Repos
abbr -a q exit
abbr -a pls sudo dnf install
abbr -a op xdg-open
abbr -a ls lsd
abbr -a cat bat
abbr -a zed ~/Repos/pocket/zed/target/release/zed
abbr -a nvd ~/Downloads/neovide.AppImage
abbr -a scsht $HOME/.config/hypr/scripts/screensht
abbr -a pyvs source ~/Repos/.venv/bin/activate.fish
fish_vi_key_bindings

# environment variables
set -Ux VOLTA_HOME $HOME/.volta
set -x PATH $VOLTA_HOME/bin $PATH
set -x PATH $HOME/.zig $PATH
set -x PATH $HOME/.gleam $PATH
set -x PATH $HOME/.cache/rebar3/bin $PATH
set -x PATH $HOME/go/bin $PATH
set PATH /usr/local/go/bin $PATH
set PATH $HOME/.cargo/bin $PATH

starship init fish | source


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# opam configuration
source /home/plamedi/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/plamedi/.local/share/coursier/bin"
# <<< coursier install directory <<<

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/plamedi/.ghcup/bin $PATH # ghcup-env