{
  inputs,
  lib,
  ...
}: {
  flake.modules.nixos.laser-book = {pkgs, ...}: {
    imports = with inputs.self.modules.nixos; [
      inputs.nixos-hardware.nixosModules.framework-13th-gen-intel
      inputs.stylix.nixosModules.stylix
      home-manager
      ./_hardware.nix

      system-cli
      niri
      steam
      n16-theme

      dj_laser
    ];

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
        intel-vaapi-driver
        intel-media-driver
      ];
    };

    services.openssh = {
      enable = true;
      ports = [22];
    };

    # Enable RGB LED control
    services.hardware.openrgb.enable = true;
    services.cloudflare-warp.enable = true;
    services.fwupd.enable = true;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.11";
  };

  flake.nixosConfigurations.laser-book = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos; [
      laser-book
      nixpkgs
    ];
  };
}
