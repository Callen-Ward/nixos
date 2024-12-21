{ config, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = config.theme.cursor.name;
    size = 24;
    package = config.theme.cursor.pkg;
  };
}
