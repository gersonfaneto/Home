<h1 align="center">
    Y.A.D.R.
</h1>

<div align="center">

[![Activity](https://img.shields.io/github/last-commit/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=git)](https://github.com/gersonfaneto/YADR/commit/main)
[![License](https://img.shields.io/github/license/gersonfaneto/YADR?color=blue&style=for-the-badge)](https://github.com/gersonfaneto/YADR/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=github)](https://github.com/gersonfaneto/YADR)

</div>

> **Y.A.D.R.** - "Yet Another Dotfiles Repo". This is the `$HOME` for all my
> configuration files for things like: terminal, shell, text editors and even
> favorite fonts.

## Usage

I'm currently using [`stow`](https://www.gnu.org/software/stow/) to manage
the symlinks off all the files and directories in it, so make sure you have
it installed before proceeding.

1. Clone this repository into your local machine.

```bash
git clone https://github.com/gersonfaneto/Dotfiles --depth 1
```

2. Inside the new folder, use `stow` to manage the symlinks.

```bash
stow */ # Will link all the folders.
stow neovim # Will link only the `neovim` folder.
```

> **Note**: The [`.stowrc`](https://github.com/gersonfaneto/YADR/blob/main/.stowrc)
> file included makes so that no flags are needed to be passed to the command line.

3. Update the `git` submodules (used for things like for [`tmux-tpm`](https://github.com/tmux-plugins/tpm)).

```bash
git submodule update --init
```

## License

Released under [MIT](https://github.com/gersonfaneto/Dotfiles/blob/main/LICENSE) by [gersonfaneto](https://github.com/gersonfaneto).
