{
  den,
  inputs,
  ...
}: let
  system = "x86_64-linux";
in {
  systems = [system];
  den.hosts.nix-desktop = {
    inherit system;
    users = {
      dj_laser.classes = ["homeManager"];
    };
  };

  den.aspects.nix-desktop = {
    includes = with den.aspects; [
      system-cli
      locale
      cloudflare-warp
      steam
      android-emulation
      septabee
    ];

    nixos = {lib, ...}: {
      hardware.facter.reportPath = ./facter.json;
      imports = with inputs; [
        nixos-hardware.nixosModules.common-gpu-amd
        nixos-hardware.nixosModules.common-cpu-intel
      ];

      powerManagement.cpuFreqGovernor = "performance";

      hardware.graphics = {
        enable = true;
      };

      # Allow acessing NTFS drives
      boot.supportedFilesystems = ["ntfs"];

      services.openssh = {
        enable = true;
        ports = [22];
      };

      services.hardware.openrgb.enable = true;
    };
  };
}
