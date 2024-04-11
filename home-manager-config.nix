{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users.users.ca1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.defaultUserShell = pkgs.zsh;

  # I couldn't get qt.style.name = "gtk2" to work in home manager
  qt.enable = true;
  qt.style = "gtk2";

  home-manager.users.ca1 = { pkgs, ... }: {
    gtk = {
      enable = true;
      theme = {
        name = "Tokyonight-Dark-BL";
        package = pkgs.tokyo-night-gtk;
      };
      iconTheme = {
        name = "Tokyonight-Dark";
      };
    };

    qt = {
      enable = true;
      platformTheme = "qtct";
    };

    programs.librewolf = {
      enable = true;
      settings = {
        ## General
        # dark mode
        "layout.css.prefers-color-scheme.content-override" = 0;

        # Play DRM-controlled content
        "media.eme.enabled" = true;

        # Use autoscrolling
        "general.autoScroll" = true;

        ## Home
        # When using the address bar, suggest
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.bookmark" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.engines" = false;

        ## Privacy and Security
        # Delete cookies and site data when LibreWolf is closed
        "privacy.clearOnShutdown.cache" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.offlineApps" = false;

        ## LibreWolf
        "middlemouse.paste" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.resistFingerprinting.letterboxing" = false;
        "privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts" = false;
        "webgl.disabled" = false;

        ## other about:config
        # disable user agent being set to windows 10
        "general.useragent.compatMode.firefox" = true;
      };
    };

    home.stateVersion = "23.11";
  };
}
