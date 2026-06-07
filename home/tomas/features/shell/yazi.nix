{pkgs, ...}: {
  programs.yazi = {
    enable = true;

    enableZshIntegration = true;

    shellWrapperName = "y";

    settings = {
      mgr = {
        ratio = [1 2 3];
        # show_hidden = true;
        show_symlink = true;
      };

      preview = {
        wrap = "yes";
      };
    };
  };

  programs.zsh.initContent = ''
    function y() {
    	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    	yazi "$@" --cwd-file="$tmp"
    	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    		builtin cd -- "$cwd"
    	fi
    	rm -f -- "$tmp"
    }

    bindkey -s '^o' 'y\n'
  '';

  home.packages = with pkgs; [
    ffmpegthumbnailer
    imagemagick
    poppler
  ];
}
