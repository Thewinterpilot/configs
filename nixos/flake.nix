{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      editor = "vim";
      username = "winter";
      hostname = "FMS";
    in {
      nixosConfigurations = {
        ${hostname} = lib.nixosSystem {
          inherit system;
          modules = [
            ./hardware-configs/${hostname}-hw.nix
            ./modules/base.nix
            ./modules/laptoppkgs.nix
          ];
          specialArgs = {
            inherit inputs system;
            inherit username;
            inherit hostname;
            inherit pkgs-unstable;
          };
        };
      };
      homeConfigurations = {
        ${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit pkgs-unstable;
          modules = [ ./modules/home.nix ];
          extraSpecialArgs = {
            inherit inputs;
            inherit username;
            inherit hostname;
            inherit pkgs;
          };
        };
      };
    };
  
  
  }
