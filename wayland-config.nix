{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ags
    bun
    grimblast
    hyprlock
    hyprpaper
    hyprpicker
    sassc
    tofi
    wl-clipboard
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # make electron apps run natively instead of under Xwayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
