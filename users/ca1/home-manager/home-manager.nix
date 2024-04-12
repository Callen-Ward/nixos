{
  home-manager.users.ca1 = { pkgs, config, ... }: {
    imports = [
      ./modules/gtk.nix
      ./modules/librewolf.nix
      ./modules/qt.nix
      ./modules/cursor.nix
    ];

    nixpkgs.config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball
          "https://github.com/nix-community/NUR/archive/master.tar.gz") {
            inherit pkgs;
          };
      };
    };

    home.stateVersion = "23.11";
  };
}
