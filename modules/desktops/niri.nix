{
  den,
  inputs,
  ...
}: {
  den.aspects.niri = {
    includes = with den.aspects; [
      swww
      mako
      n16-shell
      hypridle
      hyprlock
    ];

    nixos = {
      imports = [
        inputs.niri.nixosModules.niri
      ];

      programs.niri.enable = true;
    };

    homeManager = {
      config,
      lib,
      pkgs,
      ...
    }: {
      stylix.targets.niri.enable = true;

      home.packages = [pkgs.xwayland-satellite];

      programs.niri.settings = {
        prefer-no-csd = true;
        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        binds = import ./_niri-binds {
          inherit lib pkgs;
          actions = config.lib.niri.actions;
          screenLocker = "hyprlock";
        };

        switch-events.lid-close.action.spawn = "hyprlock";
      };

      home.sessionVariables = {
        # vscode and other apps don't want to default to wayland but work when forced
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      };
    };
  };
}
