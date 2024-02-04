# profiles/shell/alacritty.nix
#
# Author: Tomás Esteves <tomasesteves2002@gmail.com>
# URL:    https://github.com/Pesteves2002/dotfiles
#
# alacritty configuration

{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      scrolling.history = 100000;

      selection.save_to_clipboard = true;

      cursor = {
        style = { shape = "Block"; };

        vi_mode_style = {
          shape = "Beam";
          blinking = "On";
        };

        blink_interval = 500;

        thickness = 0.2;
      };

      mouse.hide_when_typing = true;

      # FIX ME: Change to comment after TOML update
      # keyboard.bindings = [ ...
      key_bindings = [{
        key = "Return";
        mods = "Control|Shift";
        action = "SpawnNewInstance";
      }];
    };
  };
}
