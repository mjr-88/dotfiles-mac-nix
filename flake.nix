{
  description = "Minimal macOS Nix setup with nix-darwin + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nix-darwin, home-manager, ... }:
    let
      username = "mjr";
      homeDirectory = "/Users/${username}";
    in
    {
      darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit username homeDirectory;
        };
        modules = [
          ./nix/host.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit username homeDirectory;
            };
            home-manager.users = {
              ${username} = import ./nix/user.nix;
            };
          }
        ];
      };
    };
}
