# just updating quick
# sudo dnf update
#
# getting rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# getting volta for node
curl https://get.volta.sh | bash

# getting starship
curl -sS https://starship.rs/install.sh | sh

# some needed packages
# sudo $1 gitui fish git make cmake ninja python-pip ripgrep fzf fd

# copy fish to config
cp -r fish ~/.config/

# copy gitui config
cp -r gitui ~/.config/

# change fish to default
chsh -s /usr/bin/fish

# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ~/
tmux source-file .tmux.conf

# enter fish
fish
