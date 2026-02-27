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
    den._.define-user
    den._.inputs'
    den._.self'
  ];
}
