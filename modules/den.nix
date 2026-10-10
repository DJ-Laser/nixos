{
  den,
  inputs,
  ...
}: {
  _module.args.__findFile = den.lib.__findFile;
  imports = [
    inputs.den.flakeModule
  ];

  den.default.includes = [
    den.batteries.define-user
    den.batteries.hostname
    den.batteries.inputs'
    den.batteries.self'
  ];
}
