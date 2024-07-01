{ config, pkgs, ... }:

{

  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    shortcut = "a";
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    secureSocket = false;
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.nord
    ];
    extraConfig = ''
      set -ga terminal-features ",xterm-256color*:RGB"
      set-option -g mouse on
      set-option -g focus-events on
      set -g status-position top
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
    '';
  };
}
