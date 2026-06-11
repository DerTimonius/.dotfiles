{self, inputs, ...}: {
  flake.homeModules.timonModule = {...}: {
    imports = [
      self.nixosModules.timonModule
    ];
  };
}
