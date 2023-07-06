```markdown
__   __         _         ___        ___     
\ \ / /        /_\       |   \      | _ \       # Yet Another Dotfiles Repo.
 \ V /   _    / _ \   _  | |) |  _  |   /  _ 
  |_|   (_)  /_/ \_\ (_) |___/  (_) |_|_\ (_)   # by @gersonfaneto

```

> **Y.A.D.R.** - "Yet Another Dotfiles Repo". This is the `$HOME` for all my
> configuration files for things like: terminal, shell, text editors and even
> favorite fonts.

<div align="center">

[![Activity](https://img.shields.io/github/last-commit/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=git)](https://github.com/gersonfaneto/YADR/commit/main)
[![License](https://img.shields.io/github/license/gersonfaneto/YADR?color=blue&style=for-the-badge)](https://github.com/gersonfaneto/YADR/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=github)](https://github.com/gersonfaneto/YADR)
[![Distro](https://img.shields.io/badge/DISTRO-Arch-74c7ec?color=blue&style=for-the-badge&logo=arch-linux)](https://archlinux.org/)


</div>

## Usage

> Note: The steps bellow describe how to setup the configuration manually,
> however if you are on an `Arch` based distro you can use the script
> `JARVIS.sh` to have all the dependencies listed bellow installed and the
> configuration files synchronized.

### Dependencies

Make sure to have the following dependencies installed before proceeding!

- bat
- exa
- fd
- fish
- fzf
- github-cli
- glow
- kitty
- neofetch
- neovim
- ripgrep
- starship
- stow
- tmux
- trash-cli
- vim
- zoxide

After installing all the packages listed above use [`stow`](https://www.gnu.org/software/stow/)
to manage the symbolic links for all the files and directories.

1. Clone this repository into your local machine.

```bash
git clone https://github.com/gersonfaneto/Dotfiles --depth 1
```

2. Inside the new folder, use `stow` to create the symbolic links.

```bash
stow */ # Link all the folders.
stow neovim # Link only the `neovim` folder.
```

> **Note**: The [`.stowrc`](https://github.com/gersonfaneto/YADR/blob/main/.stowrc)
> file included makes so that no flags are needed to be passed to the command line.

3. Update the `git` submodules (used for things like for [`tmux-tpm`](https://github.com/tmux-plugins/tpm)).

```bash
git submodule update --init
```

## License

Released under [MIT](https://github.com/gersonfaneto/Dotfiles/blob/main/LICENSE) by [gersonfaneto](https://github.com/gersonfaneto).
