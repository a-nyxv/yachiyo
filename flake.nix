{
  description = "nyx's nix-darwin config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };
  outputs =
    {
      self,
      darwin,
      nixpkgs,
      home-manager,
      nix-homebrew,
      ...
    }@inputs:
    let
      systemSettings = {
        system = "x86_64-darwin";
        hostName = "yachiyo";
      };
      userSettings = rec {
        userName = "nyx";
        shell = "fish";
        editor = "hx";
        git = {
          fullName = "Aubrey Nyx";
          email = "nyxnyx@disroot.org";
        };
      };
    in
    {
      darwinConfigurations.${systemSettings.hostName} = darwin.lib.darwinSystem {
        system = systemSettings.system;
        modules = [
          ./darwin
          ./hosts/${systemSettings.hostName}/configuration.nix
        ];
        specialArgs = {
          inherit
            inputs
            self
            systemSettings
            userSettings
            ;
        };
      };
    };
}
