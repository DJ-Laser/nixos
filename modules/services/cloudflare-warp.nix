{den, ...}: {
  den.aspects.cloudflare-warp = {
    includes = [
      (den._.unfree ["cloudflare-warp"])
    ];

    nixos = {
      services.cloudflare-warp.enable = true;
    };
  };
}
