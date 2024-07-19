{ lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware-configuration.nix
    ./xorg-config.nix
    ./users/users.nix
  ] ++ lib.optional (builtins.pathExists ./local/configuration.nix)
    ./local/configuration.nix;

  networking.hostName = "nix";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" ];

  time.timeZone = "Europe/London";

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
    xclip

    dmenu
    flameshot
    kitty
    mpv
    networkmanagerapplet
    pcmanfm
    picom

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

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  system.stateVersion = "23.11";
}

