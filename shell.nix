let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  buildInputs = with pkgs; [
    zsh
    locale
    git
    cmake
    neovim
    starship
    zig
    ninja
    fd
    lsd
    bat
    zoxide
    ripgrep
    fzf
    tmux
    python313
    cowsay
    lolcat
  ];

  GREETING = "Ball up top";

  shellHook = ''
    echo $GREETING | cowsay | lolcat
  '';
}
