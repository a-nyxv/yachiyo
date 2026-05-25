{ userSettings, ... }:
{
  imports = [
    ./packages.nix
    ./git.nix
    ./shell.nix
    ./helix.nix
  ];

  home = {
    username = userSettings.userName;
    stateVersion = "26.05";
    sessionVariables = {
      # shared environment variables
    };

    # create .hushlogin file to suppress login messages
    file.".hushlogin".text = "";
  };
}
