{inputs, ...}: {
  den.aspects.swww = {
    homeManager = {
      config,
      lib,
      ...
    }: let
      cfg = config.services.swww;
    in {
      services.swww = {
        enable = true;
      };

      home.activation = {
        setWallpaper = inputs.home-manager.lib.hm.dag.entryAfter ["writeBoundary"] ''
          run ${cfg.package}/bin/swww img "${config.stylix.image}" \
            --transition-fps 60 \
            --transition-duration 2 \
            --transition-type random \
            --transition-pos top-right \
            --transition-bezier .3,0,0,.99 \
            --transition-angle 135 || true
        '';
      };
    };
  };
}
