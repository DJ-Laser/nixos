{
  den,
  inputs,
  lib,
  ...
}: {
  den.aspects.desktop-wallpaper = {
    homeManager = {
      config,
      options,
      ...
    }: {
      services.awww = {
        enable = true;
      };

      home.activation.setWallpaper = inputs.home-manager.lib.hm.dag.entryAfter ["writeBoundary"] ''
        run ${lib.getExe config.services.awww.package} img "${config.stylix.image}" \
          --transition-fps 60 \
          --transition-duration 2 \
          --transition-type random \
          --transition-pos top-right \
          --transition-bezier .3,0,0,.99 \
          --transition-angle 135 || true
      '';
    };
  };
}
