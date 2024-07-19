{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dmenu
    flameshot
    picom
    xclip
  ];

  services.xserver = {
    enable = true;

    displayManager.startx.enable = true;
    windowManager.awesome.enable = true;
  };
}

