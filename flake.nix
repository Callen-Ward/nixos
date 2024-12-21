{
  description = "my config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nur, ... }: {
    nixosConfigurations = {
      homepc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          nur.modules.nixos.default

          ./modules/nixos/configuration.nix
          ./modules/home/ca1/home.nix
          ./modules/machines/homepc.nix
        ];
      };
    };
  };
}
