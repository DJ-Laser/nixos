{
  inputs,
  lib,
  ...
}: {
  flake.modules.nixos.nix-desktop = {
    imports = with inputs.self.modules.nixos; [
      inputs.nixos-hardware.nixosModules.common-gpu-amd
      inputs.nixos-hardware.nixosModules.common-cpu-intel
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
    };

    # Allow acessing NTFS drives
    boot.supportedFilesystems = ["ntfs"];

    services.openssh = {
      enable = true;
      ports = [22];
    };

    # Enable RGB LED control
    services.hardware.openrgb.enable = true;

    services.cloudflare-warp.enable = true;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.11";
  };

  flake.nixosConfigurations.nix-desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86-64_linux";
    modules = with inputs.self.modules.nixos; [nix-desktop nixpkgs];
  };
}
