{inputs, ...}: {
  den.schema.hm-host.includes = [
    {
      nixos.home-manager = {
        backupFileExtension = "hm.bak";
        useUserPackages = true;
        useGlobalPkgs = true;
      };
    }
  ];
}
