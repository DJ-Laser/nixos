{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "DJ_Laser";
    userEmail = "90146620+DJ-Laser@users.noreply.github.com";
  };

  programs.zoxide = {
    enable = true;
  };

  programs.firefox.enable = true;

  djlaser = {
    apps.alacrity.enable = true;
    apps.vscode.enable = true;
    desktops.niri.enable = true;
    shells.bash.enable = true;
  };

  home.packages = with pkgs; [
    modrinth-app
    vesktop
    slack
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
