{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [file highlight python311Packages.pdftotext];

  programs.lf = {
    enable = true;
    settings = {icons = true;};
    previewer = {
      keybinding = "i";
      source = pkgs.writeShellScript "previewer.sh" ''
        #! /usr/bin/env sh

        case "$1" in
          *.tar*) tar tf "$1";;
          *.zip) unzip -l "$1";;
          *.rar) unrar l "$1";;
          *.7z) 7z l "$1";;
          *.pdf) pdftotext "$1" -;;
          *) highlight -O ansi "$1";;
        esac
      '';
    };
  };

  # LFCD is a wrapper around LF that sets the CWD to the
  # current directory in LF on exit
  programs.zsh.shellAliases.lf = "lfcd";

  programs.zsh.initExtra = ''
    lfcd() {
          tmp="$(mktemp)"
          command lf -last-dir-path="$tmp" "$@"
          if [ -f "$tmp" ]; then
            dir="$(command cat "$tmp")"
            rm -f "$tmp"
            if [ -d "$dir" ]; then
              if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
              fi
            fi
          fi
        }

    bindkey -s '^o' 'lfcd\n'
  '';

  home.file.".config/lf/icons".text = ''
    tw 
    st 
    ow 
    dt 
    di 
    fi 
    ln 
    or 
    ex 
    *.c 
    *.cc 
    *.clj 
    *.coffee 
    *.cpp 
    *.css 
    *.d 
    *.dart 
    *.erl 
    *.exs 
    *.fs 
    *.go 
    *.h 
    *.hh 
    *.hpp 
    *.hs 
    *.html 
    *.java 
    *.jl 
    *.js 
    *.json 
    *.lua 
    *.md 
    *.php 
    *.pl 
    *.pro 
    *.py 
    *.rb 
    *.rs 
    *.scala 
    *.ts 
    *.vim 
    *.cmd 
    *.ps1 
    *.sh 
    *.bash 
    *.zsh 
    *.fish 
    *.tar 
    *.tgz 
    *.arc 
    *.arj 
    *.taz 
    *.lha 
    *.lz4 
    *.lzh 
    *.lzma 
    *.tlz 
    *.txz 
    *.tzo 
    *.t7z 
    *.zip 
    *.z 
    *.dz 
    *.gz 
    *.lrz 
    *.lz 
    *.lzo 
    *.xz 
    *.zst 
    *.tzst 
    *.bz2 
    *.bz 
    *.tbz 
    *.tbz2 
    *.tz 
    *.deb 
    *.rpm 
    *.jar 
    *.war 
    *.ear 
    *.sar 
    *.rar 
    *.alz 
    *.ace 
    *.zoo 
    *.cpio 
    *.7z 
    *.rz 
    *.cab 
    *.wim 
    *.swm 
    *.dwm 
    *.esd 
    *.jpg 
    *.jpeg 
    *.mjpg 
    *.mjpeg 
    *.gif 
    *.bmp 
    *.pbm 
    *.pgm 
    *.ppm 
    *.tga 
    *.xbm 
    *.xpm 
    *.tif 
    *.tiff 
    *.png 
    *.svg 
    *.svgz 
    *.mng 
    *.pcx 
    *.mov 
    *.mpg 
    *.mpeg 
    *.m2v 
    *.mkv 
    *.webm 
    *.ogm 
    *.mp4 
    *.m4v 
    *.mp4v 
    *.vob 
    *.qt 
    *.nuv 
    *.wmv 
    *.asf 
    *.rm 
    *.rmvb 
    *.flc 
    *.avi 
    *.fli 
    *.flv 
    *.gl 
    *.dl 
    *.xcf 
    *.xwd 
    *.yuv 
    *.cgm 
    *.emf 
    *.ogv 
    *.ogx 
    *.aac 
    *.au 
    *.flac 
    *.m4a 
    *.mid 
    *.midi 
    *.mka 
    *.mp3 
    *.mpc 
    *.ogg 
    *.ra 
    *.wav 
    *.oga 
    *.opus 
    *.spx 
    *.xspf 
    *.pdf 
    *.nix 
  '';
}
