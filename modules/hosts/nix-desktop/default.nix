{
  den,
  inputs,
  ...
}: let
  system = "x86_64-linux";
in {
  systems = [system];
  den.hosts.${system}.nix-desktop = {
    users = {
      dj_laser = {};
    };
  };

  den.aspects.nix-desktop = {
    includes = with den.aspects; [
      system-cli
      steam
      cloudflare-warp
    ];

    nixos = {lib, ...}: {
      imports = with inputs; [
        nixos-hardware.nixosModules.common-gpu-amd
        nixos-hardware.nixosModules.common-cpu-intel
        ./_hardware.nix
      ];

      hardware.graphics = {
        enable = true;
      };

      # Allow acessing NTFS drives
      boot.supportedFilesystems = ["ntfs"];

      services.openssh = {
        enable = true;
        ports = [22];
      };

      # Enable RGB LED control
      services.hardware.openrgb.enable = true;

      services.cloudflare-warp.enable = true;
    };
  };
}
