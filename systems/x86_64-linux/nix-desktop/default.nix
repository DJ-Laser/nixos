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

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.beta;

    # Makes 3d printer software work ._.
    /*
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "555.58.02";
      sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
      sha256_aarch64 = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
      openSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
      settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
      persistencedSha256 = lib.fakeSha256;
    };
    */
  };

  # Allow acessing NTFS drives
  boot.supportedFilesystems = ["ntfs"];

  services.openssh = {
    enable = true;
    ports = [22];
  };

  # Enable RGB LED control
  services.hardware.openrgb.enable = true;

  services.printing.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  djlaser = {
    desktops.niri.enable = true;
    apps.steam.enable = true;
    themes.djlaser.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
