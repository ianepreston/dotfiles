set -U fish_greeting
# make sure fish is set as shell
set -x SHELL (which fish)
alias vim="nvim"
starship init fish | source
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end
set -g fish_key_bindings fish_vi_key_bindings
set ssh_keys ~/.ssh/id_rsa ~/.ssh/id_ed25519
for ssh_key in $ssh_keys
    if status is-interactive
        keychain --eval --ignore-missing -Q $ssh_key | source
    end
end
