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
      cloudflare-warp
      steam
    ];

    nixos = {pkgs, ...}: {
      hardware.facter.reportPath = ./_facter.json;
      imports = with inputs; [
        nixos-hardware.nixosModules.framework-13th-gen-intel
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

      services.fwupd.enable = true;
    };
  };
}
