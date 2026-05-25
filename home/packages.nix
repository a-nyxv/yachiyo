{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      curl
      vim
      tmux
      htop
      tree
      ripgrep
      btop
      gh

      nixfmt
      yt-dlp
      ffmpeg

      nerd-fonts.jetbrains-mono
    ];
  };
}
