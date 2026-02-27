{den, ...}: {
  den.ctx.host.includes = [
    ({host}: {nixos.networking.hostName = host.hostName;})
  ];

  den.aspects.networking = {
    nixos.networking.networkmanager.enable = true;
  };
}
