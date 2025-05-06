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
      alias vim="nvim"
      alias vi="nvim"
      eval "$(starship init zsh)"
      if [ -z "$SSH_AUTH_SOCK" ]; then
         # Check for a currently running instance of the agent
         RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
         if [ "$RUNNING_AGENT" = "0" ]; then
              # Launch a new instance of the agent
              ssh-agent -s &> $HOME/.ssh/ssh-agent
         fi
         eval `cat $HOME/.ssh/ssh-agent`
      fi
      eval "$(direnv hook zsh)"
    '';
  };
}
