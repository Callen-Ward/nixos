{ config, ... }:

{
  programs.fzf = {
    enable = true;

    colors = config.theme.fzfColors;
  };
}
