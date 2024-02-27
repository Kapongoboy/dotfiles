# setup volta stuff
volta install node

# get bun
curl -fsSL https://bun.sh/install | bash

# install uv for python
curl -LsSf https://astral.sh/uv/install.sh | sh

# get clang and gcc and last release zig
sudo pacman -S --needed gcc clang bear zig
