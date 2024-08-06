{pkgs, ...}: {
  home.packages = with pkgs; [
    playerctl # play/pause media players

    cliphist # clipboard history

    waypipe # wayland remote desktop

    firefox

    vesktop # discord client

    grim
    slurp
    swappy
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
  ];
}
