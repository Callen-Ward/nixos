{ pkgs, ... }:

{
  imports = [
    ./xorg-config.nix
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = builtins.concatStringsSep " " [
          "${pkgs.greetd.tuigreet}/bin/tuigreet"
          "--cmd startx"
          "--time"
          "--time-format '%a %d/%m %H:%M'"
          "--remember"
          "--asterisks"
          "--window-padding 1"
        ];
      };
    };
  };

  services.libinput = {
    enable = true;

    mouse = {
      accelProfile = "flat";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}

