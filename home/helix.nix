{ config, pkgs, lib, userSettings, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "ctp_mocha_tp";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = lib.getExe pkgs.nixfmt;
    }];
    themes = {
      ctp_mocha_tp = {
        "inherits" = "catppuccin_mocha";
        "ui.background" = { };
      };
    };
  };
}
