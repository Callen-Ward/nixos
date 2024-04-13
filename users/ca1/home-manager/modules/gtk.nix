{ config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = config.theme.gtkTheme.name;
      package = config.theme.gtkTheme.pkg;
    };
    iconTheme = { name = config.theme.gtkTheme.iconThemeName; };
  };
}
