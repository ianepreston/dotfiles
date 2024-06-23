set -U fish_greeting
alias vim="nvim"
starship init fish | source
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end
set -g fish_key_bindings fish_vi_key_bindings
set ssh_keys ~/.ssh/id_rsa ~/.ssh/id_ed25519
for ssh_key in $ssh_keys
    if status is-interactive and status is-login and test -f $ssh_key
        keychain --eval $ssh_key | source
    end
end
