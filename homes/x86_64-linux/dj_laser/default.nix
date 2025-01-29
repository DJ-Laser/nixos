{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "DJ_Laser";
    userEmail = "90146620+DJ-Laser@users.noreply.github.com";
  };

  programs.firefox.enable = true;

  djlaser = {
    desktops.niri.enable = true;
    themes.n16.enable = true;

    apps.alacrity.enable = true;
    apps.vscode.enable = true;

    shells.bash.enable = true;
    tools.zoxide.enable = true;
  };

  home.packages = with pkgs; [
    brightnessctl
    # modrinth-app
    rustdesk
    vesktop
    slack
    sl
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
