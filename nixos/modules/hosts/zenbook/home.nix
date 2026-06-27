# Device-specific NixOS module that configures home-manager for zenbook
{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.zenbookHome = {pkgs, ...}: {
    home-manager.users.timon = {
      imports = [
        self.homeModules.timonShared
        self.homeModules.devPkgs
        self.homeModules.apps
      ];
    };
  };
}
