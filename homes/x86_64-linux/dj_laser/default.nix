{pkgs, ...}: {
  programs.git-credential-oauth.enable = true;
  programs.git = {
    enable = true;
    userName = "DJ_Laser";
    userEmail = "90146620+DJ-Laser@users.noreply.github.com";
  };

  programs.firefox.enable = true;
  programs.ripgrep.enable = true;
  programs.fd.enable = true;

  services.mpris-proxy.enable = true;
  services.playerctld.enable = true;

  djlaser = {
    desktops.niri.enable = true;
    themes.n16.enable = true;

    apps.alacrity.enable = true;
    apps.vscode.enable = true;
    apps.btop.enable = true;
    apps.yazi.enable = true;
    apps.homeslashmusic.enable = true;

    shells.bash.enable = true;
    tools.zoxide.enable = true;

    services.syncthing.enable = true;
  };

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
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
