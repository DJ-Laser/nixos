{
  den,
  inputs,
  lib,
  ...
}: {
  den.hosts.x86_64-linux.laser-book = {
    users = {
      dj_laser = {};
    };
  };

  den.aspects.laser-book = {
    includes = with den.aspects; [
      system-cli
      steam
      cloudflare-warp
    ];

    nixos = {pkgs, ...}: {
      imports = with inputs; [
        nixos-hardware.nixosModules.framework-13th-gen-intel
        ./_hardware.nix
      ];

      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          vpl-gpu-rt
          intel-vaapi-driver
          intel-media-driver
        ];
      };

      services.openssh = {
        enable = true;
        ports = [22];
      };

      # Enable RGB LED control
      services.hardware.openrgb.enable = true;
      services.fwupd.enable = true;
    };
  };
}
