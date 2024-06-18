{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    clock24 = true;
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    shortcut = "a";
    newSession = true;
    historyLimit = 50000;
    keyMode = "vi";
    terminal = "tmux-256color";

    extraConfig = ''
      # Tell tmux the terminal supports RGB colors
      set -g terminal-overrides ",gnome*:RGB"
      set -sa terminal-overrides ',xterm-256color:RGB'
      set -sa terminal-overrides ',alacritty:RGB'

      # force reload of config file
      unbind r
      bind r source-file /etc/tmux.conf

      bind c new-window -c "#{pane_current_path}"

      # remap splitting commands to vi representation
      bind j split-window -v -c "#{pane_current_path}"
      bind k split-window -h -c "#{pane_current_path}"
      unbind '"'
      unbind '%'

      # switch panes using Alt-arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # switch panes using Alt-vim keys without prefix
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      # Enable mouse
      set -g mouse on
      set -g focus-event on

      # Enable osc-52
      set -g set-clipboard on

      # pane borders
      set -g pane-border-style 'fg=colour1'
      set -g pane-active-border-style 'fg=colour3'
    '';

    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
      better-mouse-mode
      catppuccin
      tmux-thumbs
    ];
  };
}
