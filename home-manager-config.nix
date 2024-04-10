{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users.users.ca1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;

  home-manager.users.ca1 = { pkgs, ... }: {
    home.stateVersion = "23.11";
  };
}
