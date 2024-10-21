{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      save = 10000;
      share = true;
      size = 10000;
    };
    initExtra = ''
      eval "$(starship init zsh)"
      alias vim="nvim"
      alias vi="nvim"
      if [ -z "$SSH_AUTH_SOCK" ]; then
         # Check for a currently running instance of the agent
         RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
         if [ "$RUNNING_AGENT" = "0" ]; then
              # Launch a new instance of the agent
              ssh-agent -s &> $HOME/.ssh/ssh-agent
         fi
         eval `cat $HOME/.ssh/ssh-agent`
      fi
      if [ -d /usr/share/pyenv ]; then
        export PYENV_ROOT=/usr/share/pyenv
        export PATH="$PYENV_ROOT/bin:$PATH"
        export PATH="$PYENV_ROOT/shims:$PATH"
        eval "$(pyenv init -)"
      fi
      export PATH="$HOME/.local/bin:$PATH"
      source ~/.taloscomplete.zsh
      eval "$(direnv hook zsh)"
    '';
    # oh-my-zsh = {
    #   enable = true;
    #   extraConfig = ''
    #     zstyle :omz:plugins:keychain agents gpg,ssh
    #     zstyle :omz:plugins:keychain identities id_ed25519 id_rsa
    #     zstyle :omz:plugins:keychain options --quiet --ignore-missing -Q
    #   '';
    #   plugins = [ "keychain" ];
    # };
  };
}
