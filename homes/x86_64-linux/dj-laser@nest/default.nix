{pkgs, ...}: {
  home.username = "dj-laser";
  home.homeDirectory = "/home/dj-laser";

  programs.home-manager.enable = true;

  djlaser = {
    shells.bash.enable = true;
    tools.zoxide.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
