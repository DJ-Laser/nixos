{
  den,
  inputs,
  ...
}: {
  _module.args.__findFile = den.lib.__findFile;
  imports = [
    inputs.den.flakeModule
  ];

  den.schema.host.includes = [den.batteries.mutual-provider];
  den.default.includes = [
    den.batteries.define-user
    den.batteries.hostname
    den.batteries.inputs'
    den.batteries.self'
  ];

  den.migrations.user-host-content.acknowledged = true;
}
