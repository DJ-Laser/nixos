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
      enable = lib.mkDefault true;

      nix-direnv = {
        enable = lib.mkDefault true;
      };
    };

    programs.nano.enable = false;

    # Add some basic packages to the system
    environment.systemPackages = with pkgs; [
      git
      wget
      curl
      zip
      unzip
      alejandra
      nixd
    ];

    programs.vim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];
    home-manager.backupFileExtension = lib.mkDefault "hm.bak";
  };
}
