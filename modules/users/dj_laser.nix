{den, ...}: let
  username = "dj_laser";
  homeDirectory = "/home/${username}";
in {
  den.homes.x86_64-linux.dj_laser = {};

  den.aspects.dj_laser = {
    includes = with den.aspects; [
      (den._.unfree ["slack" "aseprite" "lastpass-password-manager"])
      (den._.user-shell "bash")
      den._.primary-user
      n16-theme._.home

      niri
      vscode
      homeslashmusic
      zoxide
      syncthing
    ];

    user = {
      name = username;
      description = "Devin Myers";
      home = homeDirectory;

      isNormalUser = true;
      group = "users";
      extraGroups = ["networkmanager" "wheel" "dialout"];
    };

    homeManager = {pkgs, ...}: {
      home.username = username;
      home.homeDirectory = homeDirectory;

      programs.git-credential-oauth.enable = true;
      programs.git = {
        enable = true;
        settings.user = {
          name = "DJ_Laser";
          email = "90146620+DJ-Laser@users.noreply.github.com";
        };
      };

      programs.firefox = {
        enable = true;
        profiles.default = {
          id = 0;
          isDefault = true;

          extensions.force = true;
          extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            lastpass-password-manager
            indie-wiki-buddy
            violentmonkey
            youtube-shorts-block
            youtube-suite-search-fixer
          ];
        };
      };
      stylix.targets.firefox = {
        profileNames = ["default"];
        colorTheme.enable = true;
      };

      programs.alacritty.enable = true;
      programs.yazi.enable = true;
      programs.btop.enable = true;
      programs.ripgrep.enable = true;
      programs.fd.enable = true;

      home.shell.enableBashIntegration = true;

      services.mpris-proxy.enable = true;
      services.playerctld.enable = true;

      home.packages = with pkgs; [
        aseprite
        brightnessctl
        playerctl
        vesktop
        slack
        sl
        prismlauncher
        yazi
        wl-clipboard-rs
      ];

      xdg.enable = true;
    };
  };
}
