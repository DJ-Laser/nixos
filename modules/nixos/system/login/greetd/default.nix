{
  options,
  config,
  pkgs,
  lib,
  namespace,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    types
    ;

  cfg = config.${namespace}.services.greetd;
  settingsFormat = pkgs.formats.toml {};

  defaultConfigFile = settingsFormat.generate "greetd.toml" {
    terminal.vt = 1;
    terminal.switch = false;
    default_session.command = "${pkgs.greetd}/bin/agreety -c '$SHELL'";
  };

  runScript = pkgs.writeShellScript "greetd_ttyN" ''
    ${pkgs.greetd}/bin/greetd --vt $(echo $1 | sed s/tty//) --config ${defaultConfigFile}
  '';
in {
  options.${namespace}.services.greetd = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Use greetd + agreety as the virtual console instead of gettys.
      '';
    };

    greeterManagesPlymouth = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Don't configure the greetd service to wait for Plymouth to exit.

        Enable this if the greeter you're using can manage Plymouth itself to provide a smoother handoff.
      '';
    };
  };

  config = mkIf cfg.enable {
    security.pam.services.greetd = {
      allowNullPassword = true;
      startSession = true;
      enableGnomeKeyring = lib.mkDefault config.services.gnome.gnome-keyring.enable;
    };

    systemd.services."greetdvt@" = {
      after =
        [
          "systemd-user-sessions.service"
        ]
        ++ lib.optionals (!cfg.greeterManagesPlymouth) [
          "plymouth-quit-wait.service"
        ];

      serviceConfig = {
        ExecStart = "${runScript} %I";

        Restart = "always";

        # Defaults from greetd upstream configuration
        IgnoreSIGPIPE = false;
        SendSIGHUP = true;
        TimeoutStopSec = "30s";
        KeyringMode = "shared";

        Type = "idle";
      };

      # Don't kill a user session when using nixos-rebuild
      restartIfChanged = false;
      aliases = ["autovt@.service"];
    };

    systemd.suppressedSystemUnits = ["autovt@.service"];
    systemd.defaultUnit = "graphical.target";

    # Create directories potentially required by supported greeters
    # See https://github.com/NixOS/nixpkgs/issues/248323
    systemd.tmpfiles.rules = [
      "d '/var/cache/tuigreet' - greeter greeter - -"
    ];

    users.users.greeter = {
      isSystemUser = true;
      group = "greeter";
    };

    users.groups.greeter = {};
  };
}
