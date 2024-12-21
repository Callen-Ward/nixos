{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  home-manager.users.ca1 = {
    imports = [
      ./themes/tokyonight.nix

      ./modules/cursor.nix
      ./modules/fzf.nix
      ./modules/gtk.nix
      ./modules/librewolf.nix
    ];

    home.stateVersion = "23.11";
  };
}
