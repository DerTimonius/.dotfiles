{inputs, ...}: {
  flake.homeModules.apps = {pkgs, ...}: {
    home.packages = with pkgs; [
      # browsers
      brave
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

      # communication
      slack
      signal-desktop
      teams-for-linux

      # music
      deezer-desktop

      # styling
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      bibata-cursors

      # other stuff
      localsend
      proton-pass
      tailscale
      grim
      slurp
      hyprpicker
      wl-clipboard
      wtype
      gpu-screen-recorder-gtk
    ];
  };
}
