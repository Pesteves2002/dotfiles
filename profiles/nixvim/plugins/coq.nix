{pkgs, ...}: {
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "coqtail";
      src = pkgs.fetchFromGitHub {
        owner = "whonore";
        repo = "Coqtail";
        rev = "main";
        hash = "sha256-lWk3RgIjUNH96ykrfGCyHoCE3ZeIHpEq7WbOUd8r9+0=";
      };
    })
  ];
}
