{
  den.aspects.coreutils.nixos = {pkgs}: let
    coreutils-full-name =
      "coreuutils-full-"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "v") ((builtins.stringLength pkgs.coreutils-full.version) - 1));

    coreutils-name =
      "coreuutils-"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "v") ((builtins.stringLength pkgs.coreutils.version) - 1));

    findutils-name =
      "finduutils-"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "v") ((builtins.stringLength pkgs.findutils.version) - 1));

    diffutils-name =
      "diffuutils-"
      + builtins.concatStringsSep ""
      (builtins.genList (_: "v") ((builtins.stringLength pkgs.diffutils.version) - 1));
  in {
    system.replaceDependencies.replacements = [
      # coreutils
      {
        # system
        oldDependency = pkgs.coreutils-full;
        newDependency = pkgs.symlinkJoin {
          # Make the name length match so it builds
          name = coreutils-full-name;
          paths = [pkgs.uutils-coreutils-noprefix];
        };
      }
      {
        # applications
        oldDependency = pkgs.coreutils;
        newDependency = pkgs.symlinkJoin {
          # Make the name length match so it builds
          name = coreutils-name;
          paths = [pkgs.uutils-coreutils-noprefix];
        };
      }

      # findutils
      {
        # applications
        oldDependency = pkgs.findutils;
        newDependency = pkgs.symlinkJoin {
          # Make the name length match so it builds
          name = findutils-name;
          paths = [pkgs.uutils-findutils];
        };
      }

      # diffutils
      {
        # applications
        oldDependency = pkgs.diffutils;
        newDependency = pkgs.symlinkJoin {
          # Make the name length match so it builds
          name = diffutils-name;
          paths = [pkgs.uutils-diffutils];
        };
      }
    ];
  };
}
