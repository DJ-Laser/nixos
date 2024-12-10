{
  options,
  config,
  pkgs,
  lib,
  inputs,
  namespace,
  ...
}: {
  config = {
    # Enable nh for easier system management
    programs.nh = {
      enable = lib.mkDefault true;
      clean.enable = lib.mkDefault true;
      clean.extraArgs = lib.mkDefault "--keep-since 5d --keep 5";
      flake = lib.mkDefault "/home/dj_laser/Documents/nixos";
    };

    # Enable direnv for automatic development environments
    programs.direnv = {
      enable = true;

      nix-direnv = {
        enable = true;
      };
    };

    # Disable nano (VERY cringe)
    programs.nano.enable = false;

    # Add some basic packages to the system
    environment.systemPackages = with pkgs; [
      git
      vim
      wget
      curl
    ];

    # Enable the Flakes feature and the accompanying new nix command-line tool
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
