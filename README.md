# dotfiles
My dotfiles

# Configuring nix

This is going to use nix to both configure required tools and load the dotfiles.

To set it up you can mostly follow [zero to nix](https://zero-to-nix.com/start/install)

For WSL you have to add the following block to `/etc/wsl.conf`

```ini
[boot]
systemd=true
```
After the install get a shell that has home-manager with `nix-shell -p home-manager`.

Probably have to `rm ~/.bashrc` so home-manager can overwrite it.

Then run `home-manager switch --flake ~/dotfiles/#ipreston` to install. Load a new shell and you're set.
