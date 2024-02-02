# profiles/home/tmux.nix
#
# Author: Tomás Esteves <tomasesteves2002@gmail.com> 
# URL:    https://github.com/Pesteves2002/dotfiles
#
# tmux configuration

{ config, lib, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    shortcut = "a";
    newSession = true;
    extraConfig = ''
      # Tell tmux the terminal supports RGB colors
      set -g terminal-overrides ",gnome*:RGB"
      set -sa terminal-overrides ',xterm-256color:RGB'
      set -sa terminal-overrides ',alacritty:RGB'

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

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style 'fg=colour1'
      set -g status-right '%Y-%m-%d %H:%M'
      set -g status-right-length 50
      set -g status-left-length 10

      setw -g window-status-current-style 'fg=colour0 bg=colour1 bold'
      setw -g window-status-current-format ' #I #W #F '

      setw -g window-status-style 'fg=colour1 dim'
      setw -g window-status-format ' #I #[fg=colour7]#W #[fg=colour1]#F '

      setw -g window-status-bell-style 'fg=colour2 bg=colour1 bold'
    '';
    historyLimit = 50000;
    keyMode = "vi";
    terminal = "tmux-256color";
  };
}
