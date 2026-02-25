{inputs, ...}: {
  flake.modules.nixos.system-cli = {
    pkgs,
    lib,
    ...
  }: {
    imports = with inputs.self.modules.nixos; [
      home-manager

      audio
      bluetooth
      boot
      locale
      networking
      printing
      time
      xkb

      greetd

      direnv
      nh
    ];

    # Add some basic packages to the system
    environment.systemPackages = with pkgs; [
      git
      wget
      curl
      zip
      unzip
      alejandra
      nixd
    ];

    programs.nano.enable = false;
    programs.vim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
