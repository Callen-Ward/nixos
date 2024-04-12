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

  home-manager.users.ca1 = { pkgs, config, ... }: {
    gtk = {
      enable = true;
      theme = {
        name = "Tokyonight-Dark-BL";
        package = pkgs.tokyo-night-gtk;
      };
      iconTheme = { name = "Tokyonight-Dark"; };
    };

    qt = {
      enable = true;
      platformTheme = "qtct";
    };

    nixpkgs.config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball
          "https://github.com/nix-community/NUR/archive/master.tar.gz") {
            inherit pkgs;
          };
      };
    };

    home.file."./.librewolf".source =
      config.lib.file.mkOutOfStoreSymlink /home/ca1/.mozilla/firefox;
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
      profiles = {
        ca1 = {
          isDefault = true;

          # librewolf doesnt automatically import bookmarks from browser.bookmarks.file
          # which is set by programs.firefox
          bookmarks = [{
            name = "toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "";
                url = "https://youtube.com/";
              }
              {
                name = "";
                url = "https://twitch.tv/";
              }
              {
                name = "";
                url = "https://tumblr.com/dashboard/";
              }
              {
                name = "";
                url = "https://github.com/";
              }
              {
                name = "";
                url = "https://monkeytype.com/";
              }
              {
                name = "";
                url = "https://orteil.dashnet.org/cookieclicker/";
              }
              {
                name = "";
                url = "https://wikipedia.org/";
              }
              {
                name = "";
                url = "https://developer.mozilla.org/";
              }
            ];
          }];

          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            darkreader
            tampermonkey
            tokyo-night-v2
          ];

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
            "privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts" =
              false;
            "webgl.disabled" = false;

            ## other about:config
            # disable user agent being set to windows 10
            "general.useragent.compatMode.firefox" = true;

            "browser.uiCustomization.state" = ''
              {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":[],"nav-bar":["back-button","forward-button","stop-reload-button","history-panelmenu","panic-button","urlbar-container","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","firefox_tampermonkey_net-browser-action","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","firefox_tampermonkey_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","unified-extensions-area","toolbar-menubar","TabsToolbar"],"currentVersion":20,"newElementCount":7}'';
          };
        };

        p = {
          id = 1;

          settings = {
            "privacy.resistFingerprinting.letterboxing" = true;

            "extensions.activeThemeID" = "firefox-alpenglow@mozilla.org";
            "browser.toolbars.bookmarks.visibility" = "never";
          };
        };
      };
    };

    home.stateVersion = "23.11";
  };
}
