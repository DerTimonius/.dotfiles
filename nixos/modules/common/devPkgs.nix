{...}: {
  flake.homeModules.devPkgs = {pkgs, ...}: {
    home.packages = with pkgs; [
      # languages and runtimes
      go
      rustup
      fnm
      gcc
      gleam
      bun
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
      # AI stuff
      opencode
      # git stuff
      gh
      graphite-cli
      lazygit
      lazydocker
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
