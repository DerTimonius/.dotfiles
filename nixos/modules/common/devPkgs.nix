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
      btop
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
      # nix stuff
      alejandra
      statix
      nh
      comma
      # misc
      mise
      gum
      fastfetch
      openssl
      # from nixpkgs-unstable
      unstable.tabularis
    ];
  };
}
