# Shared user configuration (Home Manager module)
{...}: {
  flake.homeModules.timonShared = {config, ...}: {
    home.username = "timon";
    home.homeDirectory = "/home/timon";
    home.stateVersion = "26.05";

    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Timon Jurschitsch";
          email = "timon.jurschitsch@gmail.com";
        };
        init.defaultBranch = "main";
        rebase.autoStash = true;
        push.autoSetupRemote = true;
        merge.conflictstyle = "zdiff3";
        core.editor = "nvim";
      };
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };

    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/nvim;
    xdg.configFile."atuin".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/atuin;
    xdg.configFile."bat".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/bat;
    xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/hypr;
    xdg.configFile."yazi".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/yazi;
    xdg.configFile."sesh".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/sesh;
    xdg.configFile."wezterm".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/wezterm;
    xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/starship/starship.toml;
    home.file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink /home/timon/.dotfiles/tmux/tmux.conf;
    home.file.".zshrc".source = /home/timon/.dotfiles/terminal/linux/.zshrc;
  };
}
