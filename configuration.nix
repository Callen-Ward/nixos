{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./xorg-config.nix
    ./home-manager-config.nix
  ];

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

    gcc
    nodejs
    rustup

    dmenu
    flameshot
    kitty
    librewolf
    mpv
    networkmanagerapplet    
    pcmanfm
    picom

    cmatrix
    pfetch
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  programs.dconf.enable = true;
  programs.zsh.enable = true;

  programs.neovim.defaultEditor = true;

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

