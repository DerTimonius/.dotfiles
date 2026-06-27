{...}: {
  flake.homeModules.devPkgs = {pkgs, ...}: {
    home.packages = with pkgs; [
      # languages
      go
      rustup
      fnm
      gcc
      gleam
      # terminal and tools
      wezterm
      starship
      tmux
      zellij
      sesh
      yazi
      delta
      fzf
      zoxide
      eza
      bat
      atuin
      jq
      ripgrep
      hyperfine
      # git stuff
      gh
      graphite-cli
      # editors
      vim
      neovim
      zed-editor
      # GUIs
      yaak
      # misc
      alejandra
      mise
      gum
      fastfetch
    ];
  };
}
