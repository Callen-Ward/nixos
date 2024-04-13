{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = builtins.concatStringsSep " " [
          "${pkgs.greetd.tuigreet}/bin/tuigreet"
          "--cmd startx ${pkgs.writeText ".xinitrc" "exec awesome"}"
          "--time"
          "--time-format '%a %d/%m %H:%M'"
          "--remember"
          "--asterisks"
          "--window-padding 1"
        ];
      };
    };
  };

  services.xserver = {
    enable = true;

    displayManager.startx.enable = true;
    windowManager.awesome.enable = true;
  };

  hardware.opengl.driSupport32Bit = true;
}

