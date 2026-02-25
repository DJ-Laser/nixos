{
  withSystem,
  inputs,
  ...
}: {
  perSystem = {system, ...}: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = with inputs; [
        niri.overlays.niri
        n16-shell.overlays.default
        homeslashmusic.overlays.default
      ];
      config = {
        allowUnfree = true;
      };
    };
  };

  flake.modules.nixos.nixpkgs = {config, ...}: {
    # Use the configured pkgs from perSystem
    nixpkgs.pkgs = withSystem config.nixpkgs.hostPlatform.system (
      {pkgs, ...}:
      # perSystem module arguments
        pkgs
    );
  };
}
