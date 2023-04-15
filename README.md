<h1 align="center">YADR</h1>

<div align="center">

[![Activity](https://img.shields.io/github/last-commit/gersonfaneto/YADR?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/YADR/commit/main)
[![License](https://img.shields.io/github/license/gersonfaneto/YADR?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/YADR/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/gersonfaneto/YADR?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/YADR)

</div>

> _Y.A.D.R._ - "Yet Another Dotfiles Repo". This is the `$HOME` for all my configuration files for things like:
> terminal, shell, text editors and even favorite fonts.

<h4 align="center">
  <a href="#usage">Usage</a>
  ·
  <a href="#license">License</a>
</h4>

## Usage

I'm currently using [`stow`](https://www.gnu.org/software/stow/) to manage the symlinks off all the
files and directories in it, so make sure you have it installed before proceeding.

1. Clone this repository into your local machine.

```bash
git clone https://github.com/gersonfaneto/Dotfiles --depth 1
```

2. Inside the new folder, run `stow`.

```bash
stow */
```

> **Note**: The [`.stowrc`](https://github.com/gersonfaneto/YADR/blob/main/.stowrc) file included makes so that no 
> flags are needed to be passed to the command line.

3. Update the `git` submodules (used for things like for [`tmux-tpm`](https://github.com/tmux-plugins/tpm)).

```bash
git submodule update --init
```

> **Note**: You can also select individually the folders you want to stow by providing their name.
>
> ```bash
> stow nvim
> ```

## TODO

- [ ] `JARVIS.sh` - Basic script for automatic installing configurations, programs and dependencies.

## License

Released under [MIT](https://github.com/gersonfaneto/Dotfiles/blob/main/LICENSE) by [gersonfaneto](https://github.com/gersonfaneto).
