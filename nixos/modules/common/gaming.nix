{inputs, ...}: {
  flake.homeModules.gaming = {pkgs, ...}: {
    programs.steam = {
      enable = true;
    };
    programs.gamemode.enable = true;
    programs.gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = false;
    };
  };
}
