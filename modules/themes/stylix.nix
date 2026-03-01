{
  den,
  inputs,
  ...
}: {
  den.aspects.stylix = den.lib.parametric.exactly {
    includes = [
      ({host, ...}: {
        nixos = {lib, ...}: {
          imports = [
            inputs.stylix.nixosModules.stylix
          ];

          stylix = {
            enable = true;
            autoEnable = lib.mkDefault false;
            homeManagerIntegration = {
              autoImport = true;
              followSystem = true;
            };
          };
        };

        darwin = {lib, ...}: {
          imports = [
            inputs.stylix.darwinModules.stylix
          ];

          stylix = {
            enable = true;
            autoEnable = lib.mkDefault false;
            homeManagerIntegration = {
              autoImport = true;
              followSystem = true;
            };
          };
        };
      })
      ({home, ...}: {
        homeManager = {lib, ...}: {
          imports = [
            inputs.stylix.homeModules.stylix
          ];
          stylix = {
            enable = true;
            autoEnable = lib.mkDefault false;
          };
        };
      })
    ];
  };
}
