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
