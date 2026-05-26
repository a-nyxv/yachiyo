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
      "vesktop"

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
