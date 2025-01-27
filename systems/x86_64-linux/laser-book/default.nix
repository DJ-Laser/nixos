{
  lib,
  pkgs,
  config,
  namespace,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

  services.openssh = {
    enable = true;
    ports = [22];
  };

  # Enable RGB LED control
  services.hardware.openrgb.enable = true;
  services.cloudflare-warp.enable = true;
  services.printing.enable = true;

  djlaser = {
    desktops.niri.enable = true;
    apps.steam.enable = true;
    themes.djlaser.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
