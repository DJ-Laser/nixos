{inputs, ...}: let
  username = "dj_laser";
  homeDirectory = "/home/${username}";
in {
  flake.modules.nixos.dj_laser = {
    users.users.dj_laser = {
      name = username;
      description = "Devin Myers";
      home = homeDirectory;

      isNormalUser = true;
      group = "users";
      extraGroups = ["networkmanager" "wheel" "dialout"];
    };

    home-manager.users.dj_laser =
      inputs.self.modules.homeManager.dj_laser;
  };

  flake.modules.homeManager.dj_laser = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
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
      # modrinth-app
      vesktop
      slack
      sl
      prismlauncher
      yazi
      wl-clipboard-rs
    ];

    xdg.enable = true;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "24.11";
  };
}
