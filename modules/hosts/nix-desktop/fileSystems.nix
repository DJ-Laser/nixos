{
  den.aspects.nix-desktop.nixos = {
    fileSystems."/" = {
      device = "/dev/nvme0n1p2";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/nvme0n1p1";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/33ab94d9-ec11-44fa-9a9d-1cf0e3bdb524";}
    ];
  };
}
