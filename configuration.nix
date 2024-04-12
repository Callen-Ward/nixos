{ lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>

    ./hardware-configuration.nix
    ./xorg-config.nix
    ./users/users.nix
  ] ++ lib.optional (builtins.pathExists ./local/configuration.nix)
    ./local/configuration.nix;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

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
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
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

