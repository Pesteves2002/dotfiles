{pkgs, ...}: {
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      text = ["write_good"];
      markdown = ["write_good"];
      nix = ["nix"];
    };
    linters = {
      write_good = {
        cmd = "${pkgs.write-good}/bin/write-good";
      };
    };

    # Trigger linting more aggressively, not only after writing a buffer
    autoCmd.event = ["BufWritePost" "BufEnter" "BufLeave"];
  };
}
