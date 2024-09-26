{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    atool
    zip
    unzip

    tmux

    htop-vim

    man-pages
    tldr

    neofetch

    fzf
    ripgrep
    fd

    curl
    wget

    neovim

    bat
  ];
}
