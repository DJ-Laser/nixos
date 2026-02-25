{inputs, ...}: {
  flake.modules.nixos.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      backupFileExtension = "hm.bak";
      useUserPackages = true;
      useGlobalPkgs = true;
    };
  };
}
