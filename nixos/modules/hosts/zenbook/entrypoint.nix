{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.zenbook = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.homeManager
      self.nixosModules.zenbookHome
      self.nixosModules.zenbookModule
      self.nixosModules.zenbookHardware
    ];
  };
}
