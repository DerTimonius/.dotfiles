{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.homeManager
      self.nixosModules.frameworkHome
      self.nixosModules.frameworkModule
      self.nixosModules.frameworkHardware
    ];
  };
}
