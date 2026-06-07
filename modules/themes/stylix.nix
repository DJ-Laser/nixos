{
  den,
  inputs,
  ...
}: {
  den.aspects.stylix = {
    provides.host = {host}: {
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

      darwin = {lib}: {
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
    };

    provides.home = {home}: {
      homeManager = {lib, ...}: {
        imports = [
          inputs.stylix.homeModules.stylix
        ];
        stylix = {
          enable = true;
          autoEnable = lib.mkDefault false;
        };
      };
    };

    includes = with den.aspects.stylix; [host home];
  };
}
