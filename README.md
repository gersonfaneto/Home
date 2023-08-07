```markdown
__   __         _         ___        ___     
\ \ / /        /_\       |   \      | _ \       # Yet Another Dotfiles Repo.
 \ V /   _    / _ \   _  | |) |  _  |   /  _ 
  |_|   (_)  /_/ \_\ (_) |___/  (_) |_|_\ (_)   # by @gersonfaneto

```

> **Y.A.D.R.** - "Yet Another Dotfiles Repo". This is the `$HOME` for all the
> configuration files that make my day-to-day as a developer more pleasant.

<div align="center">

[![Activity](https://img.shields.io/github/last-commit/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=git)](https://github.com/gersonfaneto/YADR/commit/main)
[![License](https://img.shields.io/github/license/gersonfaneto/YADR?color=blue&style=for-the-badge)](https://github.com/gersonfaneto/YADR/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=github)](https://github.com/gersonfaneto/YADR)
[![Repo-Size](https://img.shields.io/github/repo-size/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=github)](https://github.com/gersonfaneto/YADR)
[![Distro](https://img.shields.io/badge/DISTRO-Arch-74c7ec?color=blue&style=for-the-badge&logo=arch-linux)](https://archlinux.org/)

</div>

## Usage

> 📝 **Note**  
> The steps bellow describe how to setup the configuration manually,
> however if you are on an `Arch` based distro you can use the script
> `JARVIS.sh` to have all the dependencies listed bellow installed and the
> configuration files synchronized automatically.

### Dependencies

Make sure to have the following dependencies installed before proceeding.

```markdown
lf bat exa fd fish fzf git github-cli glow kitty neofetch neovim ripgrep
starship stow tmux trash-cli zoxide
```

After installing all the packages listed above follow the steps ahead.

- Clone this repository into your local machine.

```shell
git clone https://github.com/gersonfaneto/YADR --depth 1
```

- Update the `bat` themes.

```shell
bat cache --build
```

- Update the font cache.

```shell
fc-cache -fv
```

- Inside the project folder, use `stow` to manage the symbolic links for the
  configurations.

```shell
stow */ # Link all the folders.
stow neovim # Link only the `neovim` folder.
stow -D neovim # Remove the link for the `neovim` folder.
```

> 📝 **Note**  
> The [`.stowrc`](https://github.com/gersonfaneto/YADR/blob/main/.stowrc)
> file included makes so that no flags are needed to be passed to the command
> line.

## TODOs

- [ ] Fix `JARVIS.sh` - Packages are failing to install. No idea why 🫠.

## License

Released under [MIT](https://github.com/gersonfaneto/YADR/blob/main/LICENSE) by [gersonfaneto](https://github.com/gersonfaneto).
