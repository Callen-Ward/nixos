{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd startx ${
            pkgs.writeText ".xinitrc" "exec awesome"
          }";
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

