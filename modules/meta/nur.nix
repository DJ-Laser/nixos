{inputs, ...}: {
  den.schema.host.includes = [
    {
      nixos = inputs.nur.modules.nixos.default;
      darwin = inputs.nur.modules.darwin.default;
    }
  ];

  den.schema.home.includes = [
    {
      homeManager = inputs.nur.modules.homeManager.default;
    }
  ];
}
