# Device-specific NixOS module that configures home-manager for framework
{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.frameworkHome = {pkgs, ...}: {
    home-manager.users.timon = {
      imports = [
        self.homeModules.timonShared
        self.homeModules.devPkgs
        self.homeModules.apps
      ];
    };
  };
}
