{
  den,
  inputs,
  lib,
  ...
}: let
  system = "x86_64-linux";
in {
  systems = [system];
  den.hosts.${system}.laser-book = {
    users = {
      dj_laser = {};
    };
  };

  den.aspects.laser-book = {
    includes = with den.aspects; [
      system-cli
      n16-theme._.host
      cloudflare-warp
      steam
    ];

    nixos = {pkgs, ...}: {
      hardware.facter.reportPath = ./facter.json;
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

      time.timeZone = "America/New_York";
      i18n.defaultLocale = "en_US.UTF-8";
      console.keyMap = "us";
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      environment.systemPackages = with pkgs; [
        fw-ectool
      ];
    };
  };
}
