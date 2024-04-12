{ pkgs, ... }:

{
  imports = [ ./home-manager/home-manager.nix ];

  users.users.ca1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;

  # I couldn't get qt.style.name = "gtk2" to work in home manager
  qt.enable = true;
  qt.style = "gtk2";
}
