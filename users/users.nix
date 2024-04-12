{ pkgs, ... }: {
  imports = [ ./ca1/user.nix ];

  programs.dconf.enable = true;
  programs.neovim.defaultEditor = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
