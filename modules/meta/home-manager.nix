{inputs, ...}: {
  den.ctx.hm-host = {
    nixos.home-manager = {
      backupFileExtension = "hm.bak";
      useUserPackages = true;
      useGlobalPkgs = true;
    };
  };
}
