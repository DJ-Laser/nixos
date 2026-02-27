{
  inputs,
  den,
  ...
}: let
  username = "dj_laser";
  homeDirectory = "/home/${username}";
in {
  den.aspects.dj_laser = {
    includes = with den.aspects; [
      (den._.unfree ["slack" "aseprite"])
      den._.primary-user
      n16-theme

      niri
      alacrity
      vscode
      btop
      yazi
      homeslashmusic
      bash
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

      programs.firefox.enable = true;
      programs.ripgrep.enable = true;
      programs.fd.enable = true;

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
