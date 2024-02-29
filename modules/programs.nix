{pkgs, ...}: {
  # Essential packages
  environment.systemPackages = with pkgs; [
    # Compressed archives
    atool
    zip
    unzip

    # Terminal multiplexers
    tmux

    # System monitor
    htop-vim
    procps
    gdu
    duf

    # Neofetch
    neofetch

    # Man pages
    man-pages

    # Find and search files
    fzf
    ripgrep
    fd

    # perl-rename (much better than the one from util-linux)
    rename

    # Other utilities
    wget
  ];
}
