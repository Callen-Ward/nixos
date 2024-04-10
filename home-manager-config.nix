{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users.users.ca1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;

  # I couldn't get qt.style.name = "gtk2" to work in home manager
  qt.enable = true;
  qt.style = "gtk2";

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

    qt = {
      enable = true;
      platformTheme = "qtct";
    };

    home.stateVersion = "23.11";
  };
}
