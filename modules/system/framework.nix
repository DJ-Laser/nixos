{
  den,
  inputs,
  ...
}: {
  den.aspects.framework = {
    nixos = {pkgs, ...}: {
      services.fwupd.enable = true;

      environment.systemPackages = with pkgs; [
        fw-ectool
      ];
    };

    intel-13 = {
      includes = [den.aspects.framework];

      nixos = {pkgs, ...}: {
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
      };
    };
  };
}
