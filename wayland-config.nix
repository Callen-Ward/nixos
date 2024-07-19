{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dunst
    eww
    grimblast
    hyprlock
    hyprpaper
    hyprpicker
    tofi
    wl-clipboard

    # required by eww config
    (lua.withPackages (ps: with ps; [ luaposix ]))
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # make electron apps run natively instead of under Xwayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
