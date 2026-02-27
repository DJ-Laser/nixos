{
  den,
  inputs,
  ...
}: {
  den.aspects.system-cli = {
    includes = with den.aspects; [
      audio
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

    nixos = {
      pkgs,
      lib,
      ...
    }: {
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
  };
}
