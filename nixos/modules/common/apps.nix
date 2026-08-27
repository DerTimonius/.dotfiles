{inputs, ...}: {
  flake.homeModules.apps = {pkgs, ...}: {
    home.packages = with pkgs; [
      # browsers
      brave
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

      # communication
      slack
      unstable.signal-desktop
      teams-for-linux

      # music
      deezer-desktop

      # styling
      bibata-cursors
      catppuccin-cursors.mochaDark
      catppuccin-cursors.mochaLight

      # GUIs
      localsend
      proton-pass
      tailscale
      rapidraw

      # other stuff
      grim
      slurp
      hyprpicker
      wl-clipboard
      wtype
      gpu-screen-recorder-gtk
      unzip
    ];
  };
}
