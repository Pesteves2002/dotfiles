{pkgs, ...}: {
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {block = "cpu";}
          {
            block = "memory";
            format = " $icon $mem_total_used_percents.eng(w:2) ";
            format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
          }
          {
            block = "sound";
            click = [{button = "left";}];
          }
          {
            block = "time";
            interval = 5;
            format = "%$timestamp.datetime(f:'%a %d/%m %R')";
          }
        ];
        theme = "space-villain";
        icons = "material-nf";
      };
    };
  };
}
