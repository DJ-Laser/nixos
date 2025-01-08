{pkgs, ...}: {
  home.userName = "dj-laser";
  home.homeDirectory = "/home/dj-laser";

  programs.home-manager.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
