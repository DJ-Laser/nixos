{inputs, ...}: {
  den.ctx.host.includes = [
    {
      nixos = inputs.nur.modules.nixos.default;
      darwin = inputs.nur.modules.darwin.default;
    }
  ];

  den.ctx.home.includes = [
    {
      homeManager = inputs.nur.modules.homeManager.default;
    }
  ];
}
