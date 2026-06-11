{self, inputs, ...}: {

  flake.nixosConfigurations.zenbook = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.homeManager
      self.nixosModules.timonModule
      self.nixosModules.zenbookModule
      self.nixosModules.zenbookHardware
    ];
  };
}
