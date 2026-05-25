{
  pkgs,
  inputs,
  self,
  systemSettings,
  userSettings,
  ...
}:
{
  imports = [
    ./homebrew.nix
    ./settings.nix
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  # nix config
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    enable = false;
  };

  nixpkgs.config.allowUnfree = true;

  nix-homebrew = {
    user = userSettings.userName;
    enable = true;
    autoMigrate = true;
  };

  # home-manager config
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${userSettings.userName} = {
      imports = [
        ../home
      ];
    };
    extraSpecialArgs = {
      inherit
        inputs
        self
        systemSettings
        userSettings
        ;
    };
  };

  # Shell
  programs.${userSettings.shell}.enable = true;

  # macOS-specific settings
  system.primaryUser = userSettings.userName;
  users.users.${userSettings.userName} = {
    home = "/Users/${userSettings.userName}";
    shell = pkgs.${userSettings.shell};
  };
  environment = {
    systemPath = [
      "/opt/homebrew/bin"
    ];
    pathsToLink = [ "/Applications" ];
  };
}
