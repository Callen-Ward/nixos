{
  home-manager.users.ca1 = { pkgs, config, ... }: {
    imports = [ ./gtk.nix ./librewolf.nix ./qt.nix ];

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
