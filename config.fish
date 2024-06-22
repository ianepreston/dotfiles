set -U fish_greeting
alias vim="nvim"
starship init fish | source
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end
set -g fish_key_bindings fish_vi_key_bindings
fish_ssh_agent
