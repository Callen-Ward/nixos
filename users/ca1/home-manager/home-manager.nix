{
  home-manager.users.ca1 = { config, pkgs, ... }: {
    imports = [
      ./theme.nix
      ./themes/tokyonight.nix

      ./modules/gtk.nix
      ./modules/librewolf.nix
      ./modules/cursor.nix
      ./modules/fzf.nix
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
