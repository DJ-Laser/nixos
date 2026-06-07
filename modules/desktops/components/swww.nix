{
  den,
  inputs,
  ...
}: {
  den.aspects.awww = {
    homeManager = {
      services.awww = {
        enable = true;
      };
    };

    provides.stylixWallapaperOnActivate = wallpaperPathFn: {
      homeManager = {config, ...}: {
        home.activation = {
          setWallpaper = inputs.home-manager.lib.hm.dag.entryAfter ["writeBoundary"] ''
            run ${config.services.awww.package}/bin/awww img "${config.stylix.image}" \
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
  };
}
