#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -u)" -eq 0 ]]; then
  echo "Please run this script as your normal user (it will call sudo when needed)."
  exit 1
fi

detect_package_manager() {
  if command -v pacman >/dev/null 2>&1; then
    echo "pacman"
  elif command -v dnf >/dev/null 2>&1; then
    echo "dnf"
  elif command -v apt-get >/dev/null 2>&1; then
    echo "apt"
  else
    echo ""
  fi
}

update_system() {
  local pm="$1"
  case "$pm" in
    pacman)
      sudo pacman -Syu --noconfirm
      ;;
    dnf)
      sudo dnf upgrade -y
      ;;
    apt)
      sudo apt-get update
      sudo apt-get upgrade -y
      ;;
  esac
}

install_packages() {
  local pm="$1"
  local -a packages=()

  case "$pm" in
    pacman)
      packages=(
        gitui fish git make cmake ninja python-pip ripgrep fzf fd lsd bat tmux gcc clang bear zoxide
      )
      sudo pacman -S --needed --noconfirm "${packages[@]}"
      ;;
    dnf)
      packages=(
        gitui fish git make cmake ninja-build python3-pip ripgrep fzf fd-find lsd bat tmux gcc clang bear zoxide
      )
      sudo dnf install -y "${packages[@]}"
      ;;
    apt)
      packages=(
        git fish make cmake ninja-build python3-pip ripgrep fzf fd-find tmux gcc clang
      )
      sudo apt-get install -y "${packages[@]}"
      ;;
  esac
}

main() {
  local pm
  pm="$(detect_package_manager)"

  if [[ -z "$pm" ]]; then
    echo "No supported package manager detected (supported: pacman, dnf, apt)."
    exit 1
  fi

  echo "Detected package manager: $pm"
  update_system "$pm"
  install_packages "$pm"

  # getting rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  # getting volta for node
  curl -sSf https://get.volta.sh | bash

  # getting starship
  curl -sS https://starship.rs/install.sh | sh

  # copy fish to config
  cp -r fish ~/.config/

  # copy gitui config
  cp -r gitui ~/.config/

  # change fish to default
  local fish_path
  fish_path="$(command -v fish || true)"
  if [[ -n "$fish_path" ]]; then
    chsh -s "$fish_path"
  else
    echo "fish binary not found after install; skipping shell change."
  fi

  # setup tmux
  if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  cp .tmux.conf ~/
  tmux source-file .tmux.conf || true

  # enter fish
  fish
}

main "$@"
