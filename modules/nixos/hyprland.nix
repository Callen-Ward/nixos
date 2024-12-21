{ pkgs, ... }:

{
  imports = [
    ./gui.nix
  ];

  environment.systemPackages = with pkgs;
    [
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

  nixpkgs.overlays = [
    (final: prev:
      {
        ags = prev.ags.overrideAttrs (old: {
          buildInputs = old.buildInputs ++ [ pkgs.libdbusmenu-gtk3 ];
        });
      })
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
