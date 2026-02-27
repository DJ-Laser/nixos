{
  den.aspects.laser-book.nixos = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/9b7660f4-1f56-4e52-ba0d-ac6307b82fe4";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/00B7-CE68";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/196664ce-ed21-4bbb-b83d-ecbbc043196f";}
    ];
  };
}
