{
  imports = [ ./home-manager/home-manager.nix ];

  users.users.ca1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  qt = {
    enable = true;
    style = "gtk2";
    platformTheme = "gtk2";
  };
}
