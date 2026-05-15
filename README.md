# dotfiles

Project to archive and backup my dotfiles, so I do not have to
"reconstruct" them everytime, I do a new install.

In most Linux distributions, you can just checkout the repo somewhere and
Symlink the configs to the respective subdirs in `%HOME%/.config/` which
_usually_ maps to `/home/<username>/.config/` but may be different in systems
that are "Atomic", "Immutable" or "Declarative", like NixOS, Fedora Silverblue
or others.

## hypr

Hyprland config, starting at 0.55 in lua

Symlink `<repo>/hypr/<NN>_<Name>.lua` to `%HOME%/.config/hypr/<Name>.lua`

### Todos for hypr

- [ ] Include my notification scripts into the dotfiles repo

## fish

My Fish shell config.

Symlink `<repo>/fish/config.fish` to `%HOME%/.config/fish/config.fish`

## helix

My Helix Editor setup

Symlink `<repo>/helix/config.toml` to `%HOME%/.config/helix/config.toml`
