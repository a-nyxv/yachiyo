{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };
    global.brewfile = true;

    casks = [
      "ghostty"
      "zed"

      "telegram"
      "discord"
      "signal"

      "macpass"
      "iina"
      "qbittorrent"
      "obsidian"
      "zen"
    ];
    brews = [ ];
    taps = [ ];
  };
}
