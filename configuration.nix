{ lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware-configuration.nix
    ./gui-config.nix
    ./users/users.nix
  ] ++ lib.optional (builtins.pathExists ./local/configuration.nix)
    ./local/configuration.nix;

  nixpkgs.config.allowUnfree = true;
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

    kitty
    mpv
    networkmanagerapplet
    pcmanfm

    cmatrix
    pfetch

    gtk-engine-murrine
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    inter
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "Noto Monospace" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  networking = {
    hostName = "nix";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" ];
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  time.timeZone = "Europe/London";

  programs.nix-ld.enable = true;

  system.stateVersion = "23.11";
}

