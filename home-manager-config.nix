{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users.users.ca1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;

  home-manager.users.ca1 = { pkgs, ... }: {
    gtk = {
      enable = true;
      theme = {
        name = "Tokyonight-Dark-BL";
        package = pkgs.tokyo-night-gtk;
      };
      iconTheme = {
        name = "Tokyonight-Dark";
      };
    };

    home.stateVersion = "23.11";
  };
}
