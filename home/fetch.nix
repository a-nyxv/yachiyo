{ pkgs, userSettings, ... }:
{
  programs = {
    fastfetch = {
      enable = true;
      settings = {
        modules = [
          "title"
          "seperator"
          "os"
          "shell"
          "packages"
          "colors"
        ];
      };
    };
    hyfetch = {
      enable = true;
      settings = {
        preset = "transgender";
        mode = "rgb";
        light_dark = "dark";
        lightness = 0.68;
        backend = "fastfetch";
      };
    };
  };
}
