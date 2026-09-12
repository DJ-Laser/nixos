{
  den,
  inputs,
  ...
}: let
  system = "x86_64-linux";
in {
  systems = [system];
  den.hosts.${system}.laser-book = {
    users = {
      dj_laser.classes = ["homeManager"];
    };
  };

  den.aspects.laser-book = {
    includes = with den.aspects; [
      framework.intel-13
      system-cli
      n16-theme.host
      cloudflare-warp
      locale
      steam
    ];

    nixos = {pkgs, ...}: {
      hardware.facter.reportPath = ./facter.json;

      services.openssh = {
        enable = true;
        ports = [22];
      };
    };
  };
}
