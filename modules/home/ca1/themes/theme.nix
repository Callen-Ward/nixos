{ lib, ... }:

{
  options.theme = lib.mkOption {
    type = with lib.types;
      submodule {
        options = {
          colors = lib.mkOption { type = attrsOf str; };

          gtkTheme = lib.mkOption {
            type = submodule {
              options = {
                name = lib.mkOption { type = str; };
                pkg = lib.mkOption { type = package; };
                iconThemeName = lib.mkOption { type = str; };
              };
            };
          };

          cursor = lib.mkOption {
            type = submodule {
              options = {
                name = lib.mkOption { type = str; };
                pkg = lib.mkOption { type = package; };
              };
            };
          };

          librewolfTheme = lib.mkOption { type = package; };

          fzfColors = lib.mkOption { type = attrsOf str; };
        };
      };
  };
}
