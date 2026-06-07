{den, ...}: {
  den.aspects.cloudflare-warp = {
    includes = [
      (den.batteries.unfree ["cloudflare-warp"])
    ];

    nixos = {
      services.cloudflare-warp.enable = true;
    };
  };
}
