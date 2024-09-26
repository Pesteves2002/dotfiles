{
  programs.yazi = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      manager = {
        ratio = [1 2 3];
      };

      preview = {
        wrap = "yes";
      };
    };
  };

  programs.zsh.initExtra = ''
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
}
