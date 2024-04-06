{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nix";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  users.users.ca1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    fzf
    git
    htop
    neovim
    p7zip
    ripgrep
    tldr
    yadm
    zsh

    rustup
    libgcc
    nodejs_20
  ];

  programs.zsh.enable = true;

  programs.neovim.defaultEditor = true;

  system.stateVersion = "23.11";
}

